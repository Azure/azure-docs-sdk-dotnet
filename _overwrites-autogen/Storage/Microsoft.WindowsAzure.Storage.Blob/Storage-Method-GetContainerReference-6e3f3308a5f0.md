---
uid: 
remarks: *content
---
---
uid: 
examples: *content
---
## Remarks  
 Call this method to return a reference to a container. Note that this method does not make a request against Blob storage. You can return a reference to a container whether or not it exists.  
  
## Examples  
 This example shows how to return a reference to a container, and then create the container:  
  
```c#  
private static async Task<CloudBlobContainer> CreateSampleContainer(CloudBlobClient blobClient)  
{  
    // Name sample container based on new GUID, to ensure uniqueness.  
    string containerName = ContainerPrefix + Guid.NewGuid();  
  
    // Get a reference to a sample container.  
    CloudBlobContainer container = blobClient.GetContainerReference(containerName);  
  
    try  
    {  
        // Create the container if it does not already exist.  
        await container.CreateIfNotExistsAsync();  
    }  
    catch (StorageException e)  
    {  
        // Ensure that the storage emulator is running if using emulator connection string.  
        Console.WriteLine(e.Message);  
        Console.ReadLine();  
        throw;  
    }  
  
    return container;  
}  
```