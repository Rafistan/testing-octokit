module "environment-master" {
  source = "./environment-master"
  name = "master"
  clean_name = "production"
  log_bucket_name = "ax-master-log-group"
  dns_name = "apps"
  private_dns_name = "private-apps"
  worker_dns_name = "worker-apps"
  config_filename = "configs-prod.yaml"
  sentry_env = "PROD"
  sentry_dsns = var.sentry_dsns
  logs_group_prefix = "PROD"
  region = data.aws_region.current.name
  sns_cloudwatch_topic_arns = [aws_sns_topic.ax_sns_cloudwatch_alarms.arn, aws_sns_topic.ax_sns_cloudwatch_alarms_pager.arn]
  sns_non_critical_cloudwatch_topic_arns = [aws_sns_topic.ax_sns_cloudwatch_alarms.arn]
  ecs_service_autoscale_role_arn = var.ecs_service_autoscale_role_arn
  lambdas_role_arn = var.lambdas_role_arn
  vpc_cidr_block = "172.16.0.0/16"
  stroeer_organization_id = 13
  default_tags = merge(var.default_tags, {"HS-ENVIRONMENT": "MASTER"})
  monitoring_subdomain = "monitoring"
  monitoring_ip = "18.210.118.102"
  alb_bucket_name = "ax-master-alb"
  cloudfront_bucket_name = "cloudfront-ax-master"
  default_ssl_certificate_arn = aws_acm_certificate.cert.arn
  additional_ssl_certificate_arns = []
  sns_failure_role_arn = var.sns_failure_role_arn
  sns_success_role_arn = var.sns_success_role_arn
  availability_zones = var.azs
  firehose_cidr_block = var.firehose_cidr_block
  master_redshift_user = "sa"
  master_redshift_password = lookup(var.redshift_passwords, "master-prod")
  firehose_redshift_user = "firehose"
  firehose_redshift_password = lookup(var.redshift_passwords, "firehose-prod")

  branch = "master"
  ecs_public_cluster_name_fg = "master-public"
  ecs_private_cluster_name_fg = "master-private"
  ecs_extras_cluster_name_fg = "master-extras"
  ecs_worker_cluster_name_fg = "master-worker"
  repository_urls = {
    "inventory" = aws_ecr_repository.inventory.repository_url
    "playlogs" = aws_ecr_repository.playlogs.repository_url
    "finance" = aws_ecr_repository.finance.repository_url
    "campaigns" = aws_ecr_repository.campaigns.repository_url
    "notifications" = aws_ecr_repository.notifications.repository_url
    "openrtb" = aws_ecr_repository.openrtb.repository_url
    "users" = aws_ecr_repository.users.repository_url
    "avails" = aws_ecr_repository.avails.repository_url
    "frontend" = aws_ecr_repository.frontend.repository_url
    "nirvana" = aws_ecr_repository.nirvana.repository_url
    "public-api" = aws_ecr_repository.public-api.repository_url
    "overwatch" = aws_ecr_repository.overwatch.repository_url
    "datadog-agent" = aws_ecr_repository.datadog_agent.repository_url
  }
  additional_public_dns_records = toset([
    "apps-admin",
    "astral",
    "buntin",
    "captivate",
    "cineplex",
    "clearchannel",
    "doordash",
    "kinetic",
    "mediacom",
    "mindshare",
    "olg",
    "omg",
    "oohlabs",
    "outfront",
    "posterscope",
    "stroeer",
    "talon",
    "tradeooh",
    "vision7",
    "vmo",
    "wavemaker",
    "xaxis",
    "zoommedia",
  ])
  public_hosted_zone_id = var.public_hosted_zone_id
  datadog_api_key = var.datadog_api_key
  ssh_debug_public_key = var.ssh_debug_public_key
  base_dns_name = var.base_dns_name
  alb_access_logs_db = aws_athena_database.alb-access-logs-db.name
  ad_requests_logs_db = aws_athena_database.ad_requests_db.name
  alb_access_logs_s3_bucket_athena_results = aws_s3_bucket.query-results-db.bucket
  elb_account_id = var.elb_account_id
  mysql_app_passwords = var.prod_mysql_app_passwords
  other_db_passwords = var.prod_other_db_passwords
  circleci_user_name = var.circleci_user_name
  dev_ro_group_ids = [var.admin_group_id, var.devs_group_id]
  dev_rw_group_ids = [var.admin_group_id]
  secrets = var.prod_secrets
  additional_s3_bucket_arns = var.prod_additional_s3_bucket_arns
  quicksight_cidr_block = var.quicksight_cidr_block
  cloudfront_ssl_cert_arn = var.cloudfront_ssl_cert_arn
  redis_node_type = "cache.m5.xlarge"
}

module "environment-uat" {
  source = "./environment-uat"
  log_bucket_name = "ax-uat-log-group"
  name = "uat"
  clean_name = "uat"
  dns_name = "uat"
  private_dns_name = "private-uat"
  worker_dns_name = "worker-uat"
  config_filename = "configs-uat.yaml"
  sentry_env = "UAT"
  sentry_dsns = var.sentry_dsns
  logs_group_prefix = "UAT"
  region = data.aws_region.current.name
  sns_cloudwatch_topic_arns = [aws_sns_topic.ax_sns_cloudwatch_alarms.arn]
  sns_non_critical_cloudwatch_topic_arns = [aws_sns_topic.ax_sns_cloudwatch_alarms.arn]
  ecs_service_autoscale_role_arn = var.ecs_service_autoscale_role_arn
  lambdas_role_arn = var.lambdas_role_arn
  vpc_cidr_block = "172.15.0.0/16"
  stroeer_organization_id = 139
  default_tags = merge(var.default_tags, {"HS-ENVIRONMENT": "UAT"})
  monitoring_subdomain = "monitoring"
  monitoring_ip = "18.210.118.102"
  alb_bucket_name = "ax-uat-alb"
  cloudfront_bucket_name = "cloudfront-ax-uat"
  default_ssl_certificate_arn = aws_acm_certificate.cert.arn
  additional_ssl_certificate_arns = []
  sns_failure_role_arn = var.sns_failure_role_arn
  sns_success_role_arn = var.sns_success_role_arn
  availability_zones = var.azs
  firehose_cidr_block = var.firehose_cidr_block
  master_redshift_user = "sa"
  master_redshift_password = lookup(var.redshift_passwords, "master-uat")
  firehose_redshift_user = "firehose"
  firehose_redshift_password = lookup(var.redshift_passwords, "firehose-uat")

  branch = "uat"
  ecs_public_cluster_name_fg = "uat-public"
  ecs_private_cluster_name_fg = "uat-private"
  ecs_extras_cluster_name_fg = "uat-extras"
  ecs_worker_cluster_name_fg = "uat-worker"
  repository_urls = {
    "inventory" = aws_ecr_repository.inventory.repository_url
    "playlogs" = aws_ecr_repository.playlogs.repository_url
    "finance" = aws_ecr_repository.finance.repository_url
    "campaigns" = aws_ecr_repository.campaigns.repository_url
    "notifications" = aws_ecr_repository.notifications.repository_url
    "openrtb" = aws_ecr_repository.openrtb.repository_url
    "users" = aws_ecr_repository.users.repository_url
    "avails" = aws_ecr_repository.avails.repository_url
    "frontend" = aws_ecr_repository.frontend.repository_url
    "nirvana" = aws_ecr_repository.nirvana.repository_url
    "public-api" = aws_ecr_repository.public-api.repository_url
    "overwatch" = aws_ecr_repository.overwatch.repository_url
    "datadog-agent" = aws_ecr_repository.datadog_agent.repository_url
  }
  additional_public_dns_records = toset([
    "uat-admin",
    "uat-asiaray",
    "uat-astral",
    "uat-bell",
    "uat-mediacom",
    "uat-outfront",
    "uat-stroeer",
    "uat-zoommedia",
  ])
  public_hosted_zone_id = var.public_hosted_zone_id
  datadog_api_key = var.datadog_api_key
  ssh_debug_public_key = var.ssh_debug_public_key
  base_dns_name = var.base_dns_name
  alb_access_logs_db = aws_athena_database.alb-access-logs-db.name
  ad_requests_logs_db = aws_athena_database.ad_requests_db.name
  alb_access_logs_s3_bucket_athena_results = aws_s3_bucket.query-results-db.bucket
  elb_account_id = var.elb_account_id
  mysql_app_passwords = var.uat_mysql_app_passwords
  other_db_passwords = var.uat_other_db_passwords
  circleci_user_name = var.circleci_user_name
  dev_ro_group_ids = [var.admin_group_id, var.devs_group_id]
  dev_rw_group_ids = [var.admin_group_id, var.devs_group_id]
  secrets = var.uat_secrets
  additional_s3_bucket_arns = var.uat_additional_s3_bucket_arns
  quicksight_cidr_block = var.quicksight_cidr_block
  cloudfront_ssl_cert_arn = var.cloudfront_ssl_cert_arn
  redis_node_type = "cache.m5.large"
}

module "environment-staging" {
  log_bucket_name = "ax-staging-log-group"
  source = "./environment-staging"
  name = "staging"
  clean_name = "staging"
  dns_name = "staging"
  private_dns_name = "private-staging"
  worker_dns_name = "worker-staging"
  config_filename = "configs-staging.yaml"
  sentry_env = "STAGING"
  sentry_dsns = var.sentry_dsns
  logs_group_prefix = "STAGING"
  region = data.aws_region.current.name
  sns_cloudwatch_topic_arns = [aws_sns_topic.ax_sns_cloudwatch_alarms.arn]
  sns_non_critical_cloudwatch_topic_arns = [aws_sns_topic.ax_sns_cloudwatch_alarms.arn]
  ecs_service_autoscale_role_arn = var.ecs_service_autoscale_role_arn
  lambdas_role_arn = var.lambdas_role_arn
  vpc_cidr_block = "172.14.0.0/16"
  stroeer_organization_id = 0
  default_tags = merge(var.default_tags, {"HS-ENVIRONMENT": "STAGING"})
  monitoring_subdomain = "monitoring"
  monitoring_ip = "18.210.118.102"
  mysql_ip = "172.31.51.191"
  mysql_ro_ips = [
    "172.31.51.191",
  ]
  alb_bucket_name = "ax-staging-alb"
  cloudfront_bucket_name = "cloudfront-ax-staging"
  default_ssl_certificate_arn = aws_acm_certificate.cert.arn
  additional_ssl_certificate_arns = []
  sns_failure_role_arn = var.sns_failure_role_arn
  sns_success_role_arn = var.sns_success_role_arn
  availability_zones = var.azs
  firehose_cidr_block = var.firehose_cidr_block
  master_redshift_user = "sa"
  master_redshift_password = lookup(var.redshift_passwords, "master-staging")
  firehose_redshift_user = "firehose"
  firehose_redshift_password = lookup(var.redshift_passwords, "firehose-staging")

  branch = "staging"
  ecs_public_cluster_name_fg = "staging-public"
  ecs_private_cluster_name_fg = "staging-private"
  ecs_worker_cluster_name_fg = "staging-worker"
  ecs_extras_cluster_name_fg = "staging-extras"
  repository_urls = {
    "inventory" = aws_ecr_repository.inventory.repository_url
    "playlogs" = aws_ecr_repository.playlogs.repository_url
    "finance" = aws_ecr_repository.finance.repository_url
    "campaigns" = aws_ecr_repository.campaigns.repository_url
    "notifications" = aws_ecr_repository.notifications.repository_url
    "openrtb" = aws_ecr_repository.openrtb.repository_url
    "users" = aws_ecr_repository.users.repository_url
    "avails" = aws_ecr_repository.avails.repository_url
    "frontend" = aws_ecr_repository.frontend.repository_url
    "nirvana" = aws_ecr_repository.nirvana.repository_url
    "public-api" = aws_ecr_repository.public-api.repository_url
    "overwatch" = aws_ecr_repository.overwatch.repository_url
    "datadog-agent" = aws_ecr_repository.datadog_agent.repository_url
  }
"undefined"
  additional_public_dns_records = toset([
    "staging-admin",
    "staging-astral",
    "staging-mediacom",
    "staging-outfront",
    "staging-stroeer",
    "staging-zoommedia",
  ])
  public_hosted_zone_id = var.public_hosted_zone_id
  datadog_api_key = var.datadog_api_key
  ssh_debug_public_key = var.ssh_debug_public_key
  base_dns_name = var.base_dns_name
  alb_access_logs_db = aws_athena_database.alb-access-logs-db.name
  ad_requests_logs_db = aws_athena_database.ad_requests_db.name
  alb_access_logs_s3_bucket_athena_results = aws_s3_bucket.query-results-db.bucket
  elb_account_id = var.elb_account_id
  mysql_app_passwords = var.staging_mysql_app_passwords
  other_db_passwords = var.staging_other_db_passwords
  circleci_user_name = var.circleci_user_name
  dev_ro_group_ids = [var.admin_group_id, var.devs_group_id]
  dev_rw_group_ids = [var.admin_group_id, var.devs_group_id]
  secrets = var.staging_secrets
  additional_s3_bucket_arns = var.staging_additional_s3_bucket_arns
  quicksight_cidr_block = var.quicksight_cidr_block
  cloudfront_ssl_cert_arn = var.cloudfront_ssl_cert_arn
  redis_node_type = "cache.m5.large"
}
