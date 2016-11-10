---
uid: 
remarks: *content
---
## Remarks  
 During the change OS version operation, the Batch service traverses the nodes of the pool, changing the OS version of compute nodes.  When a compute node is chosen, any tasks running on that node are removed from the node and requeued to be rerun later (or on a different compute node).  The node will be unavailable until the version change is complete.  
  
 The operation will result in temporarily reduced pool capacity as nodes are taken out of service to have their OS version changed. Although the Batch service tries to avoid changing all compute nodes at the same time, it does not guarantee to do this (particularly on small pools); therefore, the operation may result in the pool being temporarily unavailable to run tasks.  
  
 When you request an OS version change, the pool state changes to [Microsoft.Azure.Batch](assetId:///N:Microsoft.Azure.Batch?qualifyHint=False&autoUpgrade=True).  When all compute nodes have finished changing version, the pool state returns to [Upgrading](assetId:///T:Microsoft.Azure.Batch.Common.PoolState?qualifyHint=False&autoUpgrade=True).  
  
 While the version change is in progress, the pool's [CurrentOSVersion](assetId:///P:Microsoft.Azure.Batch.CloudServiceConfiguration.CurrentOSVersion?qualifyHint=False&autoUpgrade=True) reflects the OS version that nodes are changing from, and [TargetOSVersion](assetId:///P:Microsoft.Azure.Batch.CloudServiceConfiguration.TargetOSVersion?qualifyHint=False&autoUpgrade=True) reflects the OS version that nodes are changing to. Once the change is complete, CurrentOSVersion is updated to reflect the OS version now running on all nodes.  
  
 This is a blocking operation. For a non-blocking equivalent, see [ChangeOSVersionAsync](assetId:///M:Microsoft.Azure.Batch.PoolOperations.ChangeOSVersionAsync(System.String,System.String,System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)?qualifyHint=False&autoUpgrade=True).