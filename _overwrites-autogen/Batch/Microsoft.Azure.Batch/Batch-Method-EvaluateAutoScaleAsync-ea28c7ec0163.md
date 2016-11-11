---  
uid: Microsoft.Azure.Batch.PoolOperations.EvaluateAutoScaleAsync(System.String,System.String,System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)  
remarks: *content  
---  
  
## Remarks  
 The formula is validated and its results calculated, but is not applied to the pool.  To apply the formula to the pool, use [EnableAutoScaleAsync](assetId:///M:Microsoft.Azure.Batch.PoolOperations.EnableAutoScaleAsync(System.String,System.String,System.Nullable{System.TimeSpan},System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)?qualifyHint=False&autoUpgrade=True).  
  
 This method does not change any state of the pool, and does not affect the [LastModified](assetId:///P:Microsoft.Azure.Batch.CloudPool.LastModified?qualifyHint=False&autoUpgrade=True) or [ETag](assetId:///P:Microsoft.Azure.Batch.CloudPool.ETag?qualifyHint=False&autoUpgrade=True).  
  
 The evaluate operation runs asynchronously.