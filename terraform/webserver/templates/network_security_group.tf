resource "azurerm_network_security_group" "jindou_network_security_group" {
  name                = "${var.env_name}-nsg"
  location            = "${azurerm_resource_group.jindou_resource_group.location}"
  resource_group_name = "${azurerm_resource_group.jindou_resource_group.name}"
}

resource "azurerm_network_security_rule" "jindou_network_security_rule" {
  name                        = "Allow-Http"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${azurerm_resource_group.jindou_resource_group.name}"
  network_security_group_name = "${azurerm_network_security_group.jindou_network_security_group.name}"
}