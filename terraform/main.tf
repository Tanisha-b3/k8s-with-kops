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

# ------------------------------
# S3 Bucket - Terraform State Store
# ------------------------------
module "terraform_state_store" {
  source      = "./modules/s3"
  bucket_name = "${var.prefix}-tfstate-${var.env}-${var.region}"

  tags = {
    Environment = var.env
    Project     = var.prefix
    ManagedBy   = "terraform"
    Owner       = "platform-team"
  }
}

# ------------------------------
# S3 Bucket - kOps State Store
# ------------------------------
module "kops_state_store" {
  source      = "./modules/s3"
  bucket_name = "${var.prefix}-kops-state-${var.env}-${var.region}"

  tags = {
    Environment = var.env
    Project     = var.prefix
    ManagedBy   = "terraform"
    Owner       = "platform-team"
  }
}

module "rds" {
  source = "./modules/rds"
  region = var.region
  priv_sg_id = ""
  env = var.env
  prefix = ""
  db_name = var.db_name
  db_pass = var.db_pass
  db_user = var.db_user
  db_subnet_ids = ""
}
