resource "aws_cloudwatch_metric_alarm" "them_alarms" {
  count = "${length(var.cloudwatch_metric_alarms)}"

  alarm_name                = "${var.cloudwatch_metric_alarms[count.index].alarm_name}"
  comparison_operator       = "${var.cloudwatch_metric_alarms[count.index].comparison_operator}"
  evaluation_periods        = "${var.cloudwatch_metric_alarms[count.index].evaluation_periods}"
  metric_name               = "${var.cloudwatch_metric_alarms[count.index].metric_name}"
  namespace                 = "${var.cloudwatch_metric_alarms[count.index].namespace}"
  period                    = "${var.cloudwatch_metric_alarms[count.index].period}"
  statistic                 = "${var.cloudwatch_metric_alarms[count.index].statistic}"
  threshold                 = "${var.cloudwatch_metric_alarms[count.index].threshold}"
  alarm_description         = "${var.cloudwatch_metric_alarms[count.index].alarm_description}"
  alarm_actions             = "${var.cloudwatch_metric_alarms[count.index].alarm_actions}"
  insufficient_data_actions = "${var.cloudwatch_metric_alarms[count.index].insufficient_data_actions}"
  treat_missing_data        = "${var.cloudwatch_metric_alarms[count.index].treat_missing_data}"
  datapoints_to_alarm       = "${var.cloudwatch_metric_alarms[count.index].datapoints_to_alarm}"

}

resource "aws_cloudwatch_metric_alarm" "them_alarms_w_queries" {
  count = "${length(var.cloudwatch_metric_alarms_w_queries)}"

  alarm_name                = "${var.cloudwatch_metric_alarms_w_queries[count.index].alarm_name}"
  comparison_operator       = "${var.cloudwatch_metric_alarms_w_queries[count.index].comparison_operator}"
  evaluation_periods        = "${var.cloudwatch_metric_alarms_w_queries[count.index].evaluation_periods}"
  threshold                 = "${var.cloudwatch_metric_alarms_w_queries[count.index].threshold}"
  alarm_description         = "${var.cloudwatch_metric_alarms_w_queries[count.index].alarm_description}"
  alarm_actions             = "${var.cloudwatch_metric_alarms_w_queries[count.index].alarm_actions}"
  insufficient_data_actions = "${var.cloudwatch_metric_alarms_w_queries[count.index].insufficient_data_actions}"
  treat_missing_data        = "${var.cloudwatch_metric_alarms_w_queries[count.index].treat_missing_data}"
  datapoints_to_alarm       = "${var.cloudwatch_metric_alarms_w_queries[count.index].datapoints_to_alarm}"

  dynamic "metric_query" {
    for_each = "${var.cloudwatch_metric_alarms_w_queries[count.index].metric_query}"
    content {
      id          = metric_query.value["id"]
      expression  = metric_query.value["expression"]
      label       = metric_query.value["label"]
      return_data = metric_query.value["return_data"]
    }
  }

  dynamic "metric_query" {
    for_each = "${var.cloudwatch_metric_alarms_w_queries[count.index].unit_metric}"
    content {
      id = metric_query.value["id"]
      metric {
        metric_name = metric_query.value["metric_name"]
        namespace   = metric_query.value["namespace"]
        period      = metric_query.value["period"]
        stat        = metric_query.value["stat"]
        unit        = metric_query.value["unit"]
        dimensions  = metric_query.value["dimensions"]
      }
    }
  }

  dynamic "metric_query" {
    for_each = "${var.cloudwatch_metric_alarms_w_queries[count.index].metric}"
    content {
      id = metric_query.value["id"]
      metric {
        metric_name = metric_query.value["metric_name"]
        namespace   = metric_query.value["namespace"]
        period      = metric_query.value["period"]
        stat        = metric_query.value["stat"]
        dimensions  = metric_query.value["dimensions"]
      }
    }
  }

  dynamic "metric_query" {
    for_each = "${var.cloudwatch_metric_alarms_w_queries[count.index].shared_metric}"
    content {
      id = metric_query.value["id"]
      metric {
        metric_name = metric_query.value["metric_name"]
        namespace   = metric_query.value["namespace"]
        period      = metric_query.value["period"]
        stat        = metric_query.value["stat"]
      }
    }
  }
}
