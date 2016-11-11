---  
uid: Microsoft.Azure.Batch.PoolOperations.Reimage(System.String,System.String,System.Nullable{Microsoft.Azure.Batch.Common.ComputeNodeReimageOption},System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior})  
remarks: *content  
---  
  
## Remarks  
 You can reimage a compute node only when it is in the [Idle](assetId:///T:Microsoft.Azure.Batch.Common.ComputeNodeState?qualifyHint=False&autoUpgrade=True) or [Running](assetId:///T:Microsoft.Azure.Batch.Common.ComputeNodeState?qualifyHint=False&autoUpgrade=True) state.  
  
 This is a blocking operation. For a non-blocking equivalent, see [ReimageAsync](assetId:///M:Microsoft.Azure.Batch.PoolOperations.ReimageAsync(System.String,System.String,System.Nullable{Microsoft.Azure.Batch.Common.ComputeNodeReimageOption},System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)?qualifyHint=False&autoUpgrade=True).