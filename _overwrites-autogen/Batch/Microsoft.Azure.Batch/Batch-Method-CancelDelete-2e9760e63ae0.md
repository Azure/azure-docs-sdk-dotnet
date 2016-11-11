---  
uid: Microsoft.Azure.Batch.Certificate.CancelDelete(System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior})  
remarks: *content  
---  
  
## Remarks  
 If you still wish to delete the certificate (instead of returning it to Active), you do not need to cancel             the failed deletion. You must make sure that the certificate is not being used by any resources, and then you             can try again to delete the certificate (see [Delete](assetId:///M:Microsoft.Azure.Batch.Certificate.Delete(System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior})?qualifyHint=False&autoUpgrade=True).  
  
 This is a blocking operation. For a non-blocking equivalent, see [CancelDeleteAsync](assetId:///M:Microsoft.Azure.Batch.Certificate.CancelDeleteAsync(System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)?qualifyHint=False&autoUpgrade=True).