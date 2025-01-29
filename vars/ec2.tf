resource "aws_security_group" "security_group" {
    name = "allow-all"
    description = "Allow all traffic"
    ingress {
        from_port = var.from_port
        to_port = var.to_port
        protocol = "tcp"
        cidr_blocks = var.cidr_blocks
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = var.security_group_tags
}

resource "aws_instance" "ec2_instance" {
    ami = var.ami
    vpc_security_group_ids = [aws_security_group.security_group.id]
    instance_type = var.instance_type
    tags = var.ec2_tags
}