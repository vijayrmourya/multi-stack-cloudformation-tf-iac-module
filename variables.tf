variable "region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "stack_name" {
  description = "CloudFormation stack name"
  type        = string
  default     = "lab-vpc-stack"
}

variable "cf_parameters" {
  description = "Map of CloudFormation template parameters (if any)"
  type        = map(string)
  default     = {}
}

variable "ubuntu_ami" {
  description = "Optional explicit Ubuntu AMI ID to use. If empty, Terraform will look up the latest Ubuntu 22.04 AMI"
  type        = string
  default     = ""
}
