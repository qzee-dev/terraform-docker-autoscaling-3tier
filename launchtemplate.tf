resource "aws_launch_template" "api_template" {
  name_prefix   = "docker-api-template"
  image_id      = var.ami_id
  instance_type = "t3.micro"
  key_name      = var.key_name

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.ec2_sg.id]
  }

  user_data = base64encode(<<EOF
#!/bin/bash
yum update -y
yum install docker -y
systemctl start docker
systemctl enable docker

docker pull yourdockerhubusername/api:latest

docker run -d -p 80:3000 \
--restart always \
-e DB_HOST=${aws_db_instance.api_db.address} \
-e DB_USER=${var.db_username} \
-e DB_PASS=${var.db_password} \
--name api \
yourdockerhubusername/api:latest
EOF
)
}
