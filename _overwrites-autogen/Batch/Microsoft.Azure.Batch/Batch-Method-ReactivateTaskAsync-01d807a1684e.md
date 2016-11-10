---
uid: 
remarks: *content
---
## Remarks  
 Reactivation makes a task eligible to be retried again up to its maximum retry count.  
  
 Additionally, this will fail if the job is in the [Microsoft.Azure.Batch](assetId:///N:Microsoft.Azure.Batch?qualifyHint=False&autoUpgrade=True) or [Completed](assetId:///T:Microsoft.Azure.Batch.Common.JobState?qualifyHint=False&autoUpgrade=True) or [Terminating](assetId:///T:Microsoft.Azure.Batch.Common.JobState?qualifyHint=False&autoUpgrade=True) state.             This is a blocking operation. For a non-blocking equivalent, see [JobOperations Class](assetId:///T:Microsoft.Azure.Batch.JobOperations?qualifyHint=False&autoUpgrade=True).  
  
 The reactivate operation runs asynchronously.