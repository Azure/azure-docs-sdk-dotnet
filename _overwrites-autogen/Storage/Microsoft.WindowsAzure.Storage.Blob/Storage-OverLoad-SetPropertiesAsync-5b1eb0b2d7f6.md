---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlockBlob.SetPropertiesAsync  
examples: *content  
---  
  
## Examples  
 This code example creates a set of nested block blobs, using the specified number of nesting levels, and the specified number of blobs per level. It sets a property and some metadata on each blob after it is created. Note that the blob's properties and metadata can also be set at the same time that the blob is created.  
  
```c#  
private static async Task CreateNestedBlockBlobsAsync(CloudBlobContainer container, short numberOfLevels, short numberOfBlobsPerLevel)  
{  
    try  
    {  
        CloudBlockBlob blob;  
        MemoryStream msWrite;  
        string blobName = string.Empty;  
        string virtualDirName = string.Empty;  
  
        // Create a nested blob structure.  
        for (int i = 1; i <= numberOfLevels; i++)  
        {  
            // Construct the virtual directory name, which becomes part of the blob name.  
            virtualDirName += string.Format("level{0}{1}", i, container.ServiceClient.DefaultDelimiter);  
            for (int j = 1; j <= numberOfBlobsPerLevel; j++)  
            {  
                // Construct string for blob name.  
                blobName = virtualDirName + string.Format("{0}-{1}.txt", i, j.ToString("00000"));  
  
                // Get a reference to the blob.  
                blob = container.GetBlockBlobReference(blobName);  
  
                // Write the blob URI to its contents.  
                msWrite = new MemoryStream(Encoding.UTF8.GetBytes("Absolute URI to blob: " + blob.StorageUri.PrimaryUri + "."));  
                msWrite.Position = 0;  
                using (msWrite)  
                {  
                    await blob.UploadFromStreamAsync(msWrite);  
                }  
  
                // Set a property on the blob.  
                blob.Properties.ContentType = "text/html";  
                await blob.SetPropertiesAsync();  
  
                // Set some metadata on the blob.  
                blob.Metadata.Add("DateCreated", DateTime.UtcNow.ToLongDateString());  
                blob.Metadata.Add("TimeCreated", DateTime.UtcNow.ToLongTimeString());  
                await blob.SetMetadataAsync();  
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