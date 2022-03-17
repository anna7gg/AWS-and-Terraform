# S3 bucket config
module "bucket" {
  bucket_name = var.bucket_name
  source = ".//Modules//read_write_s3"
  canned_acl = var.canned_acl
}
