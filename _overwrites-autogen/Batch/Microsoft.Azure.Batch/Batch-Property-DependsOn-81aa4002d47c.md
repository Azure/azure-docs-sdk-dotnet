---  
uid: Microsoft.Azure.Batch.CloudTask.DependsOn  
remarks: *content  
---  
  
## Remarks  
 The job must set [UsesTaskDependencies](assetId:///P:Microsoft.Azure.Batch.CloudJob.UsesTaskDependencies?qualifyHint=False&autoUpgrade=True) to true in order to use task dependencies. If UsesTaskDependencies              is false (the default), adding a task with dependencies will fail with an error.