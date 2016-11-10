---
uid: 
remarks: *content
---
## Remarks  
 The delete operation requests that the pool be deleted.  The request puts the pool in the [Microsoft.Azure.Batch](assetId:///N:Microsoft.Azure.Batch?qualifyHint=False&autoUpgrade=True) state.             The Batch service will requeue any running tasks and perform the actual pool deletion without any further client action.  
  
 ## Remarks  
 This is a blocking operation. For a non-blocking equivalent, see [DeletePoolAsync](assetId:///M:Microsoft.Azure.Batch.PoolOperations.DeletePoolAsync(System.String,System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)?qualifyHint=False&autoUpgrade=True).