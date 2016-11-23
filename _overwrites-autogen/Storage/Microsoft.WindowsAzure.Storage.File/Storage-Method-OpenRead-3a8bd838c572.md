---  
uid: Microsoft.WindowsAzure.Storage.File.CloudFile.OpenRead(Microsoft.WindowsAzure.Storage.AccessCondition,Microsoft.WindowsAzure.Storage.File.FileRequestOptions,Microsoft.WindowsAzure.Storage.OperationContext)  
remarks: *content  
---  
  
## Remarks  
 On the [System.IO.Stream](assetId:///T:System.IO.Stream?qualifyHint=False&autoUpgrade=True) object returned by this method, the [EndRead](assetId:///M:System.IO.Stream.EndRead(System.IAsyncResult)?qualifyHint=False&autoUpgrade=True) method must be called exactly once for every [BeginRead](assetId:///M:System.IO.Stream.BeginRead(System.Byte[],System.Int32,System.Int32,System.AsyncCallback,System.Object)?qualifyHint=False&autoUpgrade=True) call. Failing to end a read process before beginning another read can cause unknown behavior.