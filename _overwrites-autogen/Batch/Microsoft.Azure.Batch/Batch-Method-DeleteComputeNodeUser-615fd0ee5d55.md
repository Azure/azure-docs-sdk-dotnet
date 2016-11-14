---  
uid: Microsoft.Azure.Batch.PoolOperations.DeleteComputeNodeUser(System.String,System.String,System.String,System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior})  
remarks: *content  
---  
  
## Remarks  
 You can delete a user account from a compute node only when it is in the [Idle](assetId:///T:Microsoft.Azure.Batch.Common.ComputeNodeState?qualifyHint=False&autoUpgrade=True) or [Running](assetId:///T:Microsoft.Azure.Batch.Common.ComputeNodeState?qualifyHint=False&autoUpgrade=True) state.  
  
 This is a blocking operation. For a non-blocking equivalent, see [DeleteComputeNodeUserAsync](assetId:///M:Microsoft.Azure.Batch.PoolOperations.DeleteComputeNodeUserAsync(System.String,System.String,System.String,System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)?qualifyHint=False&autoUpgrade=True).