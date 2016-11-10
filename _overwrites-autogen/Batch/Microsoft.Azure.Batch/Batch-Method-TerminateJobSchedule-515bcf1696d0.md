---
uid: 
remarks: *content
---
## Remarks  
 The terminate operation requests that the job schedule be terminated.  The request puts the schedule in the [Microsoft.Azure.Batch](assetId:///N:Microsoft.Azure.Batch?qualifyHint=False&autoUpgrade=True) state.             The Batch service will wait for any active job to terminate, and perform the actual job schedule termination without any further client action.  
  
 This is a blocking operation. For a non-blocking equivalent, see [TerminateJobScheduleAsync](assetId:///M:Microsoft.Azure.Batch.JobScheduleOperations.TerminateJobScheduleAsync(System.String,System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)?qualifyHint=False&autoUpgrade=True).