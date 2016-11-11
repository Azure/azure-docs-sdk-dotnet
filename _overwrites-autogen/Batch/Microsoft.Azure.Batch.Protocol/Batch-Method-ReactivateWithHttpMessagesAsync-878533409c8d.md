---  
uid: Microsoft.Azure.Batch.Protocol.ITaskOperations.ReactivateWithHttpMessagesAsync(System.String,System.String,Microsoft.Azure.Batch.Protocol.Models.TaskReactivateOptions,System.Collections.Generic.Dictionary{System.String,System.Collections.Generic.List{System.String}},System.Threading.CancellationToken)  
remarks: *content  
---  
  
## Remarks  
 Reactivation makes a task eligible to be retried again up to its             maximum retry count. This will fail for tasks that are not             completed or that previously completed successfully (with an exit             code of 0). Additionally, this will fail if the job has completed             (or is terminating or deleting).