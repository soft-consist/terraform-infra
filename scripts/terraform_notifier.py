#!/usr/bin/env python3
import os
import requests
import sys

GITHUB_API = "https://api.github.com"

def fail(msg):
    print(f"❌ {msg}")
    sys.exit(1)

def get_env(var):
    value = os.getenv(var)
    if not value:
        fail(f"Missing environment variable: {var}")
    return value

def read_plan(plan_path):
    try:
        with open(plan_path, "r") as f:
            return f.read()
    except FileNotFoundError:
        fail(f"Plan file not found: {plan_path}")

def get_existing_comment(headers, owner, repo, pr_number, marker):
    url = f"{GITHUB_API}/repos/{owner}/{repo}/issues/{pr_number}/comments"
    r = requests.get(url, headers=headers)
    r.raise_for_status()

    for comment in r.json():
        if marker in comment["body"]:
            return comment["id"]
    return None

def create_or_update_comment(headers, owner, repo, pr_number, body, marker):
    comment_id = get_existing_comment(headers, owner, repo, pr_number, marker)

    if comment_id:
        url = f"{GITHUB_API}/repos/{owner}/{repo}/issues/comments/{comment_id}"
        requests.patch(url, headers=headers, json={"body": body}).raise_for_status()
        print("♻️ Updated existing PR comment")
    else:
        url = f"{GITHUB_API}/repos/{owner}/{repo}/issues/{pr_number}/comments"
        requests.post(url, headers=headers, json={"body": body}).raise_for_status()
        print("🆕 Created new PR comment")

def main():
    # 1️⃣ Read required environment variables
    token = get_env("GITHUB_TOKEN")
    repo = get_env("GITHUB_REPOSITORY")
    pr_number = get_env("PR_NUMBER")
    environment = get_env("TF_ENV").upper()
    plan_path = get_env("PLAN_PATH")

    owner, repo_name = repo.split("/")

    # 2️⃣ Read terraform plan output
    plan = read_plan(plan_path)

    # 3️⃣ Marker for idempotent PR comments
    marker = f"<!-- terraform-plan-{environment.lower()} -->"

    body = f"""
{marker}
### 🌍 Terraform Plan – **{environment}**

<details>
<summary>Click to expand</summary>

```terraform
{plan}

</details> """

# 4️⃣ Headers for GitHub API
headers = {
    "Authorization": f"Bearer {token}",
    "Accept": "application/vnd.github+json",
}

# 5️⃣ Create or update PR comment
create_or_update_comment(
    headers=headers,
    owner=owner,
    repo=repo_name,
    pr_number=pr_number,
    body=body,
    marker=marker,
)
if __name__ == "__main__":
    main()
