terraform {
#   required_version = ">= 0.12.6"

  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
    #   version = "~> 2.21"
    }
  }
}
# Configure the New Relic provider
provider "newrelic" {
  account_id = 3931806
  api_key = "NRAK-A42JT4CZMWA2FR1R7HEB8LISU8J" # Usually prefixed with 'NRAK'
  region = "US"                    # Valid regions are US and EU
}