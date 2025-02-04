variable "instances" {
    type = map
    default = {
        mysql = "t3.micro"
        backend = "t3.micro"
        frontend = "t3.micro"
    }
}

variable "zone_id" {
    default = "Z0986480176PROCGQFKND"
}

variable "domain_name" {
    default = "daws-82s.site"
}