provider "aws" {
  region     = var.region

  default_tags {
    tags = {
      owner_name = var.owner-name
      owner_email = var.owner-email
    }
  }
}

resource "aws_instance" "prometheus" {
  ami               = data.aws_ami.ubuntu.id
  instance_type     = "t3a.xlarge"
  key_name          = var.key-name

  root_block_device {
    volume_size = 50
  }

  subnet_id = var.subnet
  vpc_security_group_ids = var.security-groups
  associate_public_ip_address = true

  tags = {
    Name        = "Prometheus Bootcamp"
    description = "Prometheus Host for Bootcamp - Managed by Terraform"
    owner_name  = var.owner-name
    owner_email = var.owner-email
    sshUser     = "ubuntu"
    region      = var.region
  }
}

resource "aws_instance" "grafana" {
  ami               = data.aws_ami.ubuntu.id
  instance_type     = "t3a.medium"
  key_name          = var.key-name

  root_block_device {
    volume_size = 20
  }

  subnet_id = var.subnet
  vpc_security_group_ids = var.security-groups
  associate_public_ip_address = true

  tags = {
    Name        = "Grafana Bootcamp"
    description = "Grafana Host for Bootcamp - Managed by Terraform"
    owner_name  = var.owner-name
    owner_email = var.owner-email
    sshUser     = "ubuntu"
    region      = var.region
  }
}
