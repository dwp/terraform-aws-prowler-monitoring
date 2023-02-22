# AWS Prowler monitoring Terraform module
Terraform module that creates a collection of AWS log metric filters and alarms to satisfy section 3 of the [Prowler Monitoring](https://github.com/toniblyx/prowler) checks. This modules uses the [AWS metric filter alarm](https://registry.terraform.io/modules/dwp/metric-filter-alarm/aws) Terraform module.

## Usage
```hcl
module "my_prowler_monitoring" {
  source = "dwp/prowler-monitoring/aws"

  log_group_name = "MyLogGroup"
}
```

## Examples
The following example creates a CloudWatch Log Group, SNS Topic and alarms to satisfy section 3 of the Prowler monitoring checks.
If any of the alarms go into an "ALARM" state a notification will be sent to the SNS Topic.
```hcl

resource "aws_cloudwatch_log_group" "MyLogGroup" {
  name = "MyLogGroup"
}

resource "aws_sns_topic" "MyTopic" {
  name = "MyTopic"
  display_name = "My Topic"
}

module "my_prowler_monitoring" {
  source = "dwp/prowler-monitoring/aws"

  log_group_name = aws_cloudwatch_log_group.MyLogGroup.name
  alarm_action_arns = [aws_sns_topic.MyTopic.arn]
}
```
