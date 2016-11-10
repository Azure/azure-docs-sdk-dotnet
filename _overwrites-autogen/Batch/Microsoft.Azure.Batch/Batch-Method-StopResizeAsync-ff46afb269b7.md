---
uid: 
remarks: *content
---
## Remarks  
 This operation stops an ongoing resize operation on the pool.  The pool size will stabilize at the number of nodes it is at             when the stop operation is done.  During the stop operation, the pool [Microsoft.Azure.Batch](assetId:///N:Microsoft.Azure.Batch?qualifyHint=False&autoUpgrade=True) changes first             to [Stopping](assetId:///T:Microsoft.Azure.Batch.Common.AllocationState?qualifyHint=False&autoUpgrade=True) and then to [Steady](assetId:///T:Microsoft.Azure.Batch.Common.AllocationState?qualifyHint=False&autoUpgrade=True).  
  
 The stop resize operation runs asynchronously.