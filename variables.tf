variable "tags" {
  type = map
}


variable "security_group_tags" {
  type = map
  default = {} # this is optional if we give default here means we can mention there if also not reqd
}

variable "security_group_name" {
  type = string
}

variable "security_group_description" {
  type = string
}

variable "vpc_id" {
  type = string
}