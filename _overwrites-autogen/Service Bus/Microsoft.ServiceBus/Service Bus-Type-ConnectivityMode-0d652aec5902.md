---  
uid: Microsoft.ServiceBus.ConnectivityMode  
remarks: *content  
---  
  
## Remarks  
 The connectivity mode differs from the [TransportType](assetId:///T:Microsoft.ServiceBus.Messaging.TransportType?qualifyHint=False&autoUpgrade=True) protocol that the service specifies for client communication. The transport type is determined by the binding used.              No matter which [TransportType](assetId:///T:Microsoft.ServiceBus.Messaging.TransportType?qualifyHint=False&autoUpgrade=True) you select (NetMessaging or AMQP), the communication occurs over the selected connectivity mode.              For example, you can have AMQP occur over TCP or HTTP(S).