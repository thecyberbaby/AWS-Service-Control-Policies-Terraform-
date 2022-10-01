resource "aws_organizations_policy" "scp_root_user" {
  name = "scp_root_account"
  description = "This SCP prevents restricts the root user in an AWS account from taking any action, either directly as a command or through the console. "
  content = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "*",
      "Resource": "*",
      "Effect": "Deny",
      "Condition": {
        "StringLike": {
          "aws:PrincipalArn": [
            "arn:aws:iam::*:root"
          ]
        }
      }
    }
  ]
}
POLICY

}
