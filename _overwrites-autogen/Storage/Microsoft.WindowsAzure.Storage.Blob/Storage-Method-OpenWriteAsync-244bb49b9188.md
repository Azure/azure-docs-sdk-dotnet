---
uid: 
remarks: *content
---
## Remarks  
 Note that this method always makes a call to the [Microsoft.WindowsAzure.Storage.Blob](assetId:///N:Microsoft.WindowsAzure.Storage.Blob?qualifyHint=False&autoUpgrade=True) method under the covers.             Set the [StreamWriteSizeInBytes](assetId:///P:Microsoft.WindowsAzure.Storage.Blob.CloudAppendBlob.StreamWriteSizeInBytes?qualifyHint=False&autoUpgrade=True) property before calling this method to specify the block size to write, in bytes,              ranging from between 16 KB and 4 MB inclusive.             If you have a single-writer scenario, see [AbsorbConditionalErrorsOnRetry](assetId:///P:Microsoft.WindowsAzure.Storage.Blob.BlobRequestOptions.AbsorbConditionalErrorsOnRetry?qualifyHint=False&autoUpgrade=True) to determine whether setting this flag to `true` is acceptable for your scenario.