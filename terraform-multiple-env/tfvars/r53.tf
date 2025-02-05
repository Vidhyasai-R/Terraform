resource "aws_route53_record" "expense" {
    count = length(var.instance)
    zone_id = var.zone_id
    name    = var.instance[count.index] == "frontend" && var.environment == "prod" ? var.domain_name : "${var.instance[count.index]}-${var.environment}.${var.domain_name}"
    type    = "A"
    ttl     = 1
    records = [var.instance[count.index] == "frontend" && var.environment == "prod" ? aws_instance.expense[count.index].public_ip : aws_instance.expense[count.index].private_ip]
    allow_overwrite = true
}