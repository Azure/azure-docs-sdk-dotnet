---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.Properties  
remarks: *content  
---  
  
## Remarks  
 The Properties property returns system properties for a container. System properties are stored on the service and must be retrieved via a request to the service. System  properties are defined in the [Microsoft.WindowsAzure.Storage.Blob.BlobContainerProperties](assetId:///T:Microsoft.WindowsAzure.Storage.Blob.BlobContainerProperties?qualifyHint=False&autoUpgrade=True) class.  
  
> [!NOTE]
>  To retrieve the container's system properties, call [FetchAttributesAsync](assetId:///Overload:Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.FetchAttributesAsync?qualifyHint=False&autoUpgrade=True) before checking the property values. FetchAttributesAsync makes a request against the service to retrieve the most up-to-date values for system properties.  
  
---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.Properties  
examples: *content  
---  
  
## Examples  
 This example prints both client-side and system properties for a container. The system properties are retrieved through the container's Properties property.  
  
```c#  
private static void PrintContainerPropertiesAndMetadata(CloudBlobContainer container)  
{  
    Console.WriteLine("-----Container Properties-----");  
    Console.WriteLine("Name: {0}", container.Name);  
    Console.WriteLine("URI: {0}", container.Uri);  
    Console.WriteLine("ETag: {0}", container.Properties.ETag);  
    Console.WriteLine("Last modified: {0}", container.Properties.LastModified);  
  
    // Enumerate the container's metadata.  
    Console.WriteLine("Container metadata:");  
    foreach (var metadataItem in container.Metadata)  
    {  
        Console.WriteLine("\tKey: {0}", metadataItem.Key);  
        Console.WriteLine("\tValue: {0}", metadataItem.Value);  
    }  
  
    Console.WriteLine();  
}  
  
```