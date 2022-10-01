resource "aws_organizations_policy" "scp" {
  name = "scp_flowlogs"
  description = "This SCP prevents users or roles in any affected account from deleting Amazon EC2 flow logs or CloudWatch log groups or log streams. "
  content = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:DeleteFlowLogs",
        "logs:DeleteLogGroup",
        "logs:DeleteLogStream"
      ],
      "Resource": "*",
      "Effect": "Deny"
    }
  ]
}
POLICY

}