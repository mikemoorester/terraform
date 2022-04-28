resource "aws_instance" "tester" {

  ami           = var.AMI-KALI
  instance_type = "t2.micro"

  # VPC
  subnet_id = aws_subnet.prod-subnet-public-1.id

  # Security Group
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]

  # the Public SSH key
  key_name = aws_key_pair.cyber-range-key-pair.id

//  # msf installation and set-up
//  provisioner "file" {
//    source      = "msf.sh"
//    destination = "/tmp/msf.sh"
//  }

//  provisioner "remote-exec" {
//    inline = [
//      "chmod +x /tmp/msf.sh",
//      "sudo /tmp/msf.sh"
//    ]
//  }

  connection {
    user        = "kali"
    private_key = file("${var.PRIVATE_KEY_PATH}")
    host        = self.public_ip
  }

  tags = {
    Name = "kali-tester"
  }
}

resource "aws_instance" "web1" {
  ami           = lookup(var.AMI, var.AWS_REGION)
  instance_type = "t2.micro"

  # VPC
  subnet_id = aws_subnet.prod-subnet-public-1.id

  # Security Group
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]

  # the Public SSH key
  key_name = aws_key_pair.cyber-range-key-pair.id

  # nginx installation
  provisioner "file" {
    source      = "nginx.sh"
    destination = "/tmp/nginx.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/nginx.sh",
      "sudo /tmp/nginx.sh"
    ]
  }

  connection {
    user        = var.EC2_USER
    private_key = file("${var.PRIVATE_KEY_PATH}")
    host        = self.public_ip
  }

  tags = { 
    Name = "nginx"
  }
}

//-----------------------------------------------------------------------------
//
// TODO: Create a metasploitable instance
//
//-----------------------------------------------------------------------------
resource "aws_instance" "apt" {

  ami           = "ami-0b7dcd6e6fd797935" 
// lookup(var.AMI, var.AWS_REGION)
  instance_type = "t2.micro"

  # VPC
  subnet_id = aws_subnet.prod-subnet-public-1.id

  # Security Group
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]

  # the Public SSH key
  key_name = aws_key_pair.cyber-range-key-pair.id

  # apt installation and set-up
  provisioner "file" {
    source      = "apt.sh"
    destination = "/tmp/apt.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/apt.sh",
      "sudo /tmp/apt.sh"
    ]
  }

  connection {
    user        = var.EC2_USER
    private_key = file("${var.PRIVATE_KEY_PATH}")
    host        = self.public_ip
  }

  tags = {
    Name = "apt"
  }
}

//-----------------------------------------------------------------------------
// TODO: Doesn't install completely need to finish
//       Need to be able to bring this ec2 up and down at the command line
//       do not want to keep the DVWA instance up and running for any period of time
//       shouldn't be up by default
//-----------------------------------------------------------------------------
// resource "aws_instance" "dvwa" {
// 
//   ami           = lookup(var.AMI, var.AWS_REGION)
//   // ami           = var.AMI-KALI
//   instance_type = "t2.micro"
// 
//   # VPC
//   subnet_id = aws_subnet.prod-subnet-public-1.id
// 
//   # Security Group
//   vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]
// 
//   # the Public SSH key
//   key_name = aws_key_pair.cyber-range-key-pair.id
// 
//   # damn vulnerable web server
//   # dvwa installation
//   provisioner "file" {
//     source      = "dvwa.sh"
//     destination = "/tmp/dvwa.sh"
//   }
// 
//   provisioner "remote-exec" {
//     inline = [
//       "chmod +x /tmp/dvwa.sh",
//       "sudo /tmp/dvwa.sh"
//     ]
//   }
// 
//   connection {
//     user        = var.EC2_USER
//     // user        = "root"
//     private_key = file("${var.PRIVATE_KEY_PATH}")
//     host        = self.public_ip
//   }
//   tags = { 
//     Name = "dvwa"
//   }
// }

// Sends your public key to the instance
resource "aws_key_pair" "cyber-range-key-pair" {
  key_name   = "cyber-range-key-pair"
  public_key = file(var.PUBLIC_KEY_PATH)
}

//-----------------------------------------------------------------------------
// Need to be able to run: 
//                         aws configure | aws configure --profile test
// which requires the AWS_SECRET_KEY to available within the environment variable
// Could pass this in via an up.sh and then call terraform apply
//-----------------------------------------------------------------------------
// resource "null_resource" "stop_instance" {
// 
//   provisioner "local-exec" {
//    on_failure  = fail
//    interpreter = ["/bin/bash", "-c"]
//    command     = <<EOT
//        echo -e "\x1B[31m Warning! Restarting instance having id ${aws_instance.ec2.id}.................. \x1B[0m"
//        # To stop instance
//        aws ec2 stop-instances --instance-ids ${aws_instance.ec2.id} --profile test
//        echo "***************************************Rebooted****************************************************"
//     EOT
//  }
//#   this setting will trigger script every time,change it something needed
//  triggers = {
//   always_run = "${timestamp()}"
//  }
//
//}

// resource "null_resource" "reboot_instance" {
// 
//   provisioner "local-exec" {
//     on_failure  = fail
//     interpreter = ["/bin/bash", "-c"]
//     command     = <<EOT
//         echo -e "\x1B[31m Warning! Restarting instance having id ${aws_instance.ec2.id}.................. \x1B[0m"
//         aws ec2 reboot-instances --instance-ids ${aws_instance.ec2.id} --profile test
//         # To stop instance
//         echo "***************************************Rebooted****************************************************"
//      EOT
//   }
// #   this setting will trigger script every time,change it something needed
//   triggers = {
//     always_run = "${timestamp()}"
//   }
// 
// 
// }
