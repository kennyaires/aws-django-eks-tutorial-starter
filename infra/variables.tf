variable "region" {
  description = "AWS region to deploy resources to"
  default     = "sa-east-1"
}

variable "prefix" {
  description = "Prefix to be assigned to all resources"
  default     = "django"
}