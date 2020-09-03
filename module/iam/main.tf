### IAM Role
resource "aws_iam_role" "EKS-ROLE" {
    name               = "EKS-ROLE"
    path               = "/"
    assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy" "EKS-ROLE-ASG" {
    name   = "EKS-ROLE-ASG"
    role   = aws_iam_role.EKS-ROLE.name
    policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "autoscaling:DescribeAutoScalingGroups",
        "autoscaling:DescribeAutoScalingInstances",
        "autoscaling:DescribeLaunchConfigurations",
        "autoscaling:DescribeTags",
        "autoscaling:SetDesiredCapacity",
        "autoscaling:TerminateInstanceInAutoScalingGroup",
        "ec2:DescribeLaunchTemplateVersions"
      ],
      "Resource": "*",
      "Effect": "Allow"
    }
  ]
}
POLICY
}

resource "aws_iam_policy_attachment" "EKS-ROLE-AmazonEKSServicePolicy" {
    name       = "EKS-ROLE-AmazonEKSServicePolicy"
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
    roles      = [aws_iam_role.EKS-ROLE.name]
}

resource "aws_iam_policy_attachment" "EKS-ROLE-AmazonEKSClusterPolicy" {
    name       = "EKS-ROLE-AmazonEKSClusterPolicy"
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    roles      = [aws_iam_role.EKS-ROLE.name]
}