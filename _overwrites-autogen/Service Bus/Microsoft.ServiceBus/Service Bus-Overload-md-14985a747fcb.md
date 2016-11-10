---
uid: 
remarks: *content
---
## Remarks  
 If you do not create a subscription using one of the overloads that explicitly specifies a rule description, a default rule will be created for you.  
  
> [!NOTE]
>  The only permitted characters in a subscription name are “0-9,” “a-z,” “A-Z,” “_” and “.” (period). If you create a subscription with a name containing special or encoded characters (for example, "test?Name=value&" or "test%3FName%3Dvalue%26", a [ArgumentException](assetId:///T:System.ArgumentException?qualifyHint=False&autoUpgrade=True) or [WebException](assetId:///T:System.Net.WebException?qualifyHint=False&autoUpgrade=True) with the message "The remote server returned an error: (401) Unauthorized" will be generated. Subscription names cannot be nested (for example, Test/MySubscription).