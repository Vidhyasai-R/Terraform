resource "aws_security_group" "security_group" {
    name = "${var.project}-${var.environment}"
    description = "allow all the traffic"
    ingress{
        from_port = var.from_port
        to_port = var.to_port
        protocol = var.protocol
        cidr_blocks = var.cidr_blocks
    }
    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = var.security_group_tags
}

resource "aws_instance" "expense" {
    count = length(var.instance)
    ami = var.ami_id
    vpc_security_group_ids = [aws_security_group.security_group.id]
    instance_type = var.environment == "prod" ? "t3.micro" : "t2.micro"
    tags = merge(
        var.common_tags,
        {
            Name = "${var.project}-${var.environment}-${var.instance[count.index]}"
        }
    )
}

