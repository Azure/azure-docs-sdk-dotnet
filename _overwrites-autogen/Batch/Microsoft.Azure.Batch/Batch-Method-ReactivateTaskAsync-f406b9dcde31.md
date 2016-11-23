---  
uid: Microsoft.Azure.Batch.JobOperations.ReactivateTaskAsync(System.String,System.String,System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)  
remarks: *content  
---  
  
## Remarks  
 Reactivation makes a task eligible to be retried again up to its maximum retry count.  
  
 Additionally, this will fail if the job is in the [Completed](assetId:///T:Microsoft.Azure.Batch.Common.JobState?qualifyHint=False&autoUpgrade=True) or [Terminating](assetId:///T:Microsoft.Azure.Batch.Common.JobState?qualifyHint=False&autoUpgrade=True) or [Deleting](assetId:///T:Microsoft.Azure.Batch.Common.JobState?qualifyHint=False&autoUpgrade=True) state.             This is a blocking operation. For a non-blocking equivalent, see ReactivateTaskAsync.  
  
 The reactivate operation runs asynchronously.