variable "security_group_name" {
  type = string
}

variable "security_group_DES" {
  type = string
}

variable "tags" {
  type = map
}

variable "security_group_tags" {
  type = map
  default = {}
}

variable "vpc_id" {
  type = string
}

variable "ingress_cidr" {
  type = list(map(string))
  default = [
    {
      from_port    = "80"
      to_port      = "80"
      cidr_block   = "0.0.0.0/0"
      description  = "we are enabling access to 80 portnumber"

    }
  ]
}