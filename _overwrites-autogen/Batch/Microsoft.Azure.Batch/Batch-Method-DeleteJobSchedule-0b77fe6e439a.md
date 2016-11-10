---
uid: 
remarks: *content
---
## Remarks  
 The delete operation requests that the job schedule be deleted.  The request puts the schedule in the [Microsoft.Azure.Batch](assetId:///N:Microsoft.Azure.Batch?qualifyHint=False&autoUpgrade=True) state.             The Batch service will delete any existing jobs and tasks under the schedule, including any active job, and perform the actual job schedule deletion without any further client action.  
  
 This is a blocking operation. For a non-blocking equivalent, see [DeleteJobScheduleAsync](assetId:///M:Microsoft.Azure.Batch.JobScheduleOperations.DeleteJobScheduleAsync(System.String,System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)?qualifyHint=False&autoUpgrade=True).