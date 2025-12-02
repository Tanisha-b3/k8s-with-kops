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

variable "db_name" {
  type = string
  description = "database name"
}

variable "db_user" {
    type = string
    description = "database username" 
}

variable "db_pass" {
  type = string
  description = "database password"
}
