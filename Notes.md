eks-bastion

[profile eks-bastion]
region = ap-northeast-2
role_arn = arn:aws:iam::358871393576:role/prod-bastion-role
source_profile = default


$ cat credentials
[default]
aws_access_key_id =  AKIAVHDTG4UUBGNWLHPB
aws_secret_access_key = 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


$ aws sts get-caller-identity
{
    "UserId": "AIDAVHDTG4UUC2AAFW4PL",
    "Account": "358871393576",
    "Arn": "arn:aws:iam::358871393576:user/Ashutosh-Bambal"
}


AWS_PROFILE=eks-bastion aws sts get-caller-identity


$ AWS_PROFILE=eks-bastion aws sts get-caller-identity
{
    "UserId": "AROAVHDTG4UUNNFOI4MI4:botocore-session-1769014340",
    "Account": "358871393576",
    "Arn": "arn:aws:sts::358871393576:assumed-role/prod-bastion-access-role/botocore-session-1769014340"
}

AWS_PROFILE=eks-bastion aws eks update-kubeconfig \
  --region ap-northeast-2 \
  --name Shared-cluster \
  --alias eks-bastion
