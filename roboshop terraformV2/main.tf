
resource "aws_instance" "intances" {
    count = length(var.components)
  ami           = data.aws_ami.ami.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = data.aws_security_groups.sg.ids


  tags = {
    Name = "${var.components[count.index]}.dev"
  }
}

# resource "aws_route53_record" "frontend" {
#     count = length(var.components)
#   zone_id = data.aws_route53_zone.zone.zone_id
#   name    = ${var.components[count.index]}.dev.${var.domain_name}"
#   type    = "A"
#   ttl     = 3
#   records = [aws_instance.frontend.private_ip[count.index]]
# }

