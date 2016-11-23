---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudAppendBlob.UploadTextAsync(System.String)  
remarks: *content  
---  
  
## Remarks  
 Use this method only in single-writer scenarios. Internally, this method uses the append-offset conditional header to avoid duplicate blocks, which may cause problems in multiple-writer scenarios.             To append data to an append blob that already exists, see [AppendTextAsync](assetId:///M:Microsoft.WindowsAzure.Storage.Blob.CloudAppendBlob.AppendTextAsync(System.String)?qualifyHint=False&autoUpgrade=True).