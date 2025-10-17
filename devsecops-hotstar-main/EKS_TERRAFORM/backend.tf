terraform {
  backend "s3" {
    bucket = "devsecops-hotstar-deepak"
    key    = "EKS/terraform.tfstate"
    region = "ap-south-1"
  }
}
