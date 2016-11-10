---
uid: 
remarks: *content
---
## Remarks  
 The get remote login settings operation runs asynchronously.  
  
 This method can be invoked only if the pool is created with a [Microsoft.Azure.Batch](assetId:///N:Microsoft.Azure.Batch?qualifyHint=False&autoUpgrade=True) property.              If this method is invoked on pools created with [CloudServiceConfiguration](assetId:///T:Microsoft.Azure.Batch.CloudServiceConfiguration?qualifyHint=False&autoUpgrade=True), then Batch service returns 409 (Conflict).              For pools with a [CloudServiceConfiguration](assetId:///T:Microsoft.Azure.Batch.CloudServiceConfiguration?qualifyHint=False&autoUpgrade=True) property, one of the GetRDPFileAsync/GetRDPFile methods must be used.