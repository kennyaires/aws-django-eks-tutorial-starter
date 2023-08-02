variable "region" {
  description = "AWS region to deploy resources to"
  default     = "sa-east-1"
}

variable "prefix" {
  description = "Prefix to be assigned to all resources"
  default     = "django-k8s"
}

variable "db_password" {
  description = "value of the password for the RDS database instance"
  default     = "samplepassword123"
}