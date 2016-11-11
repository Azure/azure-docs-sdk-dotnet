---  
uid: Microsoft.Azure.Batch.CertificateOperations.DeleteCertificate(System.String,System.String,System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior})  
remarks: *content  
---  
  
## Remarks  
 The delete operation requests that the certificate be deleted.  The request puts the certificate in the [Deleting](assetId:///T:Microsoft.Azure.Batch.Common.CertificateState?qualifyHint=False&autoUpgrade=True) state.             The Batch service will perform the actual certificate deletion without any further client action.  
  
 You cannot delete a certificate if a resource (pool or compute node) is using it. Before you can delete a certificate, you must therefore make sure that:  
  
-   The certificate is not associated with any pools.  
  
-   The certificate is not installed on any compute nodes.  (Even if you remove a certificate from a pool, it is not removed from existing compute nodes in that pool until they restart.)  
  
 If you try to delete a certificate that is in use, the deletion fails. The certificate state changes to [DeleteFailed](assetId:///T:Microsoft.Azure.Batch.Common.CertificateState?qualifyHint=False&autoUpgrade=True).             You can use [CancelDeleteCertificateAsync](assetId:///M:Microsoft.Azure.Batch.CertificateOperations.CancelDeleteCertificateAsync(System.String,System.String,System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)?qualifyHint=False&autoUpgrade=True) to set the status back to Active if you decide that you want to continue using the certificate.  
  
 This is a blocking operation. For a non-blocking equivalent, see [DeleteCertificateAsync](assetId:///M:Microsoft.Azure.Batch.CertificateOperations.DeleteCertificateAsync(System.String,System.String,System.Collections.Generic.IEnumerable{Microsoft.Azure.Batch.BatchClientBehavior},System.Threading.CancellationToken)?qualifyHint=False&autoUpgrade=True).