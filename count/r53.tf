resource "aws_route53_record" "expense" {
    count = length(var.instance)
    zone_id = var.zone_id
    name    = "${var.instance[count.index]}.${var.domain_name}"
    type    = "A"
    ttl     = 1
    records = [aws_instance.expense[count.index].private_ip]
    allow_overwrite = true
}

resource "aws_route53_record" "frontend" {
    count = 3
    zone_id = var.zone_id
    name    = "${var.domain_name}"
    type    = "A"
    ttl     = 1
    records = [aws_instance.expense[2].public_ip]
    allow_overwrite = true
}