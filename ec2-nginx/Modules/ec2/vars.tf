variable "instance_type" {
    default = "t2.micro"
    type = string
}

variable "ami" {
    default = "ami-053b0d53c279acc90"
    type = string
}

variable "count-instance" {
  default = 1
  type = number
}

variable "userdata" {
  type = string
}

variable "sg_id" {
  type = set(string)
  
}