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
    ami = local.ami_id
    vpc_security_group_ids = [aws_security_group.security_group.id]
    instance_type = local.instance_type
    tags = {
        Name = local.tag_name
    }
}