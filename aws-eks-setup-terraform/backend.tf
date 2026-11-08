terraform {
  backend "s3" {
    bucket = "myaws-terraform-backend-211125422490-ap-south-1-an"
    key    = "deploywatch/terraform.tfstate"
    region = "ap-south-1"
  }
}
