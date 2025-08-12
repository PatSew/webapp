variable "application_name" {
  type = string
}
variable "environment_name" {
  type = string
}
variable "primary_location" {
  type = string
}
variable "base_address_space" {
  type = string
}
variable "app_suffix" {
  type = string
}
variable "admin_username_db" {
  type = string
  default = "psqladmin"
}
variable "admin_password_db" {
  type = string
  sensitive = true
  default = "H@Sh1CoR3!"
}
variable "branch" {
  type = string
}