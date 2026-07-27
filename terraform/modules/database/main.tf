resource "aws_security_group" "rds_sg" {
  name        = "rds-security-group"
  description = "Allow database traffic from EC2"
  vpc_id      = var.vpc_id

  ingress {
    description     = "MySQL from EC2"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.ec2_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
  var.common_tags,
  {
    Name = "RDS-SG"
  }
  )
}

resource "aws_db_subnet_group" "main" {
  name = "database-subnet-group"

  subnet_ids = var.private_db_subnet_ids

  tags = merge(
    var.common_tags,
    {
      Name = "Database-Subnet-Group"
    }
  )
}


resource "aws_db_instance" "main" {
  identifier = "three-tier-database"

  allocated_storage = 20

  engine         = "mysql"
  engine_version = "8.0"

  instance_class = "db.t3.micro"

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  multi_az = true

  db_subnet_group_name = aws_db_subnet_group.main.name

  vpc_security_group_ids = [
    aws_security_group.rds_sg.id
  ]

  skip_final_snapshot = true

  publicly_accessible = false
}