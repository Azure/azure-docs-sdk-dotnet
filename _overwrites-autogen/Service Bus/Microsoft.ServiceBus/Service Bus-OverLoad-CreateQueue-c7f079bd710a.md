---  
uid: Microsoft.ServiceBus.NamespaceManager.CreateQueue  
remarks: *content  
---  
  
## Remarks  
  
> [!NOTE]
>  The only permitted characters in a queue name are “0-9,” “a-z,” “A-Z,” “_” and “.” (period). If you create a queue with a name containing special or encoded characters (for example, "test?Name=value&" or "test%3FName%3Dvalue%26", a [ArgumentException](assetId:///T:System.ArgumentException?qualifyHint=False&autoUpgrade=True) or [WebException](assetId:///T:System.Net.WebException?qualifyHint=False&autoUpgrade=True) with the message "The remote server returned an error: (401) Unauthorized" will be generated. However, queue names can be nested, for example My/Queue.