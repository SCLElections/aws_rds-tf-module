output "hostname" {
  value = "${aws_db_instance.main.endpoint}"
}

output "address" {
  value = "${aws_db_instance.main.address}"
}

output "hostname_without_port" {
  value = "${element(split(":", "${aws_db_instance.main.endpoint}"), 0)}"
}

output "username" {
  value = "${aws_db_instance.main.username}"
}

output "password" {
  value = "${aws_db_instance.main.password}"
}

output "database" {
  value = "${aws_db_instance.main.name}"
}

output "jdbc_addr" {
  value = "postgresql://${aws_db_instance.main.endpoint}/${aws_db_instance.main.name}"
}

output "addr" {
  value = "postgres://${aws_db_instance.main.username}:${aws_db_instance.main.password}@${aws_db_instance.main.endpoint}"
}