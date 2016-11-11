---  
uid: Microsoft.Azure.Batch.PoolOperations.DeletePool(System.String,System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior})  
remarks: *content  
---  
  
## Remarks  
 The delete operation requests that the pool be deleted.  The request puts the pool in the [Deleting](assetId:///T:Microsoft.Azure.Batch.Common.PoolState?qualifyHint=False&autoUpgrade=True) state.             The Batch service will requeue any running tasks and perform the actual pool deletion without any further client action.  
  
 ---  
uid: Microsoft.Azure.Batch.PoolOperations.DeletePool(System.String,System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior})  
remarks: *content  
---  
## Remarks  
 This is a blocking operation. For a non-blocking equivalent, see [DeletePoolAsync](assetId:///M:Microsoft.Azure.Batch.PoolOperations.DeletePoolAsync(System.String,System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)?qualifyHint=False&autoUpgrade=True).