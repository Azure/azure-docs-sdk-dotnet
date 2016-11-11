---  
uid: Microsoft.ServiceBus.NamespaceManager.CreateRelayAsync  
remarks: *content  
---  
  
## Remarks  
 A *persistent relay* (with the [RelayDescription.IsDynamic](assetId:///P:Microsoft.ServiceBus.Messaging.RelayDescription.IsDynamic?qualifyHint=True&autoUpgrade=True) property set to `false`) is a relay endpoint explicitly created by calling CreateRelayAsync. Even when there are no listeners connected, that endpoint is known to the Service Bus relay runtime. This feature gives the relay a place to store endpoint-specific SAS rules.  
  
---  
uid: Microsoft.ServiceBus.NamespaceManager.CreateRelayAsync  
examples: *content  
---  
  
## Examples  
 The following example creates a persistent relay with one listen rule and one send rule (the key values are generated automatically by the [SharedAccessAuthorizationRule](assetId:///T:Microsoft.ServiceBus.Messaging.SharedAccessAuthorizationRule?qualifyHint=False&autoUpgrade=True) constructor.  
  
```c#  
var namespaceManager = NamespaceManager.CreateFromConnectionString(rootConnectionString);  
var description = new RelayDescription(endpointPath, RelayType.NetTcp);  
var listenRule = new SharedAccessAuthorizationRule("MyListenKey", new List<AccessRights> { AccessRights.Listen });  
var sendRule = new SharedAccessAuthorizationRule("MySendKey", new List<AccessRights> { AccessRights.Send });  
description.Authorization.Add(listenRule);  
description.Authorization.Add(sendRule);  
description = namespaceManager.CreateRelayAsync(description).Result;  
```