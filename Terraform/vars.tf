variable "region" {
  description = "Region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "naming_prefix" {
  description = "The prefix required for the naming module"
  type        = string
}

########################
# VPC variables
########################

variable "vpc_cidr" {
  description = "CIDR of the VPC"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "lama-blog"
}

variable "project_short" {
  description = "Short form of the project"
  type        = string
  default     = "lb"
}

variable "environment" {
  description = "Environment of the project"
  type        = string
}

variable "number_of_azs" {
  description = "Number of AZs in the region"
  type        = number
}

########################
# S3 variables
########################
variable "s3force_destroy" {
  description = "Whether to force destroy the bucket"
  type        = bool
}
variable "s3versioning" {
  description = "Enable/Disable S3 versioning"
  type        = bool
}


##################
# RDS variables
#################
variable "engine" {
  description = "THe SQL engine for the RDS"
  type        = string
}
variable "engine_version" {
  description = "The SQL engine version"
  type        = string
}
variable "db_instance_class" {
  description = "The instance type of the RDS DB Instance"
  type        = string
}
variable "rds_storage" {
  description = "The amount of Storage for RDS in GiB"
  type        = number
}
variable "max_storage" {
  description = "The maximum storage for rds autoscaling"
  type        = number
  default     = 0
}
variable "multi_az" {
  description = "Whether to create a multi AZ RDS or not"
  type        = bool
}
variable "rds_db" {
  description = "The name of the database inside the RDS instance"
  type        = string
}
variable "rds_username" {
  description = "The master username for RDS"
  type        = string
  default     = "admin"
}
variable "rds_port" {
  description = "The port for RDS database"
  type        = string
  default     = "3306"
}
variable "password_rotation" {
  description = "Whether to enable automatic password rotation"
  type        = bool
}
variable "password_rotation_frequency" {
  description = "The number of days between automatic password rotations"
  type        = number
  default     = 10
}
variable "deletion_protection" {
  type = bool
}

#######################
# Cloudfront
#######################
variable "price_class" {
  description = "The distribution scale: Whole World, Major Continents, Few Countries?"
  type        = string
}
variable "default_root_object" {
  description = "The default root object that the cloudfront fetches the content from"
  type        = string
}

########## ACM
variable "validation_method" {
  type    = string
  default = "DNS"
}


##############
## SNS
##############
variable "create_topic_policy" {
  description = "Whether to create a topic policy or not"
  type        = bool
  default     = true
}
variable "subscription_endpoint" {
  description = "The endpoint for the sns topic subscription"
  type        = string
  default     = "sandeshislama7@gmail.com"
}
variable "subscription_protocol" {
  description = "The type of sns topic subscription"
  type        = string
  default     = "email"
}
