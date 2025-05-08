terraform {
  required_providers {
    aws = {
        source = ""
        version = "value"
    }
  }
}

provider "aws" {
    region = "ap-south-1"
}   