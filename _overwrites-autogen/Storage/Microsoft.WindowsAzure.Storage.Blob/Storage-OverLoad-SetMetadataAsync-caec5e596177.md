---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.SetMetadataAsync  
remarks: *content  
---  
  
## Remarks  
 The SetMetadataAsync method writes the container's collection of metadata to the service. Metadata consists of user-defined name/value pairs added to a Dictionary object. The dictionary is available via the container's [Overload:Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.Metadata](assetId:///Overload:Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.Metadata?qualifyHint=False&autoUpgrade=True) property.  
  
 To remove all metadata from the container, call the Clear method on the dictionary returned by the container's Metadata property.  
  
 For more information on setting container metadata, see [Set Container Metadata](../Topic/Set%20Container%20Metadata.md).  
  
---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.SetMetadataAsync  
examples: *content  
---  
  
## Examples  
 This example adds some metadata to a container's metadata collection, then writes the metadata to the service by calling SetMetadataAsync.  
  
```c#  
private static async Task AddContainerMetadataAsync(CloudBlobContainer container)  
{  
    try  
    {  
        // Add some metadata to the container.  
        container.Metadata.Add("docType", "textDocuments");  
        container.Metadata["category"] = "guidance";  
  
        // Set the container's metadata asynchronously.  
        await container.SetMetadataAsync();  
    }  
    catch (StorageException e)  
    {  
        Console.WriteLine(e.Message);  
        Console.WriteLine(e.RequestInformation.ExtendedErrorInformation);  
        Console.ReadLine();  
        throw;  
    }  
}  
  
```