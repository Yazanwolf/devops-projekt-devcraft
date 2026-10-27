variable "hcloud_token" {
  description = "Hetzner Cloud API Token"
  type        = string
  sensitive   = true
}

variable "server_type" {
  description = "Hetzner server type"
  type        = string
  default     = "cx22"
}

variable "location" {
  description = "Hetzner datacenter location"
  type        = string
  default     = "nbg1"
}

variable "ssh_public_key_path" {
  description = "public key path on the developer's machine"
  type = string
  sensitive = true
}

variable "ssh_key_name" {
  description = "name of ssh key"
  type = string
  default = "devops-project"
}