---
uid: 
remarks: *content
---
---
uid: 
examples: *content
---
## Remarks  
 The AbortCopyAsync method aborts a copy operation, leaving a destination blob with zero length and complete metadata. Use the copy ID returned by the [Microsoft.WindowsAzure.Storage.Blob](assetId:///N:Microsoft.WindowsAzure.Storage.Blob?qualifyHint=False&autoUpgrade=True) method to abort the copy operation.  
  
 For more information about aborting a copy operation, see [Abort Copy Blob](../Topic/Abort%20Copy%20Blob.md).  
  
## Examples  
 This code example creates a new append blob, then copies it to a another blob. If the copy operation is still pending after one second, the copy operation is aborted.  
  
```c#  
private static async Task CopyAppendBlobAsync(CloudBlobContainer container, int sizeInKb)  
{  
    // Create an array of random bytes, of the specified size.  
    byte[] bytes = new byte[sizeInKb * 1024];  
    Random rng = new Random();  
    rng.NextBytes(bytes);  
  
    // Get a reference to a new block blob.  
    CloudAppendBlob sourceBlob = container.GetAppendBlobReference("sample-append-blob");  
  
    // Get a reference to the destination blob (in this case, a new blob).  
    CloudAppendBlob destBlob = container.GetAppendBlobReference("copy of " + sourceBlob.Name);  
  
    MemoryStream msWrite = null;  
    string copyId = null;  
    string leaseId = null;  
  
    try  
    {  
        // Create a new block blob comprised of random bytes to use as the source of the copy operation.  
        msWrite = new MemoryStream(bytes);  
        msWrite.Position = 0;  
        using (msWrite)  
        {  
            await sourceBlob.UploadFromStreamAsync(msWrite);  
        }  
  
        // Lease the source blob for the copy operation to prevent another client from modifying it.  
        // Specifying null for the lease interval creates an infinite lease.  
        leaseId = await sourceBlob.AcquireLeaseAsync(null);  
  
        // Get the ID of the copy operation.  
        copyId = await destBlob.StartCopyAsync(sourceBlob);  
  
        // Fetch the destination blob's properties before checking the copy state.  
        await destBlob.FetchAttributesAsync();  
  
        // Sleep for 1 second. In a real-world application, this would most likely be a longer interval.  
        System.Threading.Thread.Sleep(1000);  
  
        // Check the copy status. If it is still pending, abort the copy operation.  
        if (destBlob.CopyState.Status == CopyStatus.Pending)  
        {  
            await destBlob.AbortCopyAsync(copyId);  
            Console.WriteLine("Copy operation {0} has been aborted.", copyId);  
        }  
        else  
        {  
            Console.WriteLine("Copy operation succeeded.");  
        }  
  
        Console.WriteLine();  
    }  
    catch (StorageException e)  
    {  
        Console.WriteLine(e.Message);  
        Console.ReadLine();  
        throw;  
    }  
    finally  
    {  
        // Close the stream.  
        if (msWrite != null)  
        {  
            msWrite.Close();  
        }  
  
        // Break the lease on the source blob.  
        if (sourceBlob != null)  
        {  
            await sourceBlob.FetchAttributesAsync();  
  
            if (sourceBlob.Properties.LeaseState != LeaseState.Available)  
            {  
                await sourceBlob.BreakLeaseAsync(new TimeSpan(0));  
            }  
        }  
  
        // Delete the source blob.  
        if (sourceBlob != null)  
        {  
            await sourceBlob.DeleteIfExistsAsync();  
        }  
  
        // Delete the destination blob.  
        if (destBlob != null)  
        {  
            await destBlob.DeleteIfExistsAsync();  
        }  
    }  
}  
  
```