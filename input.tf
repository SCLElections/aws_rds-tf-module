variable "name" {
  description = "RDS name and Postgres username"
}

variable "engine" {
  description = "Database engine: mysql, postgres, etc."
  default     = "postgres"
}

variable "engine_version" {
  description = "Database version"
  default     = "9.6.3"
}

variable "port" {
  description = "Port for database to listen on"
  default     = 5432
}

variable "password" {
  description = "Postgres user password"
}

variable "multi_az" {
  description = "If true, database will be placed in multiple AZs for HA"
  default     = false
}

variable "backup_retention_period" {
  description = "Backup retention, in days"
  default     = 5
}

variable "backup_window" {
  description = "Time window for backups."
  default     = "00:00-01:00"
}

variable "maintenance_window" {
  description = "Time window for maintenance."
  default     = "Mon:01:00-Mon:02:00"
}

variable "apply_immediately" {
  description = "If false, apply changes during maintenance window"
  default     = true
}

variable "instance_class" {
  description = "Underlying instance type"
  default     = "db.t2.micro"
}

variable "storage_type" {
  description = "Storage type: standard, gp2, or io1"
  default     = "gp2"
}

variable "allocated_storage" {
  description = "Disk size, in GB"
}

variable "publicly_accessible" {
  description = "If true, the RDS instance will be open to the internet"
  default     = false
}

variable "vpc_id" {
  description = "The VPC ID to use"
}

variable "subnet_ids" {
  description = "A list of subnet IDs"
  type        = "list"
}

variable "skip_final_snapshot" {
  description = "Whether to skip taking a final snapshot of the database upon destruction"
  default     = false
}

variable "tags" {
  type = "map"
}

variable "vpc_security_group" {}

variable "snapshot_name" {
  default = ""
}