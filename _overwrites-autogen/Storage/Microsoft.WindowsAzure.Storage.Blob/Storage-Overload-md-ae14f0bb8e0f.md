---
uid: 
examples: *content
---
## Examples  
 This example creates a randomly named block blob. After getting a reference to the blob, it checks to see whether the blob exists, then checks again after it has been created.  
  
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