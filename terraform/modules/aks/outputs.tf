output "cluster_id" {
  description = "ID of AKS cluster."
  value       = azurerm_kubernetes_cluster.formbricks.id
}

output "kube_config" {
    description = "Raw Kubernetes config."
    value       = azurerm_kubernetes_cluster.formbricks.kube_config_raw
}

output "client_key" {
    description = "Base64 encoded private key used by clients to authenticate to the Kubernetes cluster."
    value       = azurerm_kubernetes_cluster.formbricks.0.client_key
}

output "client_certificate" {
    description = "Base64 encoded public certificate."
    value       = azurerm_kubernetes_cluster.formbricks.0.client_certificate
}

output "cluster_ca_certificate" {
    description = "Base64 encoded public CA certificate."
    value       = azurerm_kubernetes_cluster.formbricks.0.cluster_ca_certificate
}

output "host" {
    description = "The Kubernetes cluster server host."
    value       = azurerm_kubernetes_cluster.formbricks.0.host
}