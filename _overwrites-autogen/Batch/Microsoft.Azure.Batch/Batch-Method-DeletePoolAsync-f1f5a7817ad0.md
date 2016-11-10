---
uid: 
remarks: *content
---
## Remarks  
 The delete operation requests that the pool be deleted.  The request puts the pool in the [Microsoft.Azure.Batch](assetId:///N:Microsoft.Azure.Batch?qualifyHint=False&autoUpgrade=True) state.             The Batch service will requeue any running tasks and perform the actual pool deletion without any further client action.  
  
 The delete operation runs asynchronously.