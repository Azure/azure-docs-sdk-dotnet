---
uid: 
remarks: *content
---
## Remarks  
 You can only remove nodes from a pool when the [Microsoft.Azure.Batch](assetId:///N:Microsoft.Azure.Batch?qualifyHint=False&autoUpgrade=True) of the pool is [Steady](assetId:///T:Microsoft.Azure.Batch.Common.AllocationState?qualifyHint=False&autoUpgrade=True). If the pool is already resizing, an exception occurs.  
  
 When you remove nodes from a pool, the pool's AllocationState changes from Steady to [Resizing](assetId:///T:Microsoft.Azure.Batch.Common.AllocationState?qualifyHint=False&autoUpgrade=True).  
  
 The remove operation runs asynchronously.