resource "azurerm_kubernetes_cluster" "aks" {
  location            = var.location
  name                = var.aks_name
  resource_group_name = var.resource_group_name
  #dns_prefix_private_cluster = var.aks_name
  dns_prefix = var.aks_name
  #private_cluster_enabled    = local.sandbox_subscription == true ? var.aks_name : null
  #private_dns_zone_id        = var.private_dns_zone_id

  service_mesh_profile {
    mode      = "Istio"
    revisions = ["asm-1-23"]
  }



  identity {
    type = "SystemAssigned"
  }

  azure_policy_enabled             = true
  http_application_routing_enabled = false
  local_account_disabled           = true

  default_node_pool {
    name                    = "default"
    vm_size                 = var.vm_size
    vnet_subnet_id          = data.azurerm_subnet.aks_subnet.id
    host_encryption_enabled = true
    node_count              = var.node_count
    zones                   = [1, 2, 3]

    upgrade_settings {
      max_surge                     = "10%"
      drain_timeout_in_minutes      = 0
      node_soak_duration_in_minutes = 0
    }
  }
  azure_active_directory_role_based_access_control {
    admin_group_object_ids = var.aks_admin_group
    azure_rbac_enabled     = true
  }

  #Network profile
  network_profile {
    network_plugin      = "azure"
    network_policy      = "calico"
    load_balancer_sku   = "standard"
    network_plugin_mode = "overlay"
    service_cidr        = var.service_cidr
    dns_service_ip      = var.dns_service_ip


  }

  oms_agent {
    log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log_analytics.id
  }

  tags = var.tags

}

resource "azurerm_monitor_diagnostic_setting" "aks_diagnostic" {
  name                       = "${var.aks_name}-diagnostic"
  target_resource_id         = azurerm_kubernetes_cluster.aks.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log_analytics.id

  metric {
    category = "AllMetrics"
    enabled  = true
  }


  enabled_log {
    category_group = "allLogs"
  }

}