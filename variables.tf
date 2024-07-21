variable "connected_resource_name" {
  description = "(Required) The name of the resource to which the pe is connected. From this name it generates the name of the PE resource."
  type        = string
}

variable "resource_group" {
  description = "(Required) The resource group of the private endpoint."
  type        = string
}

variable "location" {
  description = "(Required) The location of the private endpoint resource."
  type        = string
}

variable "subnet_id" {
  description = "(Required) The id of the subnet of the private endpoint"
  type        = string
}

variable "subresource_names" {
  description = "(Required) Specifies the names of the sub-resources within the target service that the private endpoint should connect to."
  type        = list(string)
}

variable "private_connection_resource_id" {
  description = "(Required) The name of the resource to which the point will belong."
}

variable "log_analytics_workspace_id" {
  description = "(Required) log analytics workspace id for the diagnostic setting."
  type = string
}

variable "diagnostic_setting_categories" {
  description = "(Optional) Categories for the diagnostic setting of the private endpoint."
  type = list(string)
  default = null
}

variable "is_manual_connection" {
  description = "(Optional) Specify whether the approval of the private endpoint connection is handled manually"
  default     = false
  type        = bool
  validation {
    condition     = can(regex("^(true|false)$", var.is_manual_connection))
    error_message = "Invalid value, only allowed values are: 'true' or 'false'. Default 'false'"
  }
}

variable "request_message" {
  description = "(Optional) Message that is sent with the private endpoint connection request."
  default     = "PL"
  type        = string
}

variable "private_service_connection_name" {
  description = "(Optional) The name of the service connection"
  default     = "private-service-connection-tf"
  type        = string
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the private endpoint resource."
  type        = map(string)
  default     = {}
}
