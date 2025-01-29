variable "instance" {
  type        = list
  default     = [ "mysql", "backend", "frontend" ]
  description = "description"
}

variable "zone_id" {
    default = "Z0986480176PROCGQFKND"
}

variable "domain_name" {
    default = "daws-82s.site"
}