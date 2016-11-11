---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.ServiceClient  
examples: *content  
---  
  
## Examples  
 This example creates a specified number of block blobs in an optional hierarchy. It uses the ServiceClient property to retrieve the default delimiter for the Blob service.  
  
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