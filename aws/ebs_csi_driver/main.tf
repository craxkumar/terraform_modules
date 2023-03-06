data "aws_caller_identity" "current" {}
data "aws_eks_cluster" "cluster" {
  name = "${var.cluster-name}"
}

resource "aws_iam_role" "ebs_csi_role" {
    name = "AmazonEKS_EBS_CSI_DriverRole"
    assume_role_policy = jsonencode({
        "Version": "2012-10-17",
        "Statement": [
            {
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/oidc.eks.ap-south-1.amazonaws.com/id/${split("/", data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer)[length(split("/", data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer))-1]}"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringEquals": {
                "oidc.eks.${var.region}.amazonaws.com/id/${split("/", data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer)[length(split("/", data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer))-1]}:aud": "sts.amazonaws.com",
                "oidc.eks.${var.region}.amazonaws.com/id/${split("/", data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer)[length(split("/", data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer))-1]}:sub": "system:serviceaccount:kube-system:ebs-csi-controller-sa"
                }
            }
            }
        ]
    })
    managed_policy_arns = ["arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"]
}

resource "aws_eks_addon" "eks_addon" {
  cluster_name = "${var.cluster-name}"
  addon_name   = "aws-ebs-csi-driver"
  service_account_role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/AmazonEKS_EBS_CSI_DriverRole"

  depends_on = [
    aws_iam_role.ebs_csi_role
  ]
}

