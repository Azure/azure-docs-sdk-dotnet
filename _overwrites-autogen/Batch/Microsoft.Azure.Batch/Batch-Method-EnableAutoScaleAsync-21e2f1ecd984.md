---  
uid: Microsoft.Azure.Batch.CloudPool.EnableAutoScaleAsync(System.String,System.Nullable{System.TimeSpan},System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)  
remarks: *content  
---  
  
## Remarks  
 The formula is checked for validity before it is applied to the pool. If the formula is not valid, an exception occurs.  
  
 You cannot enable automatic scaling on a pool if a resize operation is in progress on the pool.  
  
 The enable autoscale operation runs asynchronously.