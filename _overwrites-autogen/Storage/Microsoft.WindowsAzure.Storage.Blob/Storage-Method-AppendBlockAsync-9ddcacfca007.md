---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudAppendBlob.AppendBlockAsync(System.IO.Stream,System.String)  
remarks: *content  
---  
  
## Remarks  
 Clients may send the Content-MD5 header for a given Append Block operation as a means to ensure transactional integrity over the wire.              The `contentMD5` parameter permits clients who already have access to a pre-computed MD5 value for a given byte range to provide it.             If the [P:BlobRequestOptions.UseTransactionalMd5](assetId:///P:BlobRequestOptions.UseTransactionalMd5?qualifyHint=False&autoUpgrade=True) property is set to `true` and the `contentMD5` parameter is set              to `null`, then the client library will calculate the MD5 value internally.