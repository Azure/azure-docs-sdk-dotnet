---  
uid: Microsoft.ServiceBus.Messaging.SubscriptionClient.OnMessage  
remarks: *content  
---  
  
## Remarks  
 When calling OnMessage, the client starts an internal message pump that constantly polls the queue or subscription. This message pump consists of an infinite loop that issues a `Receive()` call. If the call times out, it issues the next `Receive()` call. The timeout is the value of the [OperationTimeout](assetId:///P:Microsoft.ServiceBus.Messaging.MessagingFactorySettings.OperationTimeout?qualifyHint=False&autoUpgrade=True) property of the [MessagingFactory](assetId:///T:Microsoft.ServiceBus.Messaging.MessagingFactory?qualifyHint=False&autoUpgrade=True) that is used. The default value of this timeout is 60 seconds. You can modify the timeout by changing the [OperationTimeout](assetId:///P:Microsoft.ServiceBus.Messaging.MessagingFactorySettings.OperationTimeout?qualifyHint=False&autoUpgrade=True) property before creating the [MessagingFactory](assetId:///T:Microsoft.ServiceBus.Messaging.MessagingFactory?qualifyHint=False&autoUpgrade=True). Note that every receive operation is a billable event.