---
uid: 
remarks: *content
---
---
uid: 
examples: *content
---
## Remarks  
 A *persistent relay* (with the [Microsoft.ServiceBus](assetId:///N:Microsoft.ServiceBus?qualifyHint=True&autoUpgrade=True) property set to `false`) is a relay endpoint explicitly created by calling [NamespaceManager Class](assetId:///T:Microsoft.ServiceBus.NamespaceManager?qualifyHint=False&autoUpgrade=True). Even when there are no listeners connected, that endpoint is known to the Service Bus relay runtime. This feature gives the relay a place to store endpoint-specific SAS rules.  
  
## Examples  
 The following example creates a persistent relay with one listen rule and one send rule (the key values are generated automatically by the [Microsoft.ServiceBus Namespace](assetId:///N:Microsoft.ServiceBus?qualifyHint=False&autoUpgrade=True) constructor.  
  
```c#  
var namespaceManager = NamespaceManager.CreateFromConnectionString(rootConnectionString);  
var description = new RelayDescription(endpointPath, RelayType.NetTcp);  
var listenRule = new SharedAccessAuthorizationRule("MyListenKey", new List<AccessRights> { AccessRights.Listen });  
var sendRule = new SharedAccessAuthorizationRule("MySendKey", new List<AccessRights> { AccessRights.Send });  
description.Authorization.Add(listenRule);  
description.Authorization.Add(sendRule);  
description = namespaceManager.CreateRelayAsync(description).Result;  
```