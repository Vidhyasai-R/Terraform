resource "aws_security_group" "security_group" {
    name = "Allow-All"
    description = "Allow the traffic"

    dynamic "ingress" {
        for_each = var.ingress_ports
        content{
            from_port = ingress.value["from_port"]
            to_port = ingress.value["to_port"]
            protocol = ingress.value["protocol"]
            cidr_blocks = ingress.value["cidr_blocks"]
        }
    }

    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "Allow_All"
    }
}

resource "aws_instance" "ec2_instance" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.security_group.id]
    tags = {
        Name = "Terraform"
    }
}