---  
uid: Microsoft.Azure.Batch.ComputeNode.GetRemoteLoginSettings(System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior})  
remarks: *content  
---  
  
## Remarks  
 This is a blocking operation. For a non-blocking equivalent, see [GetRemoteLoginSettingsAsync](assetId:///M:Microsoft.Azure.Batch.ComputeNode.GetRemoteLoginSettingsAsync(System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)?qualifyHint=False&autoUpgrade=True).  
  
 This method can be invoked only if the pool is created with a [VirtualMachineConfiguration](assetId:///T:Microsoft.Azure.Batch.VirtualMachineConfiguration?qualifyHint=False&autoUpgrade=True) property.              If this method is invoked on pools created with [CloudServiceConfiguration](assetId:///T:Microsoft.Azure.Batch.CloudServiceConfiguration?qualifyHint=False&autoUpgrade=True), then Batch service returns 409 (Conflict).              For pools with a [CloudServiceConfiguration](assetId:///T:Microsoft.Azure.Batch.CloudServiceConfiguration?qualifyHint=False&autoUpgrade=True) property, one of the GetRDPFileAsync/GetRDPFile methods must be used.