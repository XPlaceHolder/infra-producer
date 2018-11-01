resource "azurerm_subnet" "san_subnet" {
  name                 = "san-subnet"
  resource_group_name  = "${azurerm_resource_group.jindou_resource_group.name}"
  virtual_network_name = "${azurerm_virtual_network.jindou_virtual_network.name}"
  address_prefix       = "${cidrsubnet(azurerm_virtual_network.jindou_virtual_network.address_space[0], 8, 0)}"
}

resource "azurerm_subnet_network_security_group_association" "jindou_nsg_association" {
  subnet_id                 = "${azurerm_subnet.san_subnet.id}"
  network_security_group_id = "${azurerm_network_security_group.jindou_network_security_group.id}"
}
