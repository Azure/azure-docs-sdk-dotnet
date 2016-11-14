---  
uid: Microsoft.Azure.Batch.CloudPool.RemoveFromPoolAsync(Microsoft.Azure.Batch.ComputeNode,System.Nullable{Microsoft.Azure.Batch.Common.ComputeNodeDeallocationOption},System.Nullable{System.TimeSpan},System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)  
remarks: *content  
---  
  
## Remarks  
 If you need to remove multiple compute nodes from a pool, it is more efficient to use the [RemoveFromPoolAsync](assetId:///M:Microsoft.Azure.Batch.CloudPool.RemoveFromPoolAsync(System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.ComputeNode},System.Nullable{Microsoft.Azure.Batch.Common.ComputeNodeDeallocationOption},System.Nullable{System.TimeSpan},System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)?qualifyHint=False&autoUpgrade=True) overload.  
  
 You can only remove nodes from a pool when the [AllocationState](assetId:///P:Microsoft.Azure.Batch.CloudPool.AllocationState?qualifyHint=False&autoUpgrade=True) of the pool is [Steady](assetId:///T:Microsoft.Azure.Batch.Common.AllocationState?qualifyHint=False&autoUpgrade=True). If the pool is already resizing, an exception occurs.  
  
 When you remove nodes from a pool, the pool's [AllocationState](assetId:///P:Microsoft.Azure.Batch.CloudPool.AllocationState?qualifyHint=False&autoUpgrade=True) changes from [Steady](assetId:///T:Microsoft.Azure.Batch.Common.AllocationState?qualifyHint=False&autoUpgrade=True) to [Resizing](assetId:///T:Microsoft.Azure.Batch.Common.AllocationState?qualifyHint=False&autoUpgrade=True).  
  
 The remove operation runs asynchronously.