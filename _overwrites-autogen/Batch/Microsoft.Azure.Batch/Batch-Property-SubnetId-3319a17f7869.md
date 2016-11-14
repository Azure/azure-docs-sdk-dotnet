---  
uid: Microsoft.Azure.Batch.NetworkConfiguration.SubnetId  
remarks: *content  
---  
  
## Remarks  
 The virtual network must be in the same region and subscription as the Azure Batch account, and the specified              subnet should have enough spare IP addresses to accommodate the number of nodes in the pool. This property can              only be specified for pools created with a [CloudServiceConfiguration](assetId:///P:Microsoft.Azure.Batch.CloudPool.CloudServiceConfiguration?qualifyHint=False&autoUpgrade=True).