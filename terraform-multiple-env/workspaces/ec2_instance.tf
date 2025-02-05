resource "aws_security_group" "security_group" {
    name = "allow-all"
    description = "Allow all traffic"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "allow-all"
    }
}

resource "aws_instance" "ec2_instance" {
    ami = "ami-09c813fb71547fc4f"
    vpc_security_group_ids = [aws_security_group.security_group.id]
    instance_type = lookup(var.instance_type, terraform.workspace)
    tags = {
        Name = "terraform-${terraform.workspace}"
    }
}