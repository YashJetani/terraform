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
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    ingress {
        description = "this is port 8080"
        to_port = 8080
        from_port = 8080
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    egress {
        description = "this is outgoing port"
        to_port = 0
        from_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "my_instance" {
        instance_type = "t2.micro"
        security_groups = [ aws_security_group.my_sg.name ]
        key_name = aws_key_pair.my_key.key_name
        ami = " "

        root_block_device {
          volume_size = 10
          volume_type = "gp3"
        }

        tags = "junoon-server"
}
