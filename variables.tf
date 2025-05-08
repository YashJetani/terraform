variable "instance_name" {
    description = "this is instance name "
    default = "Terra-Server"
}

variable "instance_type" {
    description = "this is instance name"
    default = "t2.micro"
}   

variable "ami_id" {
    description = "this is ami id"
    default = "ami-0e35ddab05955cf57"  
}

variable "volume_size" {
  description = "this is size of volume"
  default = 8
}

variable "volume_type" {
  description = "this is volume type"
  default = "gp3"
}

variable "cidr_blocks" {
    description = "this is cide block"
    default = ["0.0.0.0/0"]
}
variable "aws_region" {
    description = "this is region"
    default = "ap-south-1"  
}

locals {
  instance = {
    "instance_1" : "my_instance_1"
  }
}