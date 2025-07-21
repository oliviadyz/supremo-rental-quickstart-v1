resource "null_resource" "validate_inputs" {
  lifecycle {
    precondition {
      condition     = var.network_creation_strategy == "USE_EXISTING_VCN_SUBNET" ? (var.existing_vcn_id != "" && var.existing_vm_subnet_id != "" && var.existing_private_subnet_id != "") : true
      error_message = "If network_creation_strategy is 'USE_EXISTING_VCN_SUBNET', then need to provide 'existing_vcn_id', 'existing_vm_subnet_id', 'existing_opensearch_private_subnet_id' and 'existing_redis_private_subnet_id'"
    }
  }
}
