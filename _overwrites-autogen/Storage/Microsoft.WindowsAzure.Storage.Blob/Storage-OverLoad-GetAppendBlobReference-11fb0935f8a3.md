---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.GetAppendBlobReference  
remarks: *content  
---  
  
## Remarks  
 Call this method to return a reference to an append blob in this container. Note that this method does not make a request against Blob storage. You can return a reference to the append blob whether or not it exists yet.  
  
---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.GetAppendBlobReference  
examples: *content  
---  
  
## Examples  
 This example writes blocks to an append blob, then prints the contents of the append blob.  
  
```c#  
private static async Task WriteToAppendBlob(CloudBlobContainer container)  
{  
    //Get a reference to an append blob.  
    CloudAppendBlob appendBlob = container.GetAppendBlobReference("append-blob.log");  
  
    try  
    {  
        //Create the append blob. Note that if the blob already exists, the CreateOrReplace() method will overwrite it.  
        //You can check whether the blob exists to avoid overwriting it by using CloudAppendBlob.Exists().  
        await appendBlob.CreateOrReplaceAsync();  
  
        int numBlocks = 10;  
  
        //Generate an array of random bytes.  
        Random rnd = new Random();  
        byte[] bytes = new byte[numBlocks];  
        rnd.NextBytes(bytes);  
  
        //Simulate a logging operation by writing text data and byte data to the end of the append blob.  
        for (int i = 0; i < numBlocks; i++)  
        {  
            await appendBlob.AppendTextAsync(string.Format("Timestamp: {0:u} \tLog Entry: {1}{2}",  
                DateTime.UtcNow, bytes[i], Environment.NewLine));  
        }  
  
        //Read the append blob to the console window.  
        Console.WriteLine(appendBlob.DownloadText());  
  
    }  
    catch (StorageException e)  
    {  
        Console.WriteLine(e.Message);  
        Console.ReadLine();  
        throw;  
    }  
}  
  
```