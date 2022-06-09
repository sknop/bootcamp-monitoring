variable "region" {
  description = "Region in which the bootcamp VPC resides"
  type = string
}

variable "owner-email" {
  description = "Email of owner for internal book keeping"
  type = string
}

variable "owner-name" {
  description = "Name of owner for internal book keeping"
  type = string
}

variable "key-name" {
  description = "Name of key inside AWS that will be assigned to each instance"
  type = string
}

variable "subnet" {
  description = "(Public) Subnet in which to create the instances"
  type = string
}

variable "security-groups" {
  description = "Security groups assigned to each instance"
  type = list(string)
}
