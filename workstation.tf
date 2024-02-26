module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "workstation"
  ami = data.aws_ami.centos.id
  instance_type          = "t2.micro"
#   key_name               = "user1"
#   monitoring             = true
  vpc_security_group_ids = [aws_security_group.allow_minikube.id]
  subnet_id              = "subnet-0a0d059e29a18bbce" #replace your default subnet id
  user_data = file ("docker-install.sh")

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_security_group" "allow_minikube" {
  name        = "allow_minikube"
  description = "Allow TLS inbound traffic and all outbound traffic"
#   vpc_id      = aws_vpc.main.id
 ingress {
    description = "all ports"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_minikube"
  }
}


data "aws_ami" "centos" {
    owners = ["973714476881"]
    most_recent = true

  filter {
    name   = "name"
    values = ["Centos-8-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

data "aws_vpc" "default" {
    default = true

}