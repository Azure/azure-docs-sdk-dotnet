---  
uid: Microsoft.Azure.Batch.PoolSpecification.VirtualMachineSize  
remarks: *content  
---  
  
## Remarks  
 For information about available sizes of virtual machines for Cloud Services pools (pools created with              a [CloudServiceConfiguration](assetId:///P:Microsoft.Azure.Batch.PoolSpecification.CloudServiceConfiguration?qualifyHint=False&autoUpgrade=True)), see https://azure.microsoft.com/documentation/articles/cloud-services-sizes-specs/.              Batch supports all Cloud Services VM sizes except ExtraSmall.  
  
 For information about available VM              sizes for pools using images from the Virtual Machines Marketplace (pools created with a [VirtualMachineConfiguration](assetId:///P:Microsoft.Azure.Batch.PoolSpecification.VirtualMachineConfiguration?qualifyHint=False&autoUpgrade=True))              see https://azure.microsoft.com/documentation/articles/virtual-machines-linux-sizes/ or https://azure.microsoft.com/documentation/articles/virtual-machines-windows-sizes/.              Batch supports all Azure VM sizes except STANDARD_A0 and those with premium storage (for example STANDARD_GS,              STANDARD_DS, and STANDARD_DSV2 series).