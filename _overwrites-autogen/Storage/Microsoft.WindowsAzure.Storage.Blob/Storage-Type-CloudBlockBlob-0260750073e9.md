---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlockBlob  
remarks: *content  
---  
  
## Remarks  
 Block blobs are optimized for upload large amounts of data efficiently. For details about block blobs, see [Understanding Block Blobs, Append Blobs, and Page Blobs](../Topic/Understanding%20Block%20Blobs,%20Append%20Blobs,%20and%20Page%20Blobs.md).  
  
---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlockBlob  
examples: *content  
---  
  
## Examples  
 This code example creates a new block blob with a random name, and writes some text to it.  
  
```c#  
private static async Task<CloudBlockBlob> CreateRandomlyNamedBlockBlobAsync(CloudBlobContainer container)  
{  
    // Get a reference to a blob that does not yet exist.  
    // The GetBlockBlobReference method does not make a request to the service, but only creates the object in memory.  
    string blobName = "sample-blob-" + Guid.NewGuid();  
    CloudBlockBlob blob = container.GetBlockBlobReference(blobName);  
  
    // For the purposes of the sample, check to see whether the blob exists.  
    Console.WriteLine("Blob {0} exists? {1}", blobName, await blob.ExistsAsync());  
  
    try  
    {  
        // Writing to the blob creates it on the service.  
        await blob.UploadTextAsync(string.Format("This is a blob named {0}", blobName));  
    }  
    catch (StorageException e)  
    {  
        Console.WriteLine(e.Message);  
        Console.ReadLine();  
        throw;  
    }  
  
    // Check again to see whether the blob exists.  
    Console.WriteLine("Blob {0} exists? {1}", blobName, await blob.ExistsAsync());  
  
    return blob;  
}  
  
```