---  
uid: Microsoft.ServiceBus.Messaging.MessageReceiver.ReceiveBatch  
examples: *content  
---  
  
## Examples  
  
```c#  
IEnumerable<BrokeredMessage> messageSet;  
messageSender.SendBatch(messageSet);  
messageSet = messageReceiver.ReceiveBatch(100); //max count  
```