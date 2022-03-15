variable "AWS_REGION" {
  default = "ap-southeast-2"
}

variable "PRIVATE_KEY_PATH" {
  default = "cyber-range-key-pair"
}

variable "PUBLIC_KEY_PATH" {
  default = "cyber-range-key-pair.pub"
}

variable "EC2_USER" {
  default = "ubuntu"
}

variable "AMI" {
  type = map(string)

  default = {
    eu-west-2      = "ami-03dea29b0216a1e03"
    us-east-1      = "ami-0c2a1acae6667e438"
    ap-southeast-1 = "ami-0f74c08b8b5effa56"
    ap-southeast-2 = "ami-0672b175139a0f8f4"
  }

}

variable "AMI-KALI" {
  # kali-linux-2022.1
  default = "ami-09fda0b04dd140ece"
}
