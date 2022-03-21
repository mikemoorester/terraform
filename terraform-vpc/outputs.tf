output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.tester.id
}

output "instance_tester_publc_ip" {
  description = "Public IP address of the KALI EC2 instance"
  value       = aws_instance.tester.public_ip
}

output "instance_web1_publc_ip" {
  description = "Public IP address of the WEB EC2 instance"
  value       = aws_instance.web1.public_ip
}

output "instance_dvwa_publc_ip" {
  description = "Public IP address of the DVWA EC2 instance"
  value       = aws_instance.dvwa.public_ip
}
