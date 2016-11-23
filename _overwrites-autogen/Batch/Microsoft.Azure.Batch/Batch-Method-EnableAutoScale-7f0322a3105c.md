---  
uid: Microsoft.Azure.Batch.CloudPool.EnableAutoScale(System.String,System.Nullable{System.TimeSpan},System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior})  
remarks: *content  
---  
  
## Remarks  
 The formula is checked for validity before it is applied to the pool. If the formula is not valid, an exception occurs.  
  
 You cannot enable automatic scaling on a pool if a resize operation is in progress on the pool.  
  
 This is a blocking operation. For a non-blocking equivalent, see [EnableAutoScaleAsync](assetId:///M:Microsoft.Azure.Batch.CloudPool.EnableAutoScaleAsync(System.String,System.Nullable{System.TimeSpan},System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)?qualifyHint=False&autoUpgrade=True).