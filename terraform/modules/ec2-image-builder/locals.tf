locals {
  git_component_template = templatefile("${path.module}/files/call_ansible_from_git.tfpl", {

  })

  user_data_suse_template = templatefile("${path.module}/files/user_data_suse.tfpl", {
    SUSE_SP_VERSION = var.suse_sp_version
  })

  user_data_suse_others = templatefile("${path.module}/files/user_data_others.tfpl", {

  })
}