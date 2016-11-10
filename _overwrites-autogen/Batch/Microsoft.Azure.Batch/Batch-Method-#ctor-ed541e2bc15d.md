---
uid: 
remarks: *content
---
## Remarks  
 This constructor provides the most general way of initializing a TaskDependencies object.             In practice, most dependencies are on a single task, a list of task ids, or a single range of             tasks. You can express these dependencies more clearly using [TaskDependencies](assetId:///T:Microsoft.Azure.Batch.TaskDependencies?qualifyHint=False&autoUpgrade=True), [Microsoft.Azure.Batch](assetId:///N:Microsoft.Azure.Batch?qualifyHint=False&autoUpgrade=True),             [OnTasks](assetId:///M:Microsoft.Azure.Batch.TaskDependencies.OnTasks(Microsoft.Azure.Batch.CloudTask[])?qualifyHint=False&autoUpgrade=True), and [OnIdRange](assetId:///M:Microsoft.Azure.Batch.TaskDependencies.OnIdRange(System.Int32,System.Int32)?qualifyHint=False&autoUpgrade=True) methods.