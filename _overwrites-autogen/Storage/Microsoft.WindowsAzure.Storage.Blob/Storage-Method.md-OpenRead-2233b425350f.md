---
uid: 
remarks: *content
---
## Remarks  
 Note that this method always makes a call to the [Microsoft.WindowsAzure.Storage.Blob](assetId:///N:Microsoft.WindowsAzure.Storage.Blob?qualifyHint=False&autoUpgrade=True) method under the covers.  
  
 Set the [StreamMinimumReadSizeInBytes](assetId:///P:Microsoft.WindowsAzure.Storage.Blob.CloudBlob.StreamMinimumReadSizeInBytes?qualifyHint=False&autoUpgrade=True) property before calling this method to specify the minimum             number of bytes to buffer when reading from the stream. The value must be at least 16 KB.