resource "aws_security_group" "security_group" {
    name = "allow-all"
    description = "Allow all traffic"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
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
    for_each = var.instance
    ami = "ami-09c813fb71547fc4f"
    vpc_security_group_ids = [aws_security_group.security_group.id]
    instance_type = each.value
    tags = {
        Name = each.key
    }

    connection {
        type     = "ssh"
        user     = "ec2-user"
        password = "DevOps321"
        host     = self.public_ip
    }

    provisioner "local-exec" {
        command = "echo ${self.public_ip} > inventory"
    }

    provisioner "remote-exec" {
        inline = [
        "sudo dnf install nginx -y",
        "sudo systemctl start nginx",
        ]
    }

    provisioner "remote-exec" {
        when = destroy
        inline = [
        "sudo systemctl stop nginx",
        ]
    }
}

output "ec2_info" {
  value       = aws_instance.ec2_instance
}
