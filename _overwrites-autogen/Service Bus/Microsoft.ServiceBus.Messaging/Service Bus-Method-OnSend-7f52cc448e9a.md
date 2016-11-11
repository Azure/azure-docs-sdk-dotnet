---  
uid: Microsoft.ServiceBus.Messaging.MessageSender.OnSend(Microsoft.ServiceBus.Tracing.TrackingContext,System.Collections.Generic.IEnumerable{Microsoft.ServiceBus.Messaging.BrokeredMessage},System.TimeSpan)  
remarks: *content  
---  
  
## Remarks  
 Typically the timeout comes from [OperationTimeout](assetId:///P:Microsoft.ServiceBus.Messaging.MessagingFactorySettings.OperationTimeout?qualifyHint=False&autoUpgrade=True).  
  
 OnSend is equal to `this.OnEndSend(this.OnBeginSend(messages, timeout, null, null));`.