---  
uid: Microsoft.Azure.Batch.ComputeNodeUser.SshPublicKey  
remarks: *content  
---  
  
## Remarks  
 The public key should be compatible with Open SSH encoding and should be base 64 encoded. This property              can be specified only for Linux nodes. The Batch service will return an error if this property is set for pools              created with [CloudServiceConfiguration](assetId:///T:Microsoft.Azure.Batch.CloudServiceConfiguration?qualifyHint=False&autoUpgrade=True) or [VirtualMachineConfiguration](assetId:///T:Microsoft.Azure.Batch.VirtualMachineConfiguration?qualifyHint=False&autoUpgrade=True) with Windows compute nodes.