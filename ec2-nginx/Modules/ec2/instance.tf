resource "aws_instance" "hello" {
  instance_type = var.instance_type
  ami = var.ami
  vpc_security_group_ids = var.sg_id
  count = var.count-instance
  user_data = var.userdata
  tags = {
    Name = "HelloWorld"
  }
}