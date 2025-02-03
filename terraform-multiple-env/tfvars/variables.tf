variable "project" {
  default = "expense"
}

variable "environment"{
  
}

variable "instance" {
  default = [ "mysql", "backend", "frontend" ]
}

variable "zone_id" {
    default = "Z0986480176PROCGQFKND"
}

variable "domain_name" {
    default = "daws-82s.site"
}

variable "common_tags" {
    type = map
    default = {
        Project = "expense"
    }
}