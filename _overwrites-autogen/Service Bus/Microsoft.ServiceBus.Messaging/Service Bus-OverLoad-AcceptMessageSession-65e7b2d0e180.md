---  
uid: Microsoft.ServiceBus.Messaging.QueueClient.AcceptMessageSession  
remarks: *content  
---  
  
## Remarks  
 With AMQP, if the [T:Microsoft.ServiceBus.Messaging.ServiceBusMessagingFactorySettings.OperationTimeout](assetId:///T:Microsoft.ServiceBus.Messaging.ServiceBusMessagingFactorySettings.OperationTimeout?qualifyHint=False&autoUpgrade=True) value is too small, AcceptMessageSession cannot accept a session, even if a session is available.