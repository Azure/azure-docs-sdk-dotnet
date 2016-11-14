---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlob.OpenRead(Microsoft.WindowsAzure.Storage.AccessCondition,Microsoft.WindowsAzure.Storage.Blob.BlobRequestOptions,Microsoft.WindowsAzure.Storage.OperationContext)  
remarks: *content  
---  
  
## Remarks  
 Note that this method always makes a call to the [FetchAttributes](assetId:///M:Microsoft.WindowsAzure.Storage.Blob.CloudBlob.FetchAttributes(Microsoft.WindowsAzure.Storage.AccessCondition,Microsoft.WindowsAzure.Storage.Blob.BlobRequestOptions,Microsoft.WindowsAzure.Storage.OperationContext)?qualifyHint=False&autoUpgrade=True) method under the covers.  
  
 Set the [StreamMinimumReadSizeInBytes](assetId:///P:Microsoft.WindowsAzure.Storage.Blob.CloudBlob.StreamMinimumReadSizeInBytes?qualifyHint=False&autoUpgrade=True) property before calling this method to specify the minimum             number of bytes to buffer when reading from the stream. The value must be at least 16 KB.