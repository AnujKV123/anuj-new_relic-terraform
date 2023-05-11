locals {
  policy_name = var.policy_name == null ? "${var.application_name}: APM Monitoring" : var.policy_name
}

resource "newrelic_alert_policy" "policy" {
  name                = local.policy_name
  incident_preference = var.incident_preference
  channel_ids         = var.channel_ids
}

resource "newrelic_nrql_alert_condition" "apdex_condition" {
    count = length(var.var-name)
  policy_id = newrelic_alert_policy.policy.id
  name = var.var-name[count.index]
 
  type        = "static"
  runbook_url = var.runbook_url
  enabled     = true

  warning {
    operator              = "below"
    threshold             = var.apdex_warning_threshold
    threshold_duration    = var.apdex_duration
    threshold_occurrences = "ALL"
  }

  critical {
    operator              = "below"
    threshold             = var.apdex_critical_threshold
    threshold_duration    = var.apdex_duration
    threshold_occurrences = "ALL"
  }

  nrql {
    query             = "SELECT apdex(duration, t: ${var.apdex_t}) FROM Transaction WHERE appName = '${var.application_name}' AND accountId = ${var.account_id}"
    evaluation_offset = 3
  }
}

resource "newrelic_nrql_alert_condition" "error_rate_condition" {
  policy_id = newrelic_alert_policy.policy.id

  name        = "Error rate (High)"
  type        = "static"
  runbook_url = var.runbook_url
  enabled     = true

  critical {
    operator              = "above"
    threshold             = var.error_rate_critical_threshold
    threshold_duration    = var.error_rate_duration
    threshold_occurrences = "ALL"
  }

  warning {
    operator              = "above"
    threshold             = var.error_rate_warning_threshold
    threshold_duration    = var.error_rate_duration
    threshold_occurrences = "ALL"
  }

  nrql {
    query             = "SELECT percentage(count(*), WHERE error IS TRUE) FROM Transaction WHERE appName = '${var.application_name}' AND accountId = ${var.account_id}"
    evaluation_offset = 3
  }

 }

