terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Lookup the latest Ubuntu 22.04 AMI from the Canonical owner as a fallback.
# You can override the AMI by setting variable `ubuntu_ami` to an explicit AMI ID.
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

locals {
  merged_cf_parameters = merge(
    var.cf_parameters,
    {
      UbuntuAmiParameter = var.ubuntu_ami != "" ? var.ubuntu_ami : data.aws_ami.ubuntu.id
    }
  )
}

resource "aws_cloudformation_stack" "vpc" {
  name          = var.stack_name
  template_body = file("${path.module}/../templates/vpc-cf-template.yaml")
  parameters    = local.merged_cf_parameters
  capabilities  = ["CAPABILITY_NAMED_IAM"]

  tags = {
    ManagedBy = "terraform"
  }
}
