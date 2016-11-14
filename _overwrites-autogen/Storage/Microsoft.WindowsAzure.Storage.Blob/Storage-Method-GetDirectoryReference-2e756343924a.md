---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.GetDirectoryReference(System.String)  
remarks: *content  
---  
  
## Remarks  
 Call the GetDirectoryReference method to return a reference to a virtual directory in this container.  
  
 [!INCLUDE[azure-storage-virtual-dir](../Token/azure-storage-virtual-dir_md.md)] Note that the GetDirectoryReference method does not make a request against Blob storage. You can return a reference to the virtual directory whether or not it exists as part of any blob name.  If you make a subsequent request against the service using an invalid virtual directory, the service will treat it as though you tried to perform an operation on a blob that does not exist.  
  
---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.GetDirectoryReference(System.String)  
examples: *content  
---  
  
## Examples  
 This example gets a reference to a virtual directory, then prints out some of its properties.  
  
```c#  
private static void PrintVirtualDirectoryAndParents(CloudBlobContainer container)  
{  
    // Get a reference to a virtual directory.  
    CloudBlobDirectory dir = container.GetDirectoryReference("level1/level2/level3/");  
    // Print the name of the container.  
    Console.WriteLine(dir.Container.Name);  
    // Print the blob prefix that this virtual directory prepends to any blobs beneath it.  
    // In this example, the prefix is "level1/level2/level3/".  
    Console.WriteLine(dir.Prefix);  
    // Print the URI for the virtual directory.  
    Console.WriteLine(dir.Uri);  
    // Print the URI for the parent virtual directory of this virtual directory.  
    Console.WriteLine(dir.Parent.Uri);  
    // Print the URI for the grandparent virtual directory of the virtual directory.  
    Console.WriteLine(dir.Parent.Parent.Uri);  
}  
  
```