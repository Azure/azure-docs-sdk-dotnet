---  
uid: Microsoft.Azure.Batch.Certificate.CancelDeleteAsync(System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)  
remarks: *content  
---  
  
## Remarks  
 If you still wish to delete the certificate (instead of returning it to Active), you do not need to cancel             the failed deletion. You must make sure that the certificate is not being used by any resources, and then you             can try again to delete the certificate (see [DeleteAsync](assetId:///M:Microsoft.Azure.Batch.Certificate.DeleteAsync(System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)?qualifyHint=False&autoUpgrade=True).  
  
 The cancel delete operation runs asynchronously.