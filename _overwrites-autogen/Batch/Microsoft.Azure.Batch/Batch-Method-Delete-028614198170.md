---  
uid: Microsoft.Azure.Batch.CloudPool.Delete(System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior})  
remarks: *content  
---  
  
## Remarks  
 The delete operation requests that the pool be deleted.  The request puts the pool in the [Deleting](assetId:///T:Microsoft.Azure.Batch.Common.PoolState?qualifyHint=False&autoUpgrade=True) state.             The Batch service will requeue any running tasks and perform the actual pool deletion without any further client action.  
  
 ---  
uid: Microsoft.Azure.Batch.CloudPool.Delete(System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior})  
remarks: *content  
---  
## Remarks  
 This is a blocking operation. For a non-blocking equivalent, see [DeleteAsync](assetId:///M:Microsoft.Azure.Batch.CloudPool.DeleteAsync(System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)?qualifyHint=False&autoUpgrade=True).