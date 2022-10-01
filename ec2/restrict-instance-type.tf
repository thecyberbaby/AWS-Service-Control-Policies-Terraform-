provider "aws" {
}

resource "aws_organizations_policy" "scp" {
  name = "scp_ec2_instance_type"
  description = "This SCP prevents the launch of any EC2 instance type that is not whitelisted by the policy (default: t3.micro). "
  content = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:RunInstances"
      ],
      "Resource": "*",
      "Effect": "Deny",
      "Condition": {
        "StringNotEquals": {
          "ec2:InstanceType": "t2.micro"
        }
      }
    }
  ]
}
POLICY

}
