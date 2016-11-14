---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.CreateAsync  
remarks: *content  
---  
  
## Remarks  
 This method creates a container without first checking for existence. It makes a single write request to the service, whereas [CreateIfNotExistsAsync](assetId:///Overload:Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.CreateIfNotExistsAsync?qualifyHint=False&autoUpgrade=True) makes both a read and a write request.  
  
---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.CreateAsync  
examples: *content  
---  
  
## Examples  
 This example creates a container, and handles the error if the container already exists.  
  
```c#  
private static async Task CreateContainer(CloudBlobClient blobClient)  
{  
    CloudBlobContainer container = null;  
  
    try  
    {  
        // Attempt to create a public container with a name that may already exist.  
        container = blobClient.GetContainerReference("public");  
        await container.CreateAsync(BlobContainerPublicAccessType.Blob, null, null);  
    }  
    catch (StorageException e)  
    {  
        if (e.RequestInformation.HttpStatusCode == 409)  
        {  
            Console.WriteLine("A container named {0} already exists.", container.Name);  
            container = blobClient.GetContainerReference("public-" + Guid.NewGuid().ToString());  
            await container.CreateAsync(BlobContainerPublicAccessType.Blob, null, null);  
            Console.WriteLine("Created uniquely named container {0}", container.Name);  
        }  
        else  
        {  
            Console.WriteLine(e.Message);  
            Console.WriteLine(e.RequestInformation.ExtendedErrorInformation.ErrorMessage);  
            Console.ReadLine();  
            throw;  
        }  
    }  
    finally  
    {  
        // Delete the container if it exists.  
        await container.DeleteIfExistsAsync();  
    }  
}  
  
```