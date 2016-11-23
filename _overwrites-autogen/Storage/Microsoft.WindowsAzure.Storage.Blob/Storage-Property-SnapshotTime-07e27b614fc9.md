---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlob.SnapshotTime  
remarks: *content  
---  
  
## Remarks  
 If the blob is not a snapshot, the value of this property is `null`.  
  
---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlob.SnapshotTime  
examples: *content  
---  
  
## Examples  
 This example creates a new blob, then takes a snapshot of the blob.  
  
```c#  
private static async Task CreateBlockBlobSnapshotAsync(CloudBlobContainer container)  
{  
    // Create a new block blob in the container.  
    CloudBlockBlob baseBlob = container.GetBlockBlobReference("sample-base-blob.txt");  
  
    // Add blob metadata.  
    baseBlob.Metadata.Add("ApproxBlobCreatedDate", DateTime.UtcNow.ToString());  
  
    try  
    {  
        // Upload the blob to create it, with its metadata.  
        await baseBlob.UploadTextAsync(string.Format("Base blob: {0}", baseBlob.Uri.ToString()));  
  
        // Sleep 5 seconds.  
        System.Threading.Thread.Sleep(5000);  
  
        // Create a snapshot of the base blob.  
        // Specify metadata at the time that the snapshot is created to specify unique metadata for the snapshot.  
        // If no metadata is specified when the snapshot is created, the base blob's metadata is copied to the snapshot.  
        Dictionary<string, string> metadata = new Dictionary<string, string>();  
        metadata.Add("ApproxSnapshotCreatedDate", DateTime.UtcNow.ToString());  
        CloudBlockBlob snapshot = await baseBlob.CreateSnapshotAsync(metadata, null, null, null);  
  
        Console.WriteLine("Snapshot created: {0}", snapshot.SnapshotQualifiedUri);  
        Console.WriteLine("Snapshot time: {0}", snapshot.SnapshotQualifiedUri);  
    }  
    catch (StorageException e)  
    {  
        Console.WriteLine(e.Message);  
        Console.ReadLine();  
        throw;  
    }  
}  
  
```