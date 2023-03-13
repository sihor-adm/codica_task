# resource "aws_db_instance" "wp_db" {
#   skip_final_snapshot  = true
#   allocated_storage    = 10
#   engine               = "mysql"
#   engine_version       = "5.7"
#   instance_class       = "db.t3.micro"
#   db_name              = "wp_db"
#   username             = "admin"
#   password             = "password123"
#   db_subnet_group_name = aws_db_subnet_group.rds_sub_group.name
# }
