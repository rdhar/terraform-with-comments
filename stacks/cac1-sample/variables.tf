variable "tags" {
  description = "https://www.hashicorp.com/blog/default-tags-in-the-terraform-aws-provider"
  type        = map(string)
}

variable "region" {
  description = "https://aws.amazon.com/about-aws/global-infrastructure"
  type        = string
}

variable "instance_type" {
  description = "https://aws.amazon.com/ec2/instance-types"
  type        = string
}
