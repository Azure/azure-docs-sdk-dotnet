---
uid: 
examples: *content
---
## Examples  
 This example creates a specified number of block blobs, adding metadata to each blob as it is created.  
  
```c#  
private static async Task CreateSequentiallyNamedBlockBlobsAsync(CloudBlobContainer container, int numberOfBlobs)  
{  
    try  
    {  
        CloudBlockBlob blob;  
        string blobName = string.Empty;  
        MemoryStream msWrite;  
  
        for (int i = 1; i <= numberOfBlobs; i++)  
        {  
            // Format string for blob name.  
            blobName = i.ToString("00000") + ".txt";  
  
            // Get a reference to the blob.  
            blob = container.GetBlockBlobReference(blobName);  
  
            // Set a property on the blob.  
            blob.Properties.ContentType = "text/html";  
  
            // Set some metadata on the blob.  
            blob.Metadata.Add("DateCreated", DateTime.UtcNow.ToLongDateString());  
            blob.Metadata.Add("TimeCreated", DateTime.UtcNow.ToLongTimeString());  
  
            // Write the name of the blob to its contents as well.  
            msWrite = new MemoryStream(Encoding.UTF8.GetBytes("This is blob " + blobName + "."));  
            msWrite.Position = 0;  
            using (msWrite)  
            {  
                // Uploading the blob sets the properties and metadata on the new blob.  
                await blob.UploadFromStreamAsync(msWrite);  
            }  
        }  
    }  
    catch (StorageException e)  
    {  
        Console.WriteLine(e.Message);  
        Console.ReadLine();  
        throw;  
    }  
}  
  
```