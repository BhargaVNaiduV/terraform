output "docker_null_tag_metadata" {
  value = [
    for idx in range(var.num_worker_nodes) : {
      instance_name = null_resource.docker_null_tag[idx].triggers.aws_vm_name
      test_var      = null_resource.docker_null_tag[idx].triggers.test_var
    }
  ]
}

output "docker_null_tag_metadata_conditional" {
  value = [
    for instance_name, res in null_resource.conditional_null_resource : {
      instance_name = instance_name
      test_var      = res.triggers.test_var
    }
  ]
}