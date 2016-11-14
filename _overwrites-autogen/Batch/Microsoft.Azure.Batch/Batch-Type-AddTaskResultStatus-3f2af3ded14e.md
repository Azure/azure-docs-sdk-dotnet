---  
uid: Microsoft.Azure.Batch.AddTaskResultStatus  
remarks: *content  
---  
  
## Remarks  
 AddTaskResultStatus is not used to report non-retryable failure; a result handler should throw             [AddTaskCollectionTerminatedException](assetId:///T:Microsoft.Azure.Batch.AddTaskCollectionTerminatedException?qualifyHint=False&autoUpgrade=True) for that.