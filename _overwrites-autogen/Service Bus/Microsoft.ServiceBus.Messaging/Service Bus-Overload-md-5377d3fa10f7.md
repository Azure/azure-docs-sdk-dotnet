---
uid: 
examples: *content
---
## Examples  
 The following example shows how to populate the [EntityPath](assetId:///P:Microsoft.ServiceBus.ServiceBusConnectionStringBuilder.EntityPath?qualifyHint=False&autoUpgrade=True) property in the connection string.  
  
```c#  
var connectionStringBuilder = new ServiceBusConnectionStringBuilder(connectionString);  
connectionStringBuilder.EntityPath = eventHubDescription.Path;  
  
var eventHubClient = EventHubClient.CreateFromConnectionString(connectionStringBuilder.ToString());  
```