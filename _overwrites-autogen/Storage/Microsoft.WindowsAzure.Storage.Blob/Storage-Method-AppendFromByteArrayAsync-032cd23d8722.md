---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudAppendBlob.AppendFromByteArrayAsync(System.Byte[],System.Int32,System.Int32,System.Threading.CancellationToken)  
remarks: *content  
---  
  
## Remarks  
 Use this method only in single-writer scenarios. Internally, this method uses the append-offset conditional header to avoid duplicate blocks, which may cause problems in multiple-writer scenarios.