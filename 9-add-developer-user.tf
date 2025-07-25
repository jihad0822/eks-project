resource "aws_iam_user" "developer" {
    name= "developer"
}

resource "aws_iam_policy" "developer_eks" {
  name        = "AmazonEKSDeveloperPolicy"
  description = "Policy to allow EKS DescribeCluster and ListClusters actions"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "eks:DescribeCluster",
          "eks:ListClusters"
        ]
        Resource = "*"
      }
    ]
  })
}

#Attach policy to user
resource "aws_iam_user_policy_attachment" "developer_eks" {
  user       = aws_iam_user.developer.name
  policy_arn = aws_iam_policy.developer_eks.arn
}

#Bind user to the EKS cluster
resource "aws_eks_access_entry" "developer_eks" {
    cluster_name = aws_eks_cluster.eks.name
    principal_arn = aws_iam_user.developer.arn
    kubernetes_groups = ["my-viewer"]
}