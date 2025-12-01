# ------------------------------
# ECR Repositories
# ------------------------------
module "ecr" {
  source     = "./modules/ecr"
  env        = var.env
  org_prefix = var.org_prefix
  repositories = var.repositories
}

# ------------------------------
# IAM
# ------------------------------
module "iam" {
  source = "./modules/iam"
  prefix = "${var.org_prefix}-${var.env}"
}

# ------------------------------
# VPC
# ------------------------------
module "vpc" {
  source     = "./modules/vpc"
  prefix = "${var.org_prefix}-${var.env}"
}
