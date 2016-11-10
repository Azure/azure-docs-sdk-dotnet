---
uid: 
remarks: *content
---
## Remarks  
 Note that this method always makes a call to the [Microsoft.WindowsAzure.Storage.Blob](assetId:///N:Microsoft.WindowsAzure.Storage.Blob?qualifyHint=False&autoUpgrade=True) method under the covers.  
  
 Set the [StreamWriteSizeInBytes](assetId:///P:Microsoft.WindowsAzure.Storage.Blob.CloudPageBlob.StreamWriteSizeInBytes?qualifyHint=False&autoUpgrade=True) property before calling this method to specify the page size to write, in multiples of 512 bytes,              ranging from between 512 and 4 MB inclusive.  
  
 To throw an exception if the blob exists instead of overwriting it, see [BeginOpenWrite](assetId:///M:Microsoft.WindowsAzure.Storage.Blob.CloudPageBlob.BeginOpenWrite(System.Nullable{System.Int64},Microsoft.WindowsAzure.Storage.AccessCondition,Microsoft.WindowsAzure.Storage.Blob.BlobRequestOptions,Microsoft.WindowsAzure.Storage.OperationContext,System.AsyncCallback,System.Object)?qualifyHint=False&autoUpgrade=True).