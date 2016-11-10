---
uid: 
remarks: *content
---
---
uid: 
examples: *content
---
## Remarks  
 [Microsoft.ServiceBus.Messaging](assetId:///N:Microsoft.ServiceBus.Messaging?qualifyHint=False&autoUpgrade=True) enables you to view available sessions without locking or receiving. Browsed sessions can be locked by other consumers, and the browse request will not return locked sessions.  
  
## Examples  
  
```c#  
QueueClient queueClient = QueueClient.Create("myQ");  
IEnumerable<MessageSession> allSessions = queueClient.GetMessageSessions();  
IEnumerable<MessageSession> newSessions = queueClient.GetMessageSessions(  
   DateTime.Now.Subtract(TimeSpan.FromMinutes(5)));  
```