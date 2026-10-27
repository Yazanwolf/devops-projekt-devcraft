output "server_ip" {
  description = "Öffentliche IP-Adresse des Servers"
  value       = 2.31.69.214
}

output "ssh_command" {
  description = "SSH-Befehl zum Verbinden"
  value       = "ssh root@${ssh root@2.31.69.214}"
}
