---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudAppendBlob.BeginAppendFromByteArray(System.Byte[],System.Int32,System.Int32,System.AsyncCallback,System.Object)  
remarks: *content  
---  
  
## Remarks  
 Use this method only in single-writer scenarios. Internally, this method uses the append-offset conditional header to avoid duplicate blocks, which may cause problems in multiple-writer scenarios.