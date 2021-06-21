output "aws_instance" {
  value = aws_instance.participant-instance.*.id
}