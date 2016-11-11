---  
uid: Microsoft.Azure.Batch.CloudJobSchedule.Delete(System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior})  
remarks: *content  
---  
  
## Remarks  
 The delete operation requests that the job schedule be deleted.  The request puts the schedule in the [Deleting](assetId:///T:Microsoft.Azure.Batch.Common.JobScheduleState?qualifyHint=False&autoUpgrade=True) state.             The Batch service will delete any existing jobs and tasks under the schedule, including any active job, and perform the actual job schedule deletion without any further client action.  
  
 This is a blocking operation. For a non-blocking equivalent, see [DeleteAsync](assetId:///M:Microsoft.Azure.Batch.CloudJobSchedule.DeleteAsync(System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)?qualifyHint=False&autoUpgrade=True).