# module "minikube" {
#   source = "github.com/scholzj/terraform-aws-minikube"

#   aws_region    = "us-east-1"
#   cluster_name  = "roboshop"
#   aws_instance_type = "t3.medium"
#   ssh_public_key = "~/.ssh/id_rsa.pub"
#   aws_subnet_id = "subnet-0a0d059e29a18bbce" #replace with your default subnet id
# # By default centos will nbe used
#  ami_image_id = "ami-07f2e4c22cb576757" # I have selected default ami 
#   hosted_zone = "pavankumarmuvva.online"
#   hosted_zone_private = false

#   tags = {
#     Application = "Minikube"
#   }

#   addons = [
#     "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/storage-class.yaml",
#     "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/heapster.yaml",
#     "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/dashboard.yaml",
#     "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/external-dns.yaml"
#   ]
# }



module "minikube" {
  source = "github.com/scholzj/terraform-aws-minikube"

  aws_region    = "us-east-1"
  cluster_name  = "roboshop"
  aws_instance_type = "t3.medium"
  ssh_public_key = "~/.ssh/id_rsa.pub"
  aws_subnet_id = "subnet-0a0d059e29a18bbce" #replace your default subnet id
  # by default centos7 will be used
  #ami_image_id = "ami-b81dbfc5"
  hosted_zone = "pavankumarmuvva.online"
  hosted_zone_private = false

  tags = {
    Application = "Minikube"
  }

  addons = [
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/storage-class.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/heapster.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/dashboard.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/external-dns.yaml"
  ]
}