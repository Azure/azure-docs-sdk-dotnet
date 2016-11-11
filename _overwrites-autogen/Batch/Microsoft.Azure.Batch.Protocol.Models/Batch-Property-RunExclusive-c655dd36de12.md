---  
uid: Microsoft.Azure.Batch.Protocol.Models.JobManagerTask.RunExclusive  
remarks: *content  
---  
  
## Remarks  
 If true, no other tasks will run on the same compute node for as             long as the Job Manager is running. If false, other tasks can run             simultaneously with the Job Manager on a compute node. The Job             Manager task counts normally against the node's concurrent task             limit, so this is only relevant if the node allows multiple             concurrent tasks.