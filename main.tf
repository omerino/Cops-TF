terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #  version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region                  = "eu-west-2"
  shared_credentials_files = ["~/.aws/credentials"]
}


