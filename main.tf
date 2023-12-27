resource "aws_spot_instance_request" "rabbitmq" {
  ami           = data.aws_ami.ami_id.id
  instance_type = var.instance_type
  spot_type = "persistent"
  instance_interruption_behavior = "stop"
  wait_for_fulfillment = true
  subnet_id = var.sub_ids[0]


}

resource "aws_ec2_tag" "tag1" {
  resource_id = aws_spot_instance_request.rabbitmq.spot_instance_id
  key         = "Name"
  value       = "rabbitmq"
}