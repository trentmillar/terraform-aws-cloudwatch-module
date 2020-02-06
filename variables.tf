variable "cloudwatch_metric_alarms" {
  type        = list
  description = "Data feeding creation of Cloudwatch metric alarms"
}

variable "cloudwatch_metric_alarms_w_queries" {
  type        = list
  description = "Data feeding creation of Cloudwatch metric alarms that have metric queries"
}
