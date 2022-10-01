provider "aws" {
}

resource "aws_organizations_policy" "scp" {
  name = "scp_deny_iam_user_creation"
  description = "This SCP restricts IAM principals from creating new IAM users or IAM Access Keys in an AWS account."
  content = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "iam:CreateUser",
        "iam:CreateAccessKey"
      ],
      "Resource": [
        "*"
      ],
      "Effect": "Deny"
    }
  ]
}
POLICY

}
