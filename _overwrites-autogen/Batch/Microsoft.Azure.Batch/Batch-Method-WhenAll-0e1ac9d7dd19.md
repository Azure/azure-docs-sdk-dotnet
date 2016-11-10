---
uid: 
remarks: *content
---
## Remarks  
 The state of each [CloudTask](assetId:///T:Microsoft.Azure.Batch.CloudTask?qualifyHint=False&autoUpgrade=True) instance is assumed to be authoritative at the time of the call.             Instances that are already at the `desiredState` are ignored.             The [Microsoft.Azure.Batch](assetId:///N:Microsoft.Azure.Batch?qualifyHint=False&autoUpgrade=True) instances in the collection are treated as read-only.             This means that when the call completes (timeout or not) the [CloudTask](assetId:///T:Microsoft.Azure.Batch.CloudTask?qualifyHint=False&autoUpgrade=True) instances should be refreshed before using.  
  
 This method runs asynchronously.