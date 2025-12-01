variable "env" {
  type = string
  default = "dev"
}

variable "org_prefix" {
  type = string
  default = "kops"
}

variable "repositories" {
  type        = list(string)
  description = "List of repository names to create"
  default     = ["frontend", "backend", "database"]
}

variable "region" {
  default = "us-east-1"
}

variable "cluster_name" {
  default = "kops-cluster"
}
