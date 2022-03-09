# S3 bucket config
module "bucket" {
  bucket_name = var.bucket_name
  source = ".//Modules//read_write_s3"
  canned_acl = var.canned_acl
}

module "vpc" {
  source = ".//Modules//vpc"
  private_subnet = var.private_subnet
  public_subnet = var.public_subnet
  vpc_cidr_block = var.vpc_cidr_block
}