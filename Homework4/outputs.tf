output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "caller_arn" {
  value = data.aws_caller_identity.current.arn
}

output "caller_user" {
  value = data.aws_caller_identity.current.user_id
}

output "region" {
  value = var.region
}

output "vpc_id" {
  value = data.tfe_outputs.vpc.vpc_id
}

output "public_subnets_id" {
  value = data.tfe_outputs.vpc.public_subnets_id
}

output "private_subnets_id" {
  value = data.tfe_outputs.vpc.private_subnets_id
}

output "vpc_cidr" {
  value = data.tfe_outputs.vpc.vpc_cidr
}