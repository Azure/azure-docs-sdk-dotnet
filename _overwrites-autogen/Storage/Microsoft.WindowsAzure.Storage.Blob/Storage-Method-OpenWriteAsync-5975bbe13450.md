---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudAppendBlob.OpenWriteAsync(System.Boolean)  
remarks: *content  
---  
  
## Remarks  
 Note that this method always makes a call to the [BeginFetchAttributes](assetId:///M:Microsoft.WindowsAzure.Storage.Blob.CloudBlob.BeginFetchAttributes(Microsoft.WindowsAzure.Storage.AccessCondition,Microsoft.WindowsAzure.Storage.Blob.BlobRequestOptions,Microsoft.WindowsAzure.Storage.OperationContext,System.AsyncCallback,System.Object)?qualifyHint=False&autoUpgrade=True) method under the covers.             Set the [StreamWriteSizeInBytes](assetId:///P:Microsoft.WindowsAzure.Storage.Blob.CloudAppendBlob.StreamWriteSizeInBytes?qualifyHint=False&autoUpgrade=True) property before calling this method to specify the block size to write, in bytes,              ranging from between 16 KB and 4 MB inclusive.