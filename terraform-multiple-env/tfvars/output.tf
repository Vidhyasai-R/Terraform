output "ec2_info"{
    value = aws_instance.expense
}

output "route53_info"{
    value = aws_route53_record.expense
}