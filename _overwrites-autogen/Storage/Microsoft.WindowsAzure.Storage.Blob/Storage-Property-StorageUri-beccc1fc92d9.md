---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlob.StorageUri  
remarks: *content  
---  
  
## Remarks  
 If your storage account uses read-access geo-redundant storage (RA-GRS), you can design your application to read from the secondary location if the primary location should become unavailable. The StorageURI property returns both the primary and secondary URIs for the container.  
  
> [!NOTE]
>  The StorageURI property is a client-side property, so it will return a secondary URI whether or not RA-GRS is enabled. However, if RA-GRS is not enabled, then subsequent calls against the secondary URI will fail.