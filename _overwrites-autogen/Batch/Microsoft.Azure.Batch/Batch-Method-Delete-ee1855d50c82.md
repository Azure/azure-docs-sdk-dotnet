---  
uid: Microsoft.Azure.Batch.CloudJob.Delete(System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior})  
remarks: *content  
---  
  
## Remarks  
 The delete operation requests that the job be deleted.  The request puts the job in the [Deleting](assetId:///T:Microsoft.Azure.Batch.Common.JobState?qualifyHint=False&autoUpgrade=True) state.             The Batch service will stop any running tasks and perform the actual job deletion without any further client action.  
  
 This is a blocking operation. For a non-blocking equivalent, see [DeleteAsync](assetId:///M:Microsoft.Azure.Batch.CloudJob.DeleteAsync(System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)?qualifyHint=False&autoUpgrade=True).