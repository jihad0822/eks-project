resource "aws_iam_role" "nodes" {
  name = "${local.env}-${local.eks_name}-nodes-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "${local.env}-${local.eks_name}-nodes-role"
  }
}

#This policy now includes AssumeRoleForPodIdentity for the Pod Identity Agent
resource "aws_iam_role_policy_attachment" "amazonaws_eks_worker_node_policy" {
  role       = aws_iam_role.nodes.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

#this policy manages secondary IPs
resource "aws_iam_role_policy_attachment" "amazonaws_eks_cni_policy" {
  role       = aws_iam_role.nodes.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

#This policy pulls private docker images from container registry
resource "aws_iam_role_policy_attachment" "amazon_ec2_container_registry_read_only" {
  role       = aws_iam_role.nodes.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

#Node group for EKS
resource "aws_eks_node_group" "general" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "general"
  node_role_arn   = aws_iam_role.nodes.arn
  
  subnet_ids      = [
    aws_subnet.private_zone1.id,
    aws_subnet.private_zone2.id,
  ]

  capacity_type = "ON_DEMAND"
  instance_types = ["t3.large"]

  scaling_config {
    desired_size = 1
    max_size     = 10
    min_size     = 0
  }
  
  update_config {
    max_unavailable = 1
  }

  labels = {
    role = "general"
  }

  depends_on = [
    aws_iam_role_policy_attachment.amazonaws_eks_worker_node_policy,
    aws_iam_role_policy_attachment.amazonaws_eks_cni_policy,
    aws_iam_role_policy_attachment.amazon_ec2_container_registry_read_only,
  ]

# Allow external changes without Terraform plan difference
    lifecycle {
        ignore_changes = [scaling_config[0].desired_size]
    }
}