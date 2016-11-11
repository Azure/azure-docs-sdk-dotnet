---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlob.OpenReadAsync(System.Threading.CancellationToken)  
remarks: *content  
---  
  
## Remarks  
 On the [Stream](assetId:///T:System.IO.Stream?qualifyHint=False&autoUpgrade=True) object returned by this method, the [EndRead](assetId:///M:System.IO.Stream.EndRead(System.IAsyncResult)?qualifyHint=False&autoUpgrade=True) method must be called exactly once for every [BeginRead](assetId:///M:System.IO.Stream.BeginRead(System.Byte[],System.Int32,System.Int32,System.AsyncCallback,System.Object)?qualifyHint=False&autoUpgrade=True) call.              Failing to end the read process before beginning another read process can cause unexpected behavior.  
  
 Note that this method always makes a call to the [FetchAttributesAsync](assetId:///M:Microsoft.WindowsAzure.Storage.Blob.CloudBlob.FetchAttributesAsync(Microsoft.WindowsAzure.Storage.AccessCondition,Microsoft.WindowsAzure.Storage.Blob.BlobRequestOptions,Microsoft.WindowsAzure.Storage.OperationContext,System.Threading.CancellationToken)?qualifyHint=False&autoUpgrade=True) method under the covers.  
  
 Set the [StreamMinimumReadSizeInBytes](assetId:///P:Microsoft.WindowsAzure.Storage.Blob.CloudBlob.StreamMinimumReadSizeInBytes?qualifyHint=False&autoUpgrade=True) property before calling this method to specify the minimum             number of bytes to buffer when reading from the stream. The value must be at least 16 KB.