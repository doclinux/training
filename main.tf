#

# DO NOT DELETE THESE LINES!

#

# Your subnet ID is:

#

#     subnet-3135ea1c

#

# Your security group ID is:

#

#     sg-57e40c2a

#

# Your AMI ID is:

#

#     ami-c9580bde



# Your Identity is:

#

#     datapipe-koala

#

variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "aws_region" {
  default = ["us-east-1"]
}

provider "aws" {
  #  access_key = "AKIAJR2NAVPLDC3AELGA"
  access_key = "${var.aws_access_key}"

  #  secret_key = "8lxTPsf7VDEXeSQgc/XlJXMAL8ADtpzgcicJMUmT"
  secret_key = "${var.aws_secret_key}"
  region     = "us-east-1"
}

resource "aws_instance" "instance01" {
  ami                    = "ami-c9580bde"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-3135ea1c"
  vpc_security_group_ids = ["sg-57e40c2a"]
  count                  = "0"

  tags {
    Identity = "datapipe-koala"
    Foo      = "bar"
    Bar      = "foo"
  }
}

output "Public_IP" {
  value = ["${aws_instance.instance01.*.public_ip}"]
}

output "Public_DNS" {
  value = ["${aws_instance.instance01.*.public_dns}"]
}
