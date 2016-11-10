---
uid: 
remarks: *content
---
## Remarks  
 This option is used only by the [Microsoft.WindowsAzure.Storage.Blob](assetId:///N:Microsoft.WindowsAzure.Storage.Blob?qualifyHint=False&autoUpgrade=True) object in the **UploadFrom\*** methods and             the **BlobWriteStream** methods. By default, it is set to `false`. Set this option to `true` only for single writer scenarios.             Setting this option to `true` in a multi-writer scenario may lead to corrupted blob data.