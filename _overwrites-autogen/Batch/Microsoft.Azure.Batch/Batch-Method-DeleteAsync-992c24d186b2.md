---
uid: 
remarks: *content
---
## Remarks  
 The delete operation requests that the job schedule be deleted.  The request puts the schedule in the [Microsoft.Azure.Batch](assetId:///N:Microsoft.Azure.Batch?qualifyHint=False&autoUpgrade=True) state.             The Batch service will delete any existing jobs and tasks under the schedule, including any active job, and perform the actual job schedule deletion without any further client action.  
  
 The delete operation runs asynchronously.