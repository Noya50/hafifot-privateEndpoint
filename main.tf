resource "azurerm_private_endpoint" "this" {
  name                = "${var.connected_resource_name}-pe-tf"
  location            = var.location
  resource_group_name = var.resource_group
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = var.private_service_connection_name
    private_connection_resource_id = var.private_connection_resource_id
    is_manual_connection           = var.is_manual_connection
    request_message                = var.request_message
    subresource_names              = var.subresource_names
  }

  lifecycle {
    ignore_changes = [tags]
  }
}

module "diagnostic_setting" {
  source = "../diagnosticSetting"

  name                       = "${azurerm_private_endpoint.this.name}-diagnostic-setting-tf"
  target_resource_id         = azurerm_private_endpoint.this.network_interface[0].id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  diagnostic_setting_categories = var.diagnostic_setting_categories
}