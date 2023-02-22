output "terratest_log_group_id" {
  value       = aws_cloudwatch_log_group.terratest_prowler_log_group.id
  description = "The ID of the log group"
}

output "terratest_topic_arn" {
  value       = aws_sns_topic.terratest_prowler_sns_topic.arn
  description = "The arn of the topic"
}
