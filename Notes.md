eks-bastion

[profile eks-bastion]
region = ap-northeast-2
role_arn = arn:aws:iam::xxx:role/prod-bastion-role
source_profile = default


$ cat credentials
[default]
aws_access_key_id =  xxx
aws_secret_access_key = xxx


$ aws sts get-caller-identity
{
    "UserId": "xxx",
    "Account": "xxx",
    "Arn": "arn:aws:iam::xxx:user/xxx"
}


AWS_PROFILE=eks-bastion aws sts get-caller-identity


$ AWS_PROFILE=eks-bastion aws sts get-caller-identity
{
    "UserId": "xxx",
    "Account": "xxx",
    "Arn": "arn:aws:sts::xxx:assumed-role/prod-bastion-access-role/xxx"
}

AWS_PROFILE=eks-bastion aws eks update-kubeconfig \
  --region ap-northeast-2 \
  --name Shared-cluster \
  --alias eks-bastion
