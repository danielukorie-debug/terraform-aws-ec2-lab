output "instance_id" {
  description = "ID of the EC2 instance."
  value       = aws_instance.lab.id
}

output "public_ip" {
  description = "Public IPv4 address of the EC2 instance."
  value       = aws_instance.lab.public_ip
}

output "ssh_command" {
  description = "Example SSH command. Replace the key path with your local private key path."
  value       = "ssh -i /path/to/your-private-key.pem ubuntu@${aws_instance.lab.public_ip}"
}
