---  
uid: Microsoft.Azure.Batch.PoolOperations.GetRDPFileAsync(System.String,System.String,System.IO.Stream,System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)  
remarks: *content  
---  
  
## Remarks  
 This method does not close the `rdpStream` stream, and it does not reset the position after writing.             It is the caller's responsibility to close the stream, or to reset the position if required.  
  
 The get RDP file operation runs asynchronously.  
  
 This method can be invoked only if the pool is created with a [CloudServiceConfiguration](assetId:///T:Microsoft.Azure.Batch.CloudServiceConfiguration?qualifyHint=False&autoUpgrade=True) property.              If this method is invoked on pools created with [VirtualMachineConfiguration](assetId:///T:Microsoft.Azure.Batch.VirtualMachineConfiguration?qualifyHint=False&autoUpgrade=True), then Batch service returns 409 (Conflict).              For pools with [VirtualMachineConfiguration](assetId:///T:Microsoft.Azure.Batch.VirtualMachineConfiguration?qualifyHint=False&autoUpgrade=True) property, the new method [GetRemoteLoginSettings](assetId:///M:Microsoft.Azure.Batch.PoolOperations.GetRemoteLoginSettings(System.String,System.String,System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior})?qualifyHint=False&autoUpgrade=True) must be used.