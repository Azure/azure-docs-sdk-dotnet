---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer  
remarks: *content  
---  
  
## Remarks  
 A container is the parent object for the blobs in Azure Blob storage. The container serves to group blobs in your storage account. Every blob must reside beneath a container. The container name forms part of a blob's unique address.  
  
 Container names must be between 3 and 63 characters, lowercase, and may contain only letters, numerals, and the dash (-) character. For complete container naming rules, see [Naming and Referencing Containers, Blobs, and Metadata](../Topic/Naming%20and%20Referencing%20Containers,%20Blobs,%20and%20Metadata.md).  
  
 Each storage account also may have a root container, named **$root**. The root container must be created; it does not exist by default. For more information about the root container, see [Working with the Root Container](../Topic/Working%20with%20the%20Root%20Container.md).  
  
---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer  
examples: *content  
---  
  
## Examples  
 Here's an example that creates a new container. The example uses a GUID to name the container to ensure uniqueness. The call to the GetContainerReference method does not make a request to the service; it creates a named instance of the container in local memory only. The call to the CreateIfNotExistsAsync method makes a request to the service to check whether the container exists. If it does not exist, a second call is make to the service to create the container.  
  
```c#  
private static async Task<CloudBlobContainer> CreateSampleContainerAsync(CloudBlobClient blobClient)  
{  
    // Name sample container based on new GUID, to ensure uniqueness.  
    string containerName = "sample-" + Guid.NewGuid();  
  
    // Get a reference to a sample container.  
    CloudBlobContainer container = blobClient.GetContainerReference(containerName);  
  
    try  
    {  
        // Create the container if it does not already exist.  
        await container.CreateIfNotExistsAsync();  
    }  
    catch (StorageException e)  
    {  
        Console.WriteLine(e.Message);  
        Console.ReadLine();  
        throw;  
    }  
  
    return container;  
}  
  
```