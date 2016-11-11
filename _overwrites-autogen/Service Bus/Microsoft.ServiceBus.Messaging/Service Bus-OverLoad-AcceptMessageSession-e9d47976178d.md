---  
uid: Microsoft.ServiceBus.Messaging.MessagingFactory.AcceptMessageSession  
remarks: *content  
---  
  
## Remarks  
 AcceptMessageSession works within the scope of the entire service namespace. It currently only supports session-enabled entities, and does not include the dead-letter queue (or other sub-queues).  
  
> [!NOTE]
>  `AcceptMessageSession` is currently only supported in the [!INCLUDE[sb_onprem](../Token/sb_onprem_md.md)]. In the [!INCLUDE[sb1](../Token/sb1_md.md)], a [NotSupportedException](assetId:///T:System.NotSupportedException?qualifyHint=False&autoUpgrade=True) exception is returned.