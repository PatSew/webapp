variable "resource_group_name" {
  type        = string
}

variable "location" {
  type        = string
}

variable "vnet_id" {
  type        = string
}

variable "vnet_name" {
  type        = string
}

variable "subnet_db_id" {
  type        = string
}

variable "server_name" {
  type        = string
}

variable "postgres_version" {
  type        = string
  default     = "14"
}

variable "admin_username" {
  type        = string
}

variable "admin_password" {
  type        = string
  sensitive   = true
}

variable "availability_zone" {
  type    = string
  default = "1"
}

variable "storage_mb" {
  type    = number
  default = 131072
}

variable "storage_tier" {
  type    = string
  default = "P10"
}

variable "sku_name" {
  type    = string
  default = "B_Standard_B1ms"
}

variable "database_name" {
  type    = string
  default = "postgresdb"
}

variable "db_collation" {
  type    = string
  default = "en_US.utf8"
}

variable "db_charset" {
  type    = string
  default = "UTF8"
}