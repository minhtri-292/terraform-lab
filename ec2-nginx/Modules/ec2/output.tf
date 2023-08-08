output "ec2" {
  value = {
    public_dns = [for v in aws_instance.hello : v.public_dns]
  }
}
