variable "name" {
  description = "Name of Database used by Application"
  default     = "test_db"
}

variable "username" {
  description = "Database Username"
  default     = "test_db_username"
}
variable "password" {
  description = "Database Password"
  default    = "test_db_password"
}
variable "endpoint" {
  description = "Database Host"
  default     = "mysql.snow"
}
