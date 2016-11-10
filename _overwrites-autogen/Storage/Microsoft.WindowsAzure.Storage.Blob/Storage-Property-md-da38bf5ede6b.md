---
uid: 
remarks: *content
---
---
uid: 
examples: *content
---
## Remarks  
 Get the value of the CopyState property after calling [Microsoft.WindowsAzure.Storage.Blob](assetId:///N:Microsoft.WindowsAzure.Storage.Blob?qualifyHint=False&autoUpgrade=True) to check the status of a copy operation. Note that you'll need to call [FetchAttributesAsync](assetId:///Overload:Microsoft.WindowsAzure.Storage.Blob.CloudBlob.FetchAttributesAsync?qualifyHint=False&autoUpgrade=True) to retrieve the latest values from the server before checking the CopyState property.  
  
## Examples  
 This code example copies a blob, checking the copy state while the copy operation proceeds.  
  
```c#  
private static async Task CopyBlockBlobAsync(CloudBlobContainer container)  
{  
    CloudBlockBlob sourceBlob = null;  
    CloudBlockBlob destBlob = null;  
    string leaseId = null;  
  
    try  
    {  
        // Get a block blob from the container to use as the source.  
        sourceBlob = container.ListBlobs().OfType<CloudBlockBlob>().FirstOrDefault();  
  
        // Lease the source blob for the copy operation to prevent another client from modifying it.  
        // Specifying null for the lease interval creates an infinite lease.  
        leaseId = await sourceBlob.AcquireLeaseAsync(null);  
  
        // Get a reference to a destination blob (in this case, a new blob).  
        destBlob = container.GetBlockBlobReference("copy of " + sourceBlob.Name);  
  
        // Ensure that the source blob exists.  
        if (await sourceBlob.ExistsAsync())  
        {  
            // Get the ID of the copy operation.  
            string copyId = await destBlob.StartCopyAsync(sourceBlob);  
  
            // Fetch the destination blob's properties before checking the copy state.  
            await destBlob.FetchAttributesAsync();  
  
            Console.WriteLine("Status of copy operation: {0}", destBlob.CopyState.Status);  
            Console.WriteLine("Completion time: {0}", destBlob.CopyState.CompletionTime);  
            Console.WriteLine("Bytes copied: {0}", destBlob.CopyState.BytesCopied.ToString());  
            Console.WriteLine("Total bytes: {0}", destBlob.CopyState.TotalBytes.ToString());  
            Console.WriteLine();  
        }  
    }  
    catch (StorageException e)  
    {  
        Console.WriteLine(e.Message);  
        Console.ReadLine();  
        throw;  
    }  
    finally  
    {  
        // Break the lease on the source blob.  
        if (sourceBlob != null)  
        {  
            await sourceBlob.FetchAttributesAsync();  
  
            if (sourceBlob.Properties.LeaseState != LeaseState.Available)  
            {  
                await sourceBlob.BreakLeaseAsync(new TimeSpan(0));  
            }  
        }  
    }  
}  
  
```