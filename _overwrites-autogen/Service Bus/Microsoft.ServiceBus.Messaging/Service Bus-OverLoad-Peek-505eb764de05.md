---  
uid: Microsoft.ServiceBus.Messaging.QueueClient.Peek  
remarks: *content  
---  
  
## Remarks  
 This method enables you to view messages without locking or receiving them.  
  
---  
uid: Microsoft.ServiceBus.Messaging.QueueClient.Peek  
examples: *content  
---  
  
## Examples  
  
```c#  
QueueClient queueClient = QueueClient.Create("myQ");  
var message = queueClient.Peek(); // does not lock the message  
var message = queueClient.Peek(fromSequenceNumber: 4); // specific starting point  
```