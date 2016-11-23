---  
uid: Microsoft.Azure.Batch.PoolOperations.GetRDPFile(System.String,System.String,System.String,System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior})  
remarks: *content  
---  
  
## Remarks  
 If the file specified by `rdpFileNameToCreate` already exists, it is overwritten.  
  
 This is a blocking operation. For a non-blocking equivalent, see [GetRDPFileAsync](assetId:///M:Microsoft.Azure.Batch.PoolOperations.GetRDPFileAsync(System.String,System.String,System.String,System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)?qualifyHint=False&autoUpgrade=True).  
  
 This method can be invoked only if the pool is created with a [CloudServiceConfiguration](assetId:///T:Microsoft.Azure.Batch.CloudServiceConfiguration?qualifyHint=False&autoUpgrade=True) property.              If this method is invoked on pools created with [VirtualMachineConfiguration](assetId:///T:Microsoft.Azure.Batch.VirtualMachineConfiguration?qualifyHint=False&autoUpgrade=True), then Batch service returns 409 (Conflict).              For pools with [VirtualMachineConfiguration](assetId:///T:Microsoft.Azure.Batch.VirtualMachineConfiguration?qualifyHint=False&autoUpgrade=True) property, the new method [GetRemoteLoginSettings](assetId:///M:Microsoft.Azure.Batch.PoolOperations.GetRemoteLoginSettings(System.String,System.String,System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior})?qualifyHint=False&autoUpgrade=True) must be used.