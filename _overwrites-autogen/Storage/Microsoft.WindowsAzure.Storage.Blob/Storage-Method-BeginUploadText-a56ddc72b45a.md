---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudAppendBlob.BeginUploadText(System.String,System.AsyncCallback,System.Object)  
remarks: *content  
---  
  
## Remarks  
 Use this method only in single-writer scenarios. Internally, this method uses the append-offset conditional header to avoid duplicate blocks, which may cause problems in multiple-writer scenarios.             To append data to an append blob that already exists, see [BeginAppendText](assetId:///M:Microsoft.WindowsAzure.Storage.Blob.CloudAppendBlob.BeginAppendText(System.String,System.AsyncCallback,System.Object)?qualifyHint=False&autoUpgrade=True).