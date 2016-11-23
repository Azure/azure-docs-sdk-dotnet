---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.GetPageBlobReference  
remarks: *content  
---  
  
## Remarks  
 Call this method to return a reference to a page blob in this container. Note that this method does not make a request against Blob storage. You can return a reference to the page blob whether or not it exists yet.  
  
---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.GetPageBlobReference  
examples: *content  
---  
  
## Examples  
 This example creates a new page blob, with two 512-byte pages.  
  
```c#  
private static async Task CreateNewPageBlob(CloudBlobContainer container)  
{  
    try  
    {  
        CloudPageBlob pageBlob = container.GetPageBlobReference("sample-page-blob");  
        await pageBlob.CreateAsync(512 * 2 /*size*/); // size needs to be multiple of 512 bytes  
  
        Console.WriteLine("Created new page blob {0}", pageBlob.Name);  
    }  
    catch (StorageException e)  
    {  
        Console.WriteLine(e.Message);  
        Console.ReadLine();  
        throw;  
    }  
}  
  
```