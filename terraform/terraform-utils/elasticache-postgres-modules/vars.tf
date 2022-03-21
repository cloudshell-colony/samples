variable "eks_vpc" {
    description = "VPC of the EKS cluster"
}

variable "db_name" {
  description = "db name"
  #default = "demo_db"
}

variable "username" {
  description = "User name"
  #qwq1 default = "wordpress"
}

variable "password" {
  description = "Database password"
  #default = "Torque!123"
}

variable "sandbox_id" {
  description = "Torque sandbox id"
}