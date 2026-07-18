variable "resource_group_name" {
  description = "The name of the resource group in which to create the AKS cluster."
  type        = string
}

variable "cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
}

variable "location" {
  description = "The Azure region in which to create the AKS cluster."
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the AKS cluster."
  type        = number
  default     = 3
}

variable "node_vm_size" {
  description = "The size of the virtual machines in the AKS cluster."
  type        = string
  default     = "Standard_B2s"
}

variable "dns_prefix" {
    description = "The DNS prefix to use with the AKS cluster."
    type        = string
}

variable "environment" {
  description = "The environment for the AKS cluster (e.g., dev, staging, prod)."
  type        = string
}

variable "project" {
  description = "Project name."
  type        = string
}

variable "tags" {
  description = "Tags to assign to all resources."
  type        = map(string)
  default     = {}
}