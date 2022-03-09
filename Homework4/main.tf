# S3 bucket config
module "s3" {
  source  = "app.terraform.io/Anna-ops/s3/aws"
  version = "1.0.0"
  bucket_name = var.bucket_name
  canned_acl = var.canned_acl
}

module "vpc" {
  source  = "app.terraform.io/Anna-ops/vpc/aws"
  version = "1.0.0"
  private_subnet = var.private_subnet
  public_subnet = var.public_subnet
  vpc_cidr_block = var.vpc_cidr_block
}