output "instance_id" {
  description = "ID of the KALI Test instance"
  value       = aws_instance.tester.id
}

output "instance_tester_publc_ip" {
  description = "Public IP address of the KALI Test instance"
  value       = aws_instance.tester.public_ip
}

output "instance_web1_id" {
  description = "ID of the WEB instance"
  value       = aws_instance.web1.id
}

output "instance_web1_publc_ip" {
  description = "Public IP address of the WEB instance"
  value       = aws_instance.web1.public_ip
}

output "instance_apt_id" {
  description = "ID of the APT instance"
  value       = aws_instance.apt.id
}

output "instance_apt_publc_ip" {
  description = "Public IP address of the APT instance"
  value       = aws_instance.apt.public_ip
}

//output "instance_dvwa_id" {
//  description = "ID of the DVWA instance"
//  value       = aws_instance.dvwa.id
//}

//output "instance_dvwa_publc_ip" {
//  description = "Public IP address of the DVWA instance"
//  value       = aws_instance.dvwa.public_ip
//}
