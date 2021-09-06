terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "do_token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "node" {
  count = 3
  image  = "ubuntu-20-04-x64"
  name   = "node"
  region = "fra1"
  size   = "s-1vcpu-2gb"
  ssh_keys = ["e2:3c:22:0e:7a:45:d7:f8:ed:4b:11:d8:37:3d:1c:ca"]

  connection {
    type = "ssh"
    host = self.ipv4_address
    user = "root"
  }

  provisioner "remote-exec" {
    inline = [
      "curl -fsSL https://get.docker.com -o get-docker.sh"
    ]
  }
}

output "node_IPs"{
  value = digitalocean_droplet.node.*.ipv4_address
}
