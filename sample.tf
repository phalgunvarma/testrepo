provider "aws" {
  region     = "us-east-1"
}


variable "instance_type" {
  type = map(string)

  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    prd     = "t2.large"
  }

}
resource "aws_instance" "workspaceinstance" {
   ami = "ami-0230bd60aa48260c6"
   instance_type = lookup(var.instance_type,terraform.workspace)
   
}
