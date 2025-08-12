variable "application_name" {
  type        = string
}
variable "environment_name" {
  type        = string
}
variable "resource_group_name" {
  type        = string
}
variable "location" {
  type        = string
}
variable "subnet_id" {
  type        = string
}
variable "postgres_server_fqdn" {
  type        = string
}
variable "postgres_db_name" {
  type        = string
}
variable "postgres_admin_username" {
  type        = string
}
variable "postgres_admin_password" {
  type        = string
  sensitive   = true
}
variable "repo_url" {
  type        = string
}
variable "repo_branch" {
  type        = string
}
variable "web_app_name" {
  type        = string
}
variable "acr_admin_username" {
  type        = string
}
variable "acr_admin_password" {
  type        = string
}
variable "acr_image_name" {
  type        = string
}
variable "acr_registry_url" {
  type        = string
}