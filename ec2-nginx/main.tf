provider "aws" {
  region = "us-east-1"
}

module "ec2" {
  source = "./Modules/ec2"

  instance_type = "t2.micro"
  sg_id = aws_security_group.sg_demo.id
  count-instance = 1
  userdata = file("./userdata.tpl")
}

resource "aws_security_group" "sg_demo" {
    name = "sg_demo"
    description = "SSH on port 22 and HTTP on port 80"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }
}