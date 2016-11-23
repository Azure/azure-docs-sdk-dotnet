---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.GetBlobReference  
remarks: *content  
---  
  
## Remarks  
 Call this method to return a reference to a blob of any type in this container. Note that this method does not make a request against Blob storage. You can return a reference to the blob whether or not it exists yet.  
  
---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.GetBlobReference  
examples: *content  
---  
  
## Examples  
 This example creates a new block blob and takes a snapshot of the blob. It then get a reference to the new snapshot using the blob name and the snapshot time.  
  
```c#  
private static async Task CreateAndSnapshotBlob(CloudBlobContainer container)  
{  
    // Create a new block blob in the container.  
    // Get a reference to a blob that does not yet exist.  
    string blobName = "sample-blob-" + Guid.NewGuid();  
    CloudBlockBlob blockBlob = container.GetBlockBlobReference(blobName);  
  
    try  
    {  
        // Writing to the blob creates it in Blob storage.  
        await blockBlob.UploadTextAsync(string.Format("This is a blob named {0}", blobName));  
  
        // Take a snapshot of the new blob.  
        CloudBlob blockBlobSnapshot = await blockBlob.SnapshotAsync();  
        DateTimeOffset? snapshotTime = blockBlobSnapshot.SnapshotTime;  
  
        // Get a new reference to the snapshot we just created, using the name and snapshot time.  
        CloudBlob blockBlobSnapshot2 = container.GetBlobReference(blockBlobSnapshot.Name, blockBlobSnapshot.SnapshotTime);  
        Console.WriteLine(blockBlobSnapshot2.SnapshotQualifiedUri);  
    }  
    catch (StorageException e)  
    {  
        Console.WriteLine(e.Message);  
        Console.ReadLine();  
        throw;  
    }  
}  
  
```