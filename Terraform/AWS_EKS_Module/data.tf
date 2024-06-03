# terraform을 사용하지 않고 만든리소스 또는 다른데서 사용중인 리소스 불러올때 사용
data "aws_caller_identity" "current" {}