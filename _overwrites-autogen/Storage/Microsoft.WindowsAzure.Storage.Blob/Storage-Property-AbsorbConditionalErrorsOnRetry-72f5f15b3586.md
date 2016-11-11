---  
uid: Microsoft.WindowsAzure.Storage.Blob.BlobRequestOptions.AbsorbConditionalErrorsOnRetry  
remarks: *content  
---  
  
## Remarks  
 This option is used only by the [CloudAppendBlob](assetId:///T:Microsoft.WindowsAzure.Storage.Blob.CloudAppendBlob?qualifyHint=False&autoUpgrade=True) object in the **UploadFrom\*** methods and             the **BlobWriteStream** methods. By default, it is set to `false`. Set this option to `true` only for single writer scenarios.             Setting this option to `true` in a multi-writer scenario may lead to corrupted blob data.