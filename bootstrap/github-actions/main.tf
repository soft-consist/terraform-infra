provider "aws" {
  region = "ap-south-1"
}

resource "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = ["sts.amazonaws.com"]

  thumbprint_list = [
    "6938fd4d98bab03faadb97b34396831e3780aea1"
  ]
}

resource "aws_iam_role" "github_actions" {
  name = "github-actions-terraform-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [

      # 1️⃣ GitHub Actions (OIDC)
      {
        Effect = "Allow"
        Principal = {
          Federated = aws_iam_openid_connect_provider.github.arn
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringLike = {
            "token.actions.githubusercontent.com:sub" = "repo:Kalyani-Bambal/terraform-infra:*"
          }
        }
      },

      # 2️⃣ Human access (local laptop users)
      {
        Effect = "Allow"
        Principal = {
          AWS = [
            "arn:aws:iam::358871393576:user/Kalyani-Bambal",
            "arn:aws:iam::358871393576:user/Ashutosh-Bambal"
          ]
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "admin" {
  role       = aws_iam_role.github_actions.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# existing role + OIDC code above ...

resource "aws_iam_user_policy" "allow_assume_role" {
  name = "allow-assume-github-actions-role"
  user = "Ashutosh-Bambal"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "sts:AssumeRole"
        Resource = aws_iam_role.github_actions.arn
      }
    ]
  })
}

