---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobClient.#ctor  
examples: *content  
---  
  
## Examples  
 **Example: Constructor with Shared Key credentials**  
  
 [!INCLUDE[azure-storage-shared-key](../Token/azure-storage-shared-key_md.md)]  
  
```c#  
// Create new credentials using account name and account key (replace the placeholder below with yours).  
StorageCredentials credentialsSharedKey = new StorageCredentials("storagesample",   
    "<account-key>");  
CloudBlobClient blobClientSharedKey = new CloudBlobClient(new Uri("https://storagesample.blob.core.windows.net/"), credentialsSharedKey);  
  
// Verify that the credentials provided permit you to list blobs in the container.  
CloudBlobContainer containerSharedKey = blobClientSharedKey.GetContainerReference("private-container");  
foreach (var blob in containerSharedKey.ListBlobs())  
{  
    Console.WriteLine(blob.Uri);  
}  
  
```  
  
 **Example: Constructor with shared access signature (SAS) credentials**  
  
 [!INCLUDE[azure-storage-sas](../Token/azure-storage-sas_md.md)]  
  
```c#  
// Create new credentials using a service SAS created on the container.  
// This SAS provides read, write, list, and delete permissions.  
// Note that the constructor requires only the SAS token.  
StorageCredentials credentialsSAS = new StorageCredentials("?sr=c&sv=2015-02-21&st=2016-08-10T14%3A23%3A47Z&se=2016-08-13T15%3A23%3A47Z&sp=rwdl&sig=OkNf9f2EecH9mtPVztOm0978lqtYNpcEzaUg2sWrJOs%3D");  
CloudBlobClient blobClientSAS = new CloudBlobClient(new Uri("https://storagesample.blob.core.windows.net/"), credentialsSAS);  
  
// Verify that the SAS credentials permit you to list blobs in the container.  
CloudBlobContainer containerSAS = blobClientSAS.GetContainerReference("private-container");  
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
// Create service client for anonymous access.  
CloudBlobClient blobClientAnonymous = new CloudBlobClient(new Uri("https://storagesample.blob.core.windows.net/"));  
  
// Verify that you can use this service client to anonymously list blobs in the container.  
CloudBlobContainer containerAnonymous = blobClientAnonymous.GetContainerReference("public-container");  
foreach(var blob in containerAnonymous.ListBlobs())  
{  
    Console.WriteLine(blob.Uri);  
}  
  
```