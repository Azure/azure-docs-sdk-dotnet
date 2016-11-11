---  
uid: Microsoft.Azure.Batch.ResourceFile.FileMode  
remarks: *content  
---  
  
## Remarks  
 This property is applicable only if the resource file is downloaded to a Linux node. This property will              be ignored if it is specified for a [ResourceFile](assetId:///T:Microsoft.Azure.Batch.ResourceFile?qualifyHint=False&autoUpgrade=True) which will be downloaded to a Windows node. If              this property is not specified for a Linux node, then the default value is 0770.