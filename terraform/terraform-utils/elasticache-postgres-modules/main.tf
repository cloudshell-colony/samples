resource "aws_elasticache_cluster" "example" {
  cluster_id           = "cluster-example"
  engine               = "redis"
  node_type            = "cache.m4.large"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  subnet_group_name    = "${aws_elasticache_subnet_group.elasticache-subnet.name}"
  security_group_ids   = ["${aws_security_group.elasticache-sg.id}"]
  engine_version       = "3.2.10"
  port                 = 6379
}

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "13.4"
  instance_class       = "db.t3.medium"
  identifier           = "rds-${var.sandbox_id}"
  name                 = "${var.db_name}"
  username             = "${var.username}"
  password             = "${var.password}"
  parameter_group_name = "default.postgres13"
  db_subnet_group_name = "${aws_db_subnet_group.rds.id}"
  vpc_security_group_ids    = ["${aws_security_group.rds.id}"]
  skip_final_snapshot       = true
  final_snapshot_identifier = "Ignore"
  publicly_accessible = true
}
