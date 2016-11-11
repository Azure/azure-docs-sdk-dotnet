---  
uid: Microsoft.Azure.Batch.Protocol.IBatchRequest.CancellationToken  
remarks: *content  
---  
  
## Remarks  
 Cancelling this token will cancel the currently ongoing request. This applies to the initial request as well             as any subsequent requests created due to [RetryPolicy](assetId:///P:Microsoft.Azure.Batch.Protocol.IBatchRequest.RetryPolicy?qualifyHint=False&autoUpgrade=True). Cancelling this token also forbids all             future retries of this [IBatchRequest](assetId:///T:Microsoft.Azure.Batch.Protocol.IBatchRequest?qualifyHint=False&autoUpgrade=True).