---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.Uri  
examples: *content  
---  
  
## Examples  
 This code example prints the container's properties and metadata to a console window.  
  
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