variable "var-name" {
    type = list(string)
  
}
variable "application_name" {
  description = "The name of the New Relic application to monitor"
  type        = string
  default= "Anuj Policy terraform default"
}

variable "account_id" {
  description = "The account ID the application reports to"
  type        = number
  default= 3931806
}

variable "policy_name" {
  description = "The name of the alert policy to manage"
  type        = string
  default     = null
}

variable "runbook_url" {
  description = "A URL that points to a runbook for when this application is failing"
  type        = string
  default     = null
}

variable "incident_preference" {
  description = "The rollup strategy of the alert policy.  Valid values are PER_POLICY, PER_CONDITION, and PER_CONDITION_AND_TARGET"
  type        = string
  default     = "PER_POLICY"
}

variable "channel_ids" {
  description = "The notification channel IDs to link to this alert policy"
  type        = list(number)
  default     = null
}

variable "apdex_warning_threshold" {
  description = "The threshold below which a warning violation will be triggered for the Apdex condition (percentage satisfied users)"
  type        = number
  default     = 0.8
}

variable "apdex_critical_threshold" {
  description = "The threshold below which a critical violation will be triggered for the Apdex condition (percentage satisfied users)"
  type        = number
  default     = 0.7
}

variable "apdex_duration" {
  description = "The evaluation window length of the Apdex condition (seconds). Value must be a multiple of 60 and within 120-3600 seconds for baseline conditions and 120-7200 seconds for static conditions."
  type        = number
  default     = 300
}

variable "apdex_t" {
  description = "The response time above which a transaction is considered tolerable"
  type        = number
  default     = 0.4
}

variable "error_rate_warning_threshold" {
  description = "The threshold above which a warning violation will be triggered for the error rate condition (errors/minute)"
  type        = number
  default     = 2
}

variable "error_rate_critical_threshold" {
  description = "The threshold above which a critical violation will be triggered for the error rate condition (errors/minute)"
  type        = number
  default     = 5
}

variable "error_rate_duration" {
  description = "The evaluation window length of the error rate condition (seconds). Value must be a multiple of 60 and within 120-3600 seconds for baseline conditions and 120-7200 seconds for static conditions."
  type        = number
  default     = 300
}

