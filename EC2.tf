#create ssh key pair
resource "aws_key_pair" "my_key" {
  key_name = "terraform-key"
  public_key = "public-key"
}

resource "aws_default_vpc" "default" {
  
}

resource "aws_security_group" "my_sg" {
    name = "my_security_group"
    vpc_id = aws_default_vpc.default.id

    ingress {
        description = "this is port 80"
        to_port = 80
        from_port = 80
        protocol = "tcp"
        cidr_blocks = var.cidr_blocks
    }

     ingress {
        description = "this is port 80"
        to_port = 22
        from_port = 22
        protocol = "tcp"
        cidr_blocks = var.cidr_blocks
    }

    ingress {
        description = "this is port 8080"
        to_port = 8080
        from_port = 8080
        protocol = "tcp"
        cidr_blocks = var.cidr_blocks
    }

    egress {
        description = "this is outgoing port"
        to_port = 0
        from_port = 0
        protocol = -1
        cidr_blocks = var.cidr_blocks
    }
}

resource "aws_instance" "my_instance" {
        for_each = local.instance
        instance_type = var.instance_type
        security_groups = [ aws_security_group.my_sg.name ]
        key_name = aws_key_pair.my_key.key_name
        ami = var.ami_id

        root_block_device {
          volume_size = var.volume_size
          volume_type = var.instance_type
        }

        tags = {
            name = each.value
        }
}
