variable "ami_id"{
    default = "ami-09c813fb71547fc4f"
}

variable "zone_id"{
    default = "Z0986480176PROCGQFKND"
}

/* variable "instance_type"{
    default = "t3.micro"
} */

variable "instance" {
    default = ["mysql", "backend", "frontend"]
}

variable "domain_name" {
    default = "daws-82s.site"
}

variable "environment" {
    default = "dev"
}

variable "common_tags" {
    type = map
    default = {
        Project = "expense"
        Component = "backend"
        Environment = "prod"
        Name = "expense-backend-dev"
    }
}

variable "from_port" {
    default = 22
}

variable "to_port" {
    default = 22
}

variable "protocol" {
    default = "tcp"
}

variable "cidr_blocks" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "security_group_tags" {
    type = map
    default = {
        Name = "Allow-All"
    }
}