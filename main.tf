resource "aws_instance" "instance" {
  ami = "ami-0b5a2b5b8f2be4ec2"
  instance_type = var.instance_type
  subnet_id = var.subnet_id
}

variable "instance_type" {}
variable "subnet_id" {}