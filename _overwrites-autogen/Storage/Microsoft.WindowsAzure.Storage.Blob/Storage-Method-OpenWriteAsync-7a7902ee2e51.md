---
uid: 
remarks: *content
---
## Remarks  
 Note that this method always makes a call to the [Microsoft.WindowsAzure.Storage.Blob](assetId:///N:Microsoft.WindowsAzure.Storage.Blob?qualifyHint=False&autoUpgrade=True) method under the covers.  
  
 Set the [StreamWriteSizeInBytes](assetId:///P:Microsoft.WindowsAzure.Storage.Blob.CloudBlockBlob.StreamWriteSizeInBytes?qualifyHint=False&autoUpgrade=True) property before calling this method to specify the block size to write, in bytes,              ranging from between 16 KB and 4 MB inclusive.  
  
 To throw an exception if the blob exists instead of overwriting it, pass in an [AccessCondition](assetId:///T:Microsoft.WindowsAzure.Storage.AccessCondition?qualifyHint=False&autoUpgrade=True) object generated using [GenerateIfNotExistsCondition](assetId:///M:Microsoft.WindowsAzure.Storage.AccessCondition.GenerateIfNotExistsCondition?qualifyHint=False&autoUpgrade=True).