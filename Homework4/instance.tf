###### db
resource "aws_instance" "DB_instances" {
  count                       = "${var.DB_instances_count}"
  ami                         = "${data.aws_ami.latest-ubuntu.id}"
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = module.vpc.private_subnets_id[count.index]
  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.db_security_group.id]

  tags = {
    "Name" = "DB-${data.aws_availability_zones.available.names[count.index]}"
  }
}
resource "aws_security_group" "db_security_group" {
    name = "db_security_group"
    vpc_id = module.vpc.vpc_id
        tags = {
        Name = "db_security_group ${module.vpc.vpc_id}"
    }
}


resource "aws_security_group_rule" "DB_ssh_acess" {
    description       = "allow ssh access from anywhere"
    from_port         = 22
    protocol          = "tcp"
    security_group_id = aws_security_group.db_security_group.id
    to_port           = 22
    type              = "ingress"
    cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "DB_outbound_anywhere" {
    description       = "allow outbound traffic to anywhere"
    from_port         = 0
    protocol          = "-1"
    security_group_id = aws_security_group.db_security_group.id
    to_port           = 0
    type              = "egress"
    cidr_blocks       = ["0.0.0.0/0"]

}






