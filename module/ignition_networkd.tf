
# ------------------------------------------------------------------------------
# IGNITION NETWORK
# ------------------------------------------------------------------------------

data "ignition_networkd_unit" "network_interfaces" {

  count = length(var.ip_address)
  name  = "00-${element(var.network_interface_name, count.index)}.network"

  content = <<EOT
[Match]
Name=${element(var.network_interface_name, count.index)}
[Network]
Address=${element(var.ip_address, count.index)}/${element(var.ip_address_prefix, count.index)}
%{if element(var.ip_address_gateway, count.index) != ""}Gateway=${element(var.ip_address_gateway, count.index)}%{endif}
%{for dns in var.dns_servers~}
DNS=${dns}
%{endfor~}
EOT
}