---
uid: 
remarks: *content
---
---
uid: 
examples: *content
---
## Remarks  
 By default, the default delimiter is a forward slash (/). You can change this to a different character if your application requires it.  
  
 The client library uses the default delimiter when listing blobs hierarchically. When the client library encounters the delimiter in the blob URI, the address preceding the delimiter is returned a virtual directory. A virtual directory is a client-side abstraction that facilitates traversing a hierarchy of blobs.  
  
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