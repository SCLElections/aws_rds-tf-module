resource "aws_db_subnet_group" "main" {
  name        = "${var.name}"
  description = "RDS subnet group"
  subnet_ids  = ["${var.subnet_ids}"]
}

resource "aws_db_instance" "main" {
  identifier = "${var.name}"

  # Database
  engine              = "${var.engine}"
  engine_version      = "${var.engine_version}"
  username            = "${var.name}"
  password            = "${var.password}"
  multi_az            = "${var.multi_az}"
  name                = "${var.name}"
  snapshot_identifier = "${var.snapshot_name}"

  # Backups / maintenance
  backup_retention_period = "${var.backup_retention_period}"
  backup_window           = "${var.backup_window}"
  maintenance_window      = "${var.maintenance_window}"
  apply_immediately       = "${var.apply_immediately}"
  skip_final_snapshot     = "${var.skip_final_snapshot}"

  # Hardware
  instance_class    = "${var.instance_class}"
  storage_type      = "${var.storage_type}"
  allocated_storage = "${var.allocated_storage}"

  # Network / security
  db_subnet_group_name   = "${aws_db_subnet_group.main.id}"
  vpc_security_group_ids = ["${var.vpc_security_group}"]
  publicly_accessible    = "${var.publicly_accessible}"

  final_snapshot_identifier = "${var.name}finalsnapshot"

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name                   = "rds-${var.tags["Name"]}"
    project                = "${var.tags["project"]}"
    application            = "${var.tags["application"]}"
    environment            = "${var.tags["environment"]}"
    cost-center            = "${var.tags["cost-center"]}"
    creator                = "${var.tags["creator"]}"
    responsible-department = "${var.tags["responsible-department"]}"
    type                   = "${var.tags["type"]}"
    responsible-party      = "${var.tags["responsible-party"]}"
  }
}