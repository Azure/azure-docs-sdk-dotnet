---  
uid: Microsoft.Azure.Batch.PoolOperations.DeletePoolAsync(System.String,System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)  
remarks: *content  
---  
  
## Remarks  
 The delete operation requests that the pool be deleted.  The request puts the pool in the [Deleting](assetId:///T:Microsoft.Azure.Batch.Common.PoolState?qualifyHint=False&autoUpgrade=True) state.             The Batch service will requeue any running tasks and perform the actual pool deletion without any further client action.  
  
 The delete operation runs asynchronously.