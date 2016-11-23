---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudAppendBlob.UploadFromByteArrayAsync(System.Byte[],System.Int32,System.Int32)  
remarks: *content  
---  
  
## Remarks  
 Use this method only in single-writer scenarios. Internally, this method uses the append-offset conditional header to avoid duplicate blocks, which may cause problems in multiple-writer scenarios.             To append data to an append blob that already exists, see [AppendFromByteArrayAsync](assetId:///M:Microsoft.WindowsAzure.Storage.Blob.CloudAppendBlob.AppendFromByteArrayAsync(System.Byte[],System.Int32,System.Int32)?qualifyHint=False&autoUpgrade=True).