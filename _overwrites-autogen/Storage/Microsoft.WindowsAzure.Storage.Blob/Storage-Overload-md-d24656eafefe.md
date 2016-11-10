---
uid: 
remarks: *content
---
---
uid: 
examples: *content
---
## Remarks  
 Call this method to return a reference to a block blob in this container. Note that this method does not make a request against Blob storage. You can return a reference to the block blob whether or not it exists.  
  
## Examples  
 This example gets a reference to a block blob and uploads some text to it. If the blob does not exist, it will be created; if it does exist, its current contents will be overwritten with the new contents.  
  
```c#  
private static async Task<CloudBlockBlob> CreateRandomlyNamedBlockBlobAsync(CloudBlobContainer container)  
{  
    // Get a reference to a blob that does not yet exist.  
    // The GetBlockBlobReference method does not make a request to the service, but only creates the object in memory.  
    string blobName = BlobPrefix + Guid.NewGuid();  
    CloudBlockBlob blob = container.GetBlockBlobReference(blobName);  
  
     // For the purposes of the sample, check to see whether the blob exists.  
    Console.WriteLine("Blob {0} exists? {1}", blobName, await blob.ExistsAsync());  
  
   try  
    {  
        // Writing to the blob creates it in the service.  
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