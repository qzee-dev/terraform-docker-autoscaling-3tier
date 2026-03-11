resource "aws_db_subnet_group" "db_subnets" {
  name       = "db-subnets"
  subnet_ids = var.private_subnets
}

resource "aws_db_instance" "api_db" {
  identifier            = "api-db"
  engine                = "mysql"
  instance_class        = "db.t3.micro"
  allocated_storage     = 20
  name                  = "apidb"
  username              = var.db_username
  password              = var.db_password
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.db_subnets.name
  publicly_accessible    = false
  skip_final_snapshot    = true
}
