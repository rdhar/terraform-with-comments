# Get the latest Ubuntu 22.04 AMI https://cloud-images.ubuntu.com/locator/ec2/.
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

# Create a sample EC2 instance.
resource "aws_instance" "sample" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = "sample"
  }
}

# Output the ARN of the sample EC2 instance.
output "sample_instance_arn" {
  description = "ARN of the sample EC2 instance."
  value       = aws_instance.sample.arn
}
