provider "aws" {
}

resource "aws_organizations_policy" "scp" {
  name = "scp_igw"
  description = "This SCP prevents users or roles in any affected account from changing the configuration of your Amazon EC2 virtual private clouds (VPCs) to grant them direct access to the internet. It doesn't block existing direct access or any access that routes through your on-premises network environment. "
  content = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:AttachInternetGateway",
        "ec2:CreateInternetGateway",
        "ec2:AttachEgressOnlyInternetGateway",
        "ec2:CreateVpcPeeringConnection",
        "ec2:AcceptVpcPeeringConnection"
      ],
      "Resource": "*",
      "Effect": "Deny"
    },
    {
      "Action": [
        "globalaccelerator:Create*",
        "globalaccelerator:Update*"
      ],
      "Resource": "*",
      "Effect": "Deny"
    }
  ]
}
POLICY

}