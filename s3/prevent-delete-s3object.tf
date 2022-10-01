provider "aws" {
}

resource "aws_organizations_policy" "scp" {
  name = "scp_s3"
  description = "This SCP prevents users or roles in any affected account from deleting any S3 bucket or objects. "
  content = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:DeleteBucket",
        "s3:DeleteObject",
        "s3:DeleteObjectVersion"
      ],
      "Resource": "*",
      "Effect": "Deny"
    }
  ]
}
POLICY

}