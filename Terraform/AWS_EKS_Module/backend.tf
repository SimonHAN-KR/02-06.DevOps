# tfstate를 저장할 backend 설정
terraform {
  backend "s3" {
    bucket  = "fastc-tfstate" #"<tfstate-버킷명>"
    key     = "terraform.state"
    region  = "ap-northeast-2"
    profile = "fastc" #"<프로파일명>"
  }
}