---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.CreateIfNotExistsAsync  
remarks: *content  
---  
  
## Remarks  
 This method checks whether the container exists before creating it, and therefore requires read permissions as well as write permissions.  
  
 A call to the CreateIfNotExistsAsync method makes a read request to the service to check whether the container exists. If it does not exist, a second write call is made to the service to create the container. Compare this to the [CreateAsync](assetId:///Overload:Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.CreateAsync?qualifyHint=False&autoUpgrade=True) method, which makes a single write call to the service, and fails if the container does already exist.  
  
---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.CreateIfNotExistsAsync  
examples: *content  
---  
  
## Examples  
 Here's an example that creates a new container if it does not already exist. The example uses a GUID to name the container to ensure uniqueness. Note that the call to the GetContainerReference method does not make a request to the service; it creates a named instance of the container in local memory only.  
  
```c#  
private static async Task<CloudBlobContainer> CreateSampleContainerAsync(CloudBlobClient blobClient)  
{  
    // Get a reference to the container.  
    CloudBlobContainer container = blobClient.GetContainerReference("sample-container");  
  
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