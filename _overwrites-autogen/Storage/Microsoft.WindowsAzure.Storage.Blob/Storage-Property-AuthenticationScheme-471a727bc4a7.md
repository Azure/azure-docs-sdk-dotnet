---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobClient.AuthenticationScheme  
remarks: *content  
---  
  
## Remarks  
 This property is set only when Shared Key or Shared Key Lite credentials are used; it does not apply to authentication via a shared access signature (SAS) or to anonymous access.  
  
---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobClient.AuthenticationScheme  
examples: *content  
---  
  
## Examples  
  
```c#  
private static void PrintServiceClientProperties(CloudBlobClient blobClient)  
{  
    Console.WriteLine("-----Blob Service Client Properties-----");  
    Console.WriteLine("Storage account name: {0}", blobClient.Credentials.AccountName);  
    Console.WriteLine("Authentication Scheme: {0}", blobClient.AuthenticationScheme);  
    Console.WriteLine("Base URI: {0}", blobClient.BaseUri);  
    Console.WriteLine("Primary URI: {0}", blobClient.StorageUri.PrimaryUri);  
    Console.WriteLine("Secondary URI: {0}", blobClient.StorageUri.SecondaryUri);  
    Console.WriteLine("Default buffer size: {0}", blobClient.BufferManager.GetDefaultBufferSize());  
    Console.WriteLine("Default delimiter: {0}", blobClient.DefaultDelimiter);  
    Console.WriteLine();  
}  
```