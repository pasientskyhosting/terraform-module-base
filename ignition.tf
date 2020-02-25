# ------------------------------------------------------------------------------
# MAIN IGNITION CONFIG RENDERER
# ------------------------------------------------------------------------------

data "ignition_config" "default" {

  users = [
    data.ignition_user.core.id
  ]
    
  files = [
    data.ignition_file.etc_hostname.id    
  ]

}