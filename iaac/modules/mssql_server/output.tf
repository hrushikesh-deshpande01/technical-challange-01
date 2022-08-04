output "storage_account_name" {
	value = azurerm_storage_account.this.*.name
}
output "mssql_server_name" {
	value = azurerm_mssql_server.this.*.name
}
output "mssql_db_name" {
	value = azurerm_mssql_database.this.*.name
}