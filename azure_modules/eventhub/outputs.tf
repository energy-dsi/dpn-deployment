output "eventhub_namespace" {
  value       = azurerm_eventhub_namespace.eventhub_kafka # The actual value to be outputted
  description = "The name of the Event Hub namespace"     # Description of what this output represents
}