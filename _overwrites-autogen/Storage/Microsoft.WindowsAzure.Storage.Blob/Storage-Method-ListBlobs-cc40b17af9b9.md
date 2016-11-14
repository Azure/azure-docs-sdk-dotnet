---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobClient.ListBlobs(System.String,System.Boolean,Microsoft.WindowsAzure.Storage.Blob.BlobListingDetails,Microsoft.WindowsAzure.Storage.Blob.BlobRequestOptions,Microsoft.WindowsAzure.Storage.OperationContext)  
remarks: *content  
---  
  
## Remarks  
 This method lists all blobs that match the specified prefix. The specified prefix must include the complete name of an existing container in the account and a forward slash (/) at a minimum. The prefix may optionally include the blob name prefix as well.  
  
 Here are some examples of valid prefixes:  
  
-   **sample-container/**: Returns all blobs in this container.  
  
-   **sample-container/s**: Returns all blobs in this container whose names begin with 's'.  
  
-   **sample-container/media/s**: Returns all blobs in this container whose names begin with 'media/s'.  
  
 The `useFlatBlobListing` parameter indicates whether to list blobs in a hierarchical listing, traversing virtual directories based on the blob delimiter character, or to use a flat listing, returning all blobs that match the prefix at one time. See [Enumerating Blob Resources](../Topic/Enumerating%20Blob%20Resources.md) for additional details on the two types of listing operations.  
  
> [!NOTE]
>  [!INCLUDE[azure-storage-async-alert](../Token/azure-storage-async-alert_md.md)]  
>   
>  The analogous method that uses Async/Await is [ListBlobsSegmentedAsync](assetId:///Overload:Microsoft.WindowsAzure.Storage.Blob.CloudBlobClient.ListBlobsSegmentedAsync?qualifyHint=False&autoUpgrade=True).  
  
---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobClient.ListBlobs(System.String,System.Boolean,Microsoft.WindowsAzure.Storage.Blob.BlobListingDetails,Microsoft.WindowsAzure.Storage.Blob.BlobRequestOptions,Microsoft.WindowsAzure.Storage.OperationContext)  
examples: *content  
---  
  
## Examples  
 The following code example lists blobs beginning with the specified prefix, returning a flat listing.  
  
```c#  
private static void ListBlobsFromServiceClient(CloudBlobClient blobClient, string prefix)  
{  
    Console.WriteLine("List blobs by prefix. Prefix must include container name:");  
  
    try  
    {  
        // The prefix is required when listing blobs from the service client. The prefix must include  
        // the container name.  
        foreach (var blob in blobClient.ListBlobs(prefix, true, BlobListingDetails.None, null, null))  
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