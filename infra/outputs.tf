output "cluster_name" {
  description = "Name of the EKS cluster in AWS"
  value       = module.eks.cluster_name
}

output "region" {
  description = "AWS region where the EKS cluster is deployed"
  value       = var.region
}

output "ecr_app_url" {
  description = "ECR repo name for app"
  value       = aws_ecr_repository.app.repository_url
}

output "ecr_proxy_url" {
  description = "ECR repo name for proxy"
  value       = aws_ecr_repository.proxy.repository_url
}