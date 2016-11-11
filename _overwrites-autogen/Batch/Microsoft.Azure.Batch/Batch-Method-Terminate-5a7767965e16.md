---  
uid: Microsoft.Azure.Batch.CloudJobSchedule.Terminate(System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior})  
remarks: *content  
---  
  
## Remarks  
 The terminate operation requests that the job schedule be terminated.  The request puts the schedule in the [Terminating](assetId:///T:Microsoft.Azure.Batch.Common.JobScheduleState?qualifyHint=False&autoUpgrade=True) state.             The Batch service will wait for any active job to terminate, and perform the actual job schedule termination without any further client action.  
  
 This is a blocking operation. For a non-blocking equivalent, see [TerminateAsync](assetId:///M:Microsoft.Azure.Batch.CloudJobSchedule.TerminateAsync(System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)?qualifyHint=False&autoUpgrade=True).