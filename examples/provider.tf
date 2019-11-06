provider "aws" {
  version = "~> 2.0"
  region  = "${var.region}"
}

terraform {
  required_version = ">=0.12.0"
  backend "s3" {
    bucket = "terraform-bucket-anand"
    key    = "terraform/vpc"
    region = "us-east-1"
  }
}
