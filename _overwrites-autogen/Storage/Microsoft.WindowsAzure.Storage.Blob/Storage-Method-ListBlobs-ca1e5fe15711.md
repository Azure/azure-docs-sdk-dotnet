---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.ListBlobs(System.String,System.Boolean,Microsoft.WindowsAzure.Storage.Blob.BlobListingDetails,Microsoft.WindowsAzure.Storage.Blob.BlobRequestOptions,Microsoft.WindowsAzure.Storage.OperationContext)  
remarks: *content  
---  
  
## Remarks  
 The ListBlobs method lists blobs and virtual directories in a container, optionally in segments of a specified or default size.  
  
 You can optionally specify a blob prefix to list blobs whose names begin with the same string. If you use a delimiter character in your blob names to create a virtual directory structure, the blob prefix can include all or part of the virtual directory structure (but not the container name).  
  
 You can list blobs hierarchically, in a manner similar to traversing a file system, or in a flat listing, where all blobs matching the specified prefix are returned by the listing operation.  
  
 You can specify additional details to return with the listing, including copy properties, metadata, snapshots, and uncommitted blobs.  
  
 For more information on listing blobs, see [List Blobs](../Topic/List%20Blobs.md) and [Enumerating Blob Resources](../Topic/Enumerating%20Blob%20Resources.md)  
  
 .  
  
---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.ListBlobs(System.String,System.Boolean,Microsoft.WindowsAzure.Storage.Blob.BlobListingDetails,Microsoft.WindowsAzure.Storage.Blob.BlobRequestOptions,Microsoft.WindowsAzure.Storage.OperationContext)  
examples: *content  
---  
  
## Examples  
 The following code example lists the blobs in a container whose names begin with the specified prefix.  
  
```  
private static void ListBlobsFromContainer(CloudBlobContainer container, string prefix)  
{  
    Console.WriteLine("List blobs in the container by prefix.");  
  
    try  
    {  
        // The prefix is optional when listing blobs in a container.  
        // List blobs in a flat listing.  
        foreach (var blob in container.ListBlobs(prefix, true, BlobListingDetails.None, null, null))  
        {  
            Console.WriteLine("\tBlob:" + blob.Uri);  
        }  
  
        Console.WriteLine();  
    }  
    catch (StorageException e)  
    {  
        Console.WriteLine(e.Message);  
        Console.ReadLine();  
        throw;  
    }  
}  
  
```