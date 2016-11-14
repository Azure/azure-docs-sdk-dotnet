---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.DeleteIfExistsAsync  
remarks: *content  
---  
  
## Remarks  
 The DeleteIfExistsAsync method checks whether the specified container exists, and if so, marks the container for deletion. Because the DeleteIfExistsAsync method checks for existence before deleting the container, it requires read permissions as well as write permissions.  
  
 The container and any blobs contained within it are later deleted during garbage collection. Note that you will not be able to create a new container with the same name for at least 30 seconds after the deletion request is sent, and possibly longer.  
  
 Acquiring a lease on a container ensures that only the client who holds the lease can delete the container. To delete a container with an active lease, specify the lease ID in the [LeaseId](assetId:///P:Microsoft.WindowsAzure.Storage.AccessCondition.LeaseId?qualifyHint=False&autoUpgrade=True) property of an AccessCondition object.  
  
 For additional information about deleting containers, see [Delete Container](../Topic/Delete%20Container.md).  
  
---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.DeleteIfExistsAsync  
examples: *content  
---  
  
## Examples  
 This example attempts to create a container, then calls the DeleteIfExistsAsync method to delete the container. The DeleteIfExistsAsync method should not fail under normal circumstances, so it's a good choice for the `finally` statement as shown below.  
  
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