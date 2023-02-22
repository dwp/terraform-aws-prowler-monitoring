variable "log_group_name" {
  type        = string
  description = "The name of the log group to associate the metric filter with"
}

variable "metric_namespace" {
  type        = string
  description = "The destination namespace of the CloudWatch metric"
  default     = "Prowler/Monitoring"
}

variable "alarm_action_arns" {
  type        = list(any)
  description = "The list of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an Amazon Resource Number (ARN)"
  default     = []
}
