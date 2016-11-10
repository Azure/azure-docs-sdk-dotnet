---
uid: 
examples: *content
---
## Examples  
 **Example: Constructor with Shared Key credentials**  
  
 [!INCLUDE[azure-storage-shared-key](../Token/azure-storage-shared-key_md.md)]  
  
```c#  
// Create new credentials using account name and account key (replace the placeholder below with yours).  
StorageCredentials credentialsSharedKey = new StorageCredentials("storagesample",  
    "<account-key>");  
  
// Create a container reference for shared key access using the container address.  
CloudBlobContainer containerSharedKey = new CloudBlobContainer(new Uri("https://storagesample.blob.core.windows.net/private-container"), credentialsSharedKey);  
  
// Verify that the credentials provided permit you to list blobs in the container.  
foreach (var blob in containerSharedKey.ListBlobs())  
{  
    Console.WriteLine(blob.Uri);  
}  
  
```  
  
 **Example: Constructor with shared access signature (SAS) credentials**  
  
 [!INCLUDE[azure-storage-sas](../Token/azure-storage-sas_md.md)]  
  
```c#  
// Create new credentials using a service SAS created on the container.  
// This SAS provides read, write, and list permissions.  
// Note that the constructor requires only the SAS token.  
StorageCredentials credentialsSAS = new StorageCredentials(sasToken);  
  
// Verify that the SAS credentials permit you to list blobs in the container.  
CloudBlobContainer containerSAS = new CloudBlobContainer(new Uri("https://storagesample.blob.core.windows.net/private-container"), credentialsSAS);  
foreach (var blob in containerSAS.ListBlobs())  
{  
    Console.WriteLine(blob.Uri);  
}  
  
// Now try writing a blob to the container using the SAS.  
CloudBlockBlob newBlob = containerSAS.GetBlockBlobReference("new-block-blob.txt");  
newBlob.UploadText("this is a new blob");  
  
```  
  
 **Example: Constructor for anonymous public access**  
  
 [!INCLUDE[azure-storage-anonymous-auth](../Token/azure-storage-anonymous-auth_md.md)]  
  
```c#  
// Create a container reference for anonymous access using the container address.  
CloudBlobContainer containerAnonymous = new CloudBlobContainer(new Uri("https://storagesample.blob.core.windows.net/public-container"));  
  
// Verify that you can use this service client to anonymously list blobs in the container.  
foreach (var blob in containerAnonymous.ListBlobs())  
{  
    Console.WriteLine(blob.Uri);  
}  
  
```