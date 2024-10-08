locals {
  region            = var.region
  validation_method = var.validation_method

  ###### Naming module
  naming_prefix = var.naming_prefix
  project_short = var.project_short
  project       = var.project
  environment   = var.environment

  ###### VPC
  vpc = {
    name = module.naming.resources.vpc.name
    cidr = var.vpc_cidr
    azs  = slice(data.aws_availability_zones.available.names, 0, var.number_of_azs)
  }
  number_of_azs = var.number_of_azs

  ###### RDS
  rds_identifier    = module.naming.resources.rds.name
  engine            = var.engine
  engine_version    = var.engine_version
  db_instance_class = var.db_instance_class
  rds_storage       = var.rds_storage
  max_storage       = var.max_storage
  multi_az          = var.multi_az
  rds_db            = var.rds_db
  rds_username      = var.rds_username
  rds_port          = var.rds_port

  proxy_name = "${local.rds_identifier}-proxy"
  proxy_role = "${local.proxy_name}-role"

  password_rotation           = var.password_rotation
  password_rotation_frequency = var.password_rotation_frequency

  deletion_protection = var.deletion_protection

  #### S3
  frontend_bucket = {
    name = module.naming.resources.s3.name
  }
  s3force_destroy = var.s3force_destroy
  s3versioning    = var.s3versioning

  domain_name = "${local.project}.${local.environment}.sandbox.adex.ltd"

  #### Cloudfront
  price_class         = var.price_class
  default_root_object = var.default_root_object


  ####### SNS
  sns = {
    name                  = module.naming.resources.sns.name
    create_topic_policy   = var.create_topic_policy
    subscription_protocol = var.subscription_protocol
    subscription_endpoint = var.subscription_endpoint
  }

  ####### CloudWatch ALARMS #####
  rdsALARM = {
    cpu = {
      comparison_operator = "GreaterThanThreshold"
      evaluation_periods  = 2
      metric_name         = "CPUUtilization"
      period              = 60
      statistic           = "Average"
      threshold           = 85
      alarm_description   = "ALARM when RDS Instance CPU Utilization is over 85%"
    },
    storage = {
      comparison_operator = "LessThanThreshold"
      evaluation_periods  = 3
      metric_name         = "FreeLocalStoragePercent"
      period              = 60
      statistic           = "Average"
      threshold           = 10
      alarm_description   = "ALARM when RDS Free Storage Average is below 10 %"
    },
    connection = {
      comparison_operator = "GreaterThanThreshold"
      evaluation_periods  = 2
      metric_name         = "DatabaseConnections"
      period              = 60
      statistic           = "Average"
      threshold           = 30
      alarm_description   = "ALARM when Active DB Connection Average is over 30"
    }

  }
}
