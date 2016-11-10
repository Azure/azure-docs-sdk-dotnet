---
uid: 
remarks: *content
---
---
uid: 
examples: *content
---
## Remarks  
 For more information, see [Service Bus Support in Microsoft Azure Tools for Visual Studio](http://msdn.microsoft.com/library/jj149830).  
  
## Examples  
 The following example shows how to populate the [EntityPath](assetId:///P:Microsoft.ServiceBus.ServiceBusConnectionStringBuilder.EntityPath?qualifyHint=False&autoUpgrade=True) property in the connection string.  
  
```c#  
var connectionStringBuilder = new ServiceBusConnectionStringBuilder(connectionString);  
connectionStringBuilder.EntityPath = queueDescription.Path;  
  
var queueClient = QueueClient.CreateFromConnectionString(connectionStringBuilder.ToString());  
```