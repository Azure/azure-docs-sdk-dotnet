---  
uid: Microsoft.Azure.Batch.Protocol.Models.JobPatchParameter.PoolInfo  
remarks: *content  
---  
  
## Remarks  
 You may change the pool for a job only when the job is disabled.             The Patch Job call will fail if you include the poolInfo element             and the job is not disabled. If you specify an             autoPoolSpecification specification in the poolInfo, only the             keepAlive property can be updated, and then only if the auto pool             has a poolLifetimeOption of job. If omitted, the job continues to             run on its current pool.