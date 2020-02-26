# ------------------------------------------------------------------------------
# MAIN IGNITION CONFIG RENDERER
# ------------------------------------------------------------------------------

data "ignition_config" "default" {

  users = [
    data.ignition_user.core.rendered
  ]

  # https://github.com/hashicorp/terraform/issues/22805
  networkd = flatten([
      data.ignition_networkd_unit.network_interfaces.*.rendered
  ])
    
  files = [
    data.ignition_file.etc_hostname.rendered,
    data.ignition_file.default_link_policy.rendered,
    data.ignition_file.toolboxrc.rendered,
    data.ignition_file.bash_python_bootstrap.rendered,
    data.ignition_file.profile_env.rendered
  ]

  systemd = [
      data.ignition_systemd_unit.sshd_socket.rendered,
      data.ignition_systemd_unit.vmtoolsd_service.rendered,
      data.ignition_systemd_unit.var_lib_docker.rendered,
      data.ignition_systemd_unit.docker_service.rendered,
      data.ignition_systemd_unit.update_engine_service.rendered,
      data.ignition_systemd_unit.locksmithd_service.rendered,
      data.ignition_systemd_unit.python_pip_service.rendered,
      data.ignition_systemd_unit.net_check_service.rendered
  ]

  filesystems = [
    data.ignition_filesystem.sdb.rendered
  ]

}

output "ignition_config_base64" {
  value = base64encode(data.ignition_config.default.rendered)
}

output "ignition_config" {
  value = data.ignition_config.default.rendered
}