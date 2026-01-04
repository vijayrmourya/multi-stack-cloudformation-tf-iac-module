output "primary_stack_id" {
  description = "Primary CloudFormation stack ARN"
  value       = module.cloudformation_stack_primary.stack_id
}

output "primary_stack_outputs" {
  description = "Primary stack outputs (VPC, EC2, S3, etc.)"
  value       = module.cloudformation_stack_primary.stack_outputs
}

output "secondary_stack_id" {
  description = "Secondary CloudFormation stack ARN"
  value       = module.cloudformation_stack_secondary.stack_id
}

output "secondary_stack_outputs" {
  description = "Secondary stack outputs (identical setup)"
  value       = module.cloudformation_stack_secondary.stack_outputs
}
