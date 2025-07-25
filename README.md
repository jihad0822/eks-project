AWS EKS Infrastructure Setup with Terraform



This repository provides a comprehensive guide and Terraform configurations for setting up an AWS Elastic Kubernetes Service (EKS) cluster, along with related AWS resources and Kubernetes components. The configurations and tutorials cover the creation of a secure and scalable EKS environment, including networking, autoscaling, load balancing, storage, and secret management.
Table of Contents

1. Create AWS VPC

2. Create AWS EKS Cluster

3. Add IAM User & IAM Role to AWS EKS

4. Horizontal Pod Autoscaler (HPA) on AWS EKS

5. Cluster Autoscaler (EKS Pod Identities)

6. AWS Load Balancer Controller (TLS)

7. Nginx Ingress Controller (Cert-Manager & TLS)

8. EKS CSI Driver (ReadWriteOnce)

9. EKS EFS CSI Driver (ReadWriteMany) & OIDC

10. EKS + AWS Secrets Manager (Env & Files)

------

1. Create AWS VPC

This section provides Terraform configurations to create a Virtual Private Cloud (VPC) on AWS, tailored for hosting an EKS cluster. The VPC includes public and private subnets, route tables, NAT gateways, and an Internet Gateway to ensure secure and scalable network connectivity.

2. Create AWS EKS Cluster

Here, we use Terraform to provision an AWS EKS cluster. The configuration includes setting up the control plane, worker nodes, and necessary security groups. It ensures the EKS cluster is integrated with the previously created VPC for secure communication.

3. Add IAM User & IAM Role to AWS EKS

This step covers adding an IAM user and IAM role to manage access to the EKS cluster. The Terraform configuration includes creating IAM policies and attaching them to the user and role, enabling secure access control for cluster operations.

4. Horizontal Pod Autoscaler (HPA) on AWS EKS

The Horizontal Pod Autoscaler (HPA) configuration enables automatic scaling of pods based on resource utilization (e.g., CPU or memory). This section includes Terraform and Kubernetes manifests to deploy and configure HPA for workloads running on the EKS cluster.

5. Cluster Autoscaler (EKS Pod Identities)

The Cluster Autoscaler dynamically adjusts the number of nodes in the EKS cluster based on workload demands. This tutorial uses EKS Pod Identities to grant the autoscaler permissions, with Terraform configurations to deploy and manage the autoscaler.

6. AWS Load Balancer Controller (TLS)

This section demonstrates deploying the AWS Load Balancer Controller to manage Application Load Balancers (ALBs) for EKS workloads. It includes configuring TLS for secure communication, with Terraform scripts to set up the controller and integrate it with the cluster.

7. Nginx Ingress Controller (Cert-Manager & TLS)

Learn how to deploy the Nginx Ingress Controller on EKS to manage external traffic. This tutorial includes integrating Cert-Manager for automated TLS certificate management, with Terraform and Kubernetes manifests to configure the setup.

8. EKS CSI Driver (ReadWriteOnce)

The EKS CSI Driver enables persistent storage for Kubernetes workloads. This section focuses on configuring the AWS EBS CSI Driver for ReadWriteOnce volumes, with Terraform scripts to deploy the driver and set up storage classes.

9. EKS EFS CSI Driver (ReadWriteMany) & OIDC

This tutorial covers deploying the AWS EFS CSI Driver for ReadWriteMany storage, ideal for shared file systems. It includes setting up OpenID Connect (OIDC) for secure authentication, with Terraform configurations to provision EFS and integrate it with EKS.

10. EKS + AWS Secrets Manager (Env & Files)

This section explains how to integrate AWS Secrets Manager with EKS to securely manage environment variables and files for Kubernetes workloads. The Terraform configuration includes setting up secrets, IAM roles, and Kubernetes secrets for secure access.

------
Prerequisites


AWS account with appropriate permissions
Terraform installed (version >= 1.5.0)
kubectl configured for EKS cluster access
AWS CLI configured with credentials
Basic knowledge of AWS, Kubernetes, and Terraform

Usage

Clone this repository:git clone <repository-url>
cd <repository-directory>


Initialize Terraform:terraform init


Review and modify variables in terraform.tfvars as needed.
Apply the Terraform configurations:terraform apply


Follow the specific Kubernetes manifests and commands provided in each section to deploy additional components.

Contributing
Contributions are welcome! Please submit a pull request or open an issue for any improvements or bug fixes.
License
This project is licensed under the MIT License. See the LICENSE file for details.
