---  
uid: Microsoft.Azure.Batch.TaskDependencies.#ctor(System.Collections.Generic.IEnumerable{System.String},System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.TaskIdRange})  
remarks: *content  
---  
  
## Remarks  
 This constructor provides the most general way of initializing a TaskDependencies object.             In practice, most dependencies are on a single task, a list of task ids, or a single range of             tasks. You can express these dependencies more clearly using [OnId](assetId:///M:Microsoft.Azure.Batch.TaskDependencies.OnId(System.String)?qualifyHint=False&autoUpgrade=True), [OnIds](assetId:///M:Microsoft.Azure.Batch.TaskDependencies.OnIds(System.String[])?qualifyHint=False&autoUpgrade=True),             [OnTasks](assetId:///M:Microsoft.Azure.Batch.TaskDependencies.OnTasks(Microsoft.Azure.Batch.CloudTask[])?qualifyHint=False&autoUpgrade=True), and [OnIdRange](assetId:///M:Microsoft.Azure.Batch.TaskDependencies.OnIdRange(System.Int32,System.Int32)?qualifyHint=False&autoUpgrade=True) methods.