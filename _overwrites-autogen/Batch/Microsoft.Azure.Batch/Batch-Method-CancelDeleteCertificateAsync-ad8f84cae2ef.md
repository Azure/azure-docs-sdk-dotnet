---  
uid: Microsoft.Azure.Batch.CertificateOperations.CancelDeleteCertificateAsync(System.String,System.String,System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)  
remarks: *content  
---  
  
## Remarks  
 If you still wish to delete the certificate (instead of returning it to Active), you do not need to cancel             the failed deletion. You must make sure that the certificate is not being used by any resources, and then you             can try again to delete the certificate (see [DeleteCertificateAsync](assetId:///M:Microsoft.Azure.Batch.CertificateOperations.DeleteCertificateAsync(System.String,System.String,System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)?qualifyHint=False&autoUpgrade=True).  
  
 The cancel delete operation runs asynchronously.