module "metric_filter_alarm_3_1" {
  source  = "dwp/metric-filter-alarm/aws"
  version = "2.0.2"

  log_group_name    = var.log_group_name
  metric_namespace  = var.log_group_name
  pattern           = "{ ($.errorCode = \"*UnauthorizedOperation\") || ($.errorCode = \"AccessDenied*\") }"
  alarm_name        = "3.1 Unauthorized API calls"
  alarm_action_arns = var.alarm_action_arns
}

module "metric_filter_alarm_3_2" {
  source  = "dwp/metric-filter-alarm/aws"
  version = "2.0.2"

  log_group_name    = var.log_group_name
  metric_namespace  = var.log_group_name
  pattern           = "{ ($.eventName = \"ConsoleLogin\") && ($.additionalEventData.MFAUsed != \"Yes\") }"
  alarm_name        = "3.2 Management Console sign-in without MFA"
  alarm_action_arns = var.alarm_action_arns
}

module "metric_filter_alarm_3_3" {
  source  = "dwp/metric-filter-alarm/aws"
  version = "2.0.2"

  log_group_name    = var.log_group_name
  metric_namespace  = var.log_group_name
  pattern           = "{ $.userIdentity.type = \"Root\" && $.userIdentity.invokedBy NOT EXISTS && $.eventType != \"AwsServiceEvent\" }"
  alarm_name        = "3.3 usage of root account"
  alarm_action_arns = var.alarm_action_arns
}

module "metric_filter_alarm_3_4" {
  source  = "dwp/metric-filter-alarm/aws"
  version = "2.0.2"

  log_group_name    = var.log_group_name
  metric_namespace  = var.log_group_name
  pattern           = "{(($.eventName=DeleteGroupPolicy)||($.eventName=DeleteRolePolicy)||($.eventName=DeleteUserPolicy)||($.eventName=PutGroupPolicy)||($.eventName=PutRolePolicy)||($.eventName=PutUserPolicy)||($.eventName=CreatePolicy)||($.eventName=DeletePolicy)||($.eventName=CreatePolicyVersion)||($.eventName=DeletePolicyVersion)||($.eventName=AttachRolePolicy)||($.eventName=DetachRolePolicy)||($.eventName=AttachUserPolicy)||($.eventName=DetachUserPolicy)||($.eventName=AttachGroupPolicy)||($.eventName=DetachGroupPolicy))&&($.userIdentity.sessionContext.sessionIssuer.userName!=orchestration-service-ecs-task-role)}"
  alarm_name        = "3.4 IAM policy changes"
  alarm_action_arns = var.alarm_action_arns
}

module "metric_filter_alarm_3_5" {
  source  = "dwp/metric-filter-alarm/aws"
  version = "2.0.2"

  log_group_name    = var.log_group_name
  metric_namespace  = var.log_group_name
  pattern           = "{ ($.eventName = CreateTrail) || ($.eventName = UpdateTrail) || ($.eventName = DeleteTrail) || ($.eventName = StartLogging) || ($.eventName = StopLogging) }"
  alarm_name        = "3.5 CloudTrail configuration changes"
  alarm_action_arns = var.alarm_action_arns
}

module "metric_filter_alarm_3_6" {
  source  = "dwp/metric-filter-alarm/aws"
  version = "2.0.2"

  log_group_name    = var.log_group_name
  metric_namespace  = var.log_group_name
  pattern           = "{ ($.eventName = ConsoleLogin) && ($.errorMessage = \"Failed authentication\") }"
  alarm_name        = "3.6 AWS Management Console authentication failures"
  alarm_action_arns = var.alarm_action_arns
}

module "metric_filter_alarm_3_7" {
  source  = "dwp/metric-filter-alarm/aws"
  version = "2.0.2"

  log_group_name    = var.log_group_name
  metric_namespace  = var.log_group_name
  pattern           = "{ ($.eventSource = kms.amazonaws.com) && (($.eventName=DisableKey) || ($.eventName=ScheduleKeyDeletion)) }"
  alarm_name        = "3.7 disabling or scheduled deletion of customer created CMKs"
  alarm_action_arns = var.alarm_action_arns
}

module "metric_filter_alarm_3_8" {
  source  = "dwp/metric-filter-alarm/aws"
  version = "2.0.2"

  log_group_name    = var.log_group_name
  metric_namespace  = var.log_group_name
  pattern           = "{ ($.eventSource = s3.amazonaws.com) && (($.eventName = PutBucketAcl) || ($.eventName = PutBucketPolicy) || ($.eventName = PutBucketCors) || ($.eventName = PutBucketLifecycle) || ($.eventName = PutBucketReplication) || ($.eventName = DeleteBucketPolicy) || ($.eventName = DeleteBucketCors) || ($.eventName = DeleteBucketLifecycle) || ($.eventName = DeleteBucketReplication)) }"
  alarm_name        = "3.8 S3 bucket policy changes"
  alarm_action_arns = var.alarm_action_arns
}

module "metric_filter_alarm_3_9" {
  source  = "dwp/metric-filter-alarm/aws"
  version = "2.0.2"

  log_group_name    = var.log_group_name
  metric_namespace  = var.log_group_name
  pattern           = "{($.eventSource = config.amazonaws.com) && (($.eventName=StopConfigurationRecorder) || ($.eventName=DeleteDeliveryChannel) || ($.eventName=PutDeliveryChannel) || ($.eventName=PutConfigurationRecorder))}"
  alarm_name        = "3.9 AWS Config configuration changes"
  alarm_action_arns = var.alarm_action_arns
}

module "metric_filter_alarm_3_10" {
  source  = "dwp/metric-filter-alarm/aws"
  version = "2.0.2"

  log_group_name    = var.log_group_name
  metric_namespace  = var.log_group_name
  pattern           = "{ ($.eventName = AuthorizeSecurityGroupIngress) || ($.eventName = AuthorizeSecurityGroupEgress) || ($.eventName = RevokeSecurityGroupIngress) || ($.eventName = RevokeSecurityGroupEgress) || ($.eventName = CreateSecurityGroup) || ($.eventName = DeleteSecurityGroup) }"
  alarm_name        = "3.10 security group changes"
  alarm_action_arns = var.alarm_action_arns
}

module "metric_filter_alarm_3_11" {
  source  = "dwp/metric-filter-alarm/aws"
  version = "2.0.2"

  log_group_name    = var.log_group_name
  metric_namespace  = var.log_group_name
  pattern           = "{ ($.eventName = CreateNetworkAcl) || ($.eventName = CreateNetworkAclEntry) || ($.eventName = DeleteNetworkAcl) || ($.eventName = DeleteNetworkAclEntry) || ($.eventName = ReplaceNetworkAclEntry) || ($.eventName = ReplaceNetworkAclAssociation) }"
  alarm_name        = "3.11 changes to Network Access Control Lists"
  alarm_action_arns = var.alarm_action_arns
}

module "metric_filter_alarm_3_12" {
  source  = "dwp/metric-filter-alarm/aws"
  version = "2.0.2"

  log_group_name    = var.log_group_name
  metric_namespace  = var.log_group_name
  pattern           = "{ ($.eventName = CreateCustomerGateway) || ($.eventName = DeleteCustomerGateway) || ($.eventName = AttachInternetGateway) || ($.eventName = CreateInternetGateway) || ($.eventName = DeleteInternetGateway) || ($.eventName = DetachInternetGateway) }"
  alarm_name        = "3.12 changes to network gateways"
  alarm_action_arns = var.alarm_action_arns
}

module "metric_filter_alarm_3_13" {
  source  = "dwp/metric-filter-alarm/aws"
  version = "2.0.2"

  log_group_name   = var.log_group_name
  metric_namespace = var.log_group_name
  pattern          = "{ ($.eventName = CreateRoute) || ($.eventName = CreateRouteTable) || ($.eventName = ReplaceRoute) || ($.eventName = ReplaceRouteTableAssociation) || ($.eventName = DeleteRouteTable) || ($.eventName = DeleteRoute) || ($.eventName = DisassociateRouteTable) }"
  alarm_name       = "3.13 route table changes"

  alarm_action_arns = var.alarm_action_arns
}

module "metric_filter_alarm_3_14" {
  source  = "dwp/metric-filter-alarm/aws"
  version = "2.0.2"

  log_group_name    = var.log_group_name
  metric_namespace  = var.log_group_name
  pattern           = "{ ($.eventName = CreateVpc) || ($.eventName = DeleteVpc) || ($.eventName = ModifyVpcAttribute) || ($.eventName = AcceptVpcPeeringConnection) || ($.eventName = CreateVpcPeeringConnection) || ($.eventName = DeleteVpcPeeringConnection) || ($.eventName = RejectVpcPeeringConnection) || ($.eventName = AttachClassicLinkVpc) || ($.eventName = DetachClassicLinkVpc) || ($.eventName = DisableVpcClassicLink) || ($.eventName = EnableVpcClassicLink) }"
  alarm_name        = "3.14 VPC changes"
  alarm_action_arns = var.alarm_action_arns
}
