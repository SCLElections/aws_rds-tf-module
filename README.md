# aws_rds-tf-module
This modules creates AWS RDS databases.

## Example

```hcl-terraform

module "rds" {
  source             = "git@github.com:SCLElections/aws_rds-tf-module"
  name               = "rds name"
  password           = "password"
  instance_class     = "db.t2.large"
  allocated_storage  = "1000"
  vpc_id             = "vpc-123"
  vpc_security_group = "database security group"

  subnet_ids = [
    "subnet-12345",
    "subnet-67890",
  ]

  publicly_accessible = "true"
    
  tags           = {
    Name                   = "projectname"
    project                = "github-repo-name"
    application            = "project-code"
    environment            = "production"
    cost-center            = "0000"
    type                   = "project-type"
    creator                = "filipe.ferreira@sclgroup.cc"
    responsible-department = "Engineering"
    responsible-party      = "SCL"
  }
}
```

## Input Variables
* **name** - **[string]** - (required) - RDS name and Postgres username.
* **password** - **[string]** - (required) - Postgres user password.
* **allocated_storage** - **[string]** - (required) - Disk size, in GB.
* **vpc_id** - **[string]** - (required) - The VPC ID to use.
* **subnet_ids** - **[list]** - (required) - A list of subnet IDs.
* **vpc_security_group** - **[string]** - (required) - Security Group to link to database.
* **tags** - **[map]** - (required) - AWS resource tags following company recommended.
* **engine** - **[string]** - (default: postgres) - Database engine: mysql, postgres, etc.
* **engine_version** - **[string]** - (default: 9.6.3) - Database version.
* **port** - **[int]** - (default: 5432) - Port for database to listen on. 
* **multi_az** - **[string]** - (default: false) - If true, database will be placed in multiple AZs for HA.
* **backup_retention_period** - **[int]** - (default: 5) - Backup retention, in days.
* **backup_window** - **[string]** - (default: "00:00-01:00") - Time window for backups.  
* **maintenance_window** - **[string]** - (default: "Mon:01:00-Mon:02:00) - Time window for maintenance.  
* **apply_immediately** - **[boolean]** - (default: true) - If false, apply changes during maintenance window.  
* **instance_class** - **[string]** - (default: "db.t2.micro") - Underlying instance type.  
* **storage_type** - **[string]** - (default: gp2) - Storage type: standard, gp2, or io1.  
* **publicly_accessible** - **[boolean]** - (default: false) - If true, the RDS instance will be open to the internet.  
* **skip_final_snapshot** - **[boolean]** - (default: false) - Whether to skip taking a final snapshot of the database upon destruction.
* **snapshot_name** - **[string]** - (default: "") - Name to use when creating a database from a snapshot.  

## Output Variables
* **hostname** - Fully qualified domain hostname with port.
* **hostname_without_port** - Fully qualified domain hostname without port.
* **username** - Root username for the database.
* **password** - Root username password for the database.
* **database** - Database name.
* **jdbc_addr** - JDBC compatible address for the database.
* **addr** - Postgress address for the database.

