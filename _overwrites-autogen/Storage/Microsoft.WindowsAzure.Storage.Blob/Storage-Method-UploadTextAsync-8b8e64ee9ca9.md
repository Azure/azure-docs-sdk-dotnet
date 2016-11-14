---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudAppendBlob.UploadTextAsync(System.String,System.Threading.CancellationToken)  
remarks: *content  
---  
  
## Remarks  
 Use this method only in single-writer scenarios. Internally, this method uses the append-offset conditional header to avoid duplicate blocks, which may cause problems in multiple-writer scenarios.             If you have a single-writer scenario, see [AbsorbConditionalErrorsOnRetry](assetId:///P:Microsoft.WindowsAzure.Storage.Blob.BlobRequestOptions.AbsorbConditionalErrorsOnRetry?qualifyHint=False&autoUpgrade=True) to determine whether setting this flag to `true` is acceptable for your scenario.             To append data to an append blob that already exists, see [AppendTextAsync](assetId:///M:Microsoft.WindowsAzure.Storage.Blob.CloudAppendBlob.AppendTextAsync(System.String,System.Threading.CancellationToken)?qualifyHint=False&autoUpgrade=True).