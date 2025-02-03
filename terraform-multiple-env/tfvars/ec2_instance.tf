resource "aws_security_group" "security_group" {
    name = "${var.project}-${var.environment}"
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
        Name = "${var.project}-${var.environment}" #expense-dev
    }
}

resource "aws_instance" "expense" {
    count = length(var.instance)
    ami = "ami-09c813fb71547fc4f"
    vpc_security_group_ids = [aws_security_group.security_group.id]
    instance_type = "t3.micro"
    tags = merge(
        var.common_tags,
        {
            Name = "${var.project}-${var.environment}-${var.instance[count.index]}" #expense-dev-myql
        }
    )
}