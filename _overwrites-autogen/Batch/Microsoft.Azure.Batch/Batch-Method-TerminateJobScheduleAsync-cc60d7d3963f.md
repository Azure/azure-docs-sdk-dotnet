---  
uid: Microsoft.Azure.Batch.JobScheduleOperations.TerminateJobScheduleAsync(System.String,System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)  
remarks: *content  
---  
  
## Remarks  
 The terminate operation requests that the job schedule be terminated.  The request puts the schedule in the [Terminating](assetId:///T:Microsoft.Azure.Batch.Common.JobScheduleState?qualifyHint=False&autoUpgrade=True) state.             The Batch service will wait for any active job to terminate, and perform the actual job schedule termination without any further client action.  
  
 The terminate operation runs asynchronously.