variable "name" {
  description = "Name of the Azure Container Registry."
  type        = string
}

variable "sku" {
  description = "The SKU name of the container registry."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the container registry."
  type        = string
}

variable "location" {
  description = "The Azure region in which to create the container registry."
  type        = string
}

variable "project" {
  description = "Project name."
  type        = string
}

variable "environment" {
  description = "The environment for the AKS cluster (e.g., dev, staging, prod)."
  type        = string
}

variable "tags" {
  description = "Tags to assign to all resources."
  type        = map(string)
  default     = {}
}