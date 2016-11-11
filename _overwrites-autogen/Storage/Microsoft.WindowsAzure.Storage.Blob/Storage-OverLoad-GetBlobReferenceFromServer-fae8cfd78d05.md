---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobClient.GetBlobReferenceFromServer  
remarks: *content  
---  
  
## Remarks  
 Gets a reference to a blob with a request to the server. Contrast this method with other methods that return a reference to a blob, where no call to the server is made.  
  
 If the blob does not exist, this call will fail with a 404 error (Not Found).  
  
> [!NOTE]
>  [!INCLUDE[azure-storage-async-alert](../Token/azure-storage-async-alert_md.md)]  
>   
>  The analogous method that uses Async/Await is [GetBlobReferenceFromServerAsync](assetId:///Overload:Microsoft.WindowsAzure.Storage.Blob.CloudBlobClient.GetBlobReferenceFromServerAsync?qualifyHint=False&autoUpgrade=True).  
  
---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobClient.GetBlobReferenceFromServer  
examples: *content  
---  
  
## Examples  
  
```c#  
private static void GetExistingBlobReference(CloudBlobContainer container, string blobName)  
{  
    try  
    {  
        // Get a reference to a blob with a request to the server.  
        // If the blob does not exist, this call will fail with a 404 (Not Found).  
        ICloudBlob blob = container.GetBlobReferenceFromServer(blobName);  
  
        // The previous call gets the blob's properties, so it's not necessary to call FetchAttributes  
        // to read a property.  
        Console.WriteLine("Blob {0} was last modified at {1} local time.", blobName,  
            blob.Properties.LastModified.Value.LocalDateTime);  
    }  
    catch (StorageException e)  
    {  
        if (e.RequestInformation.HttpStatusCode == 404)  
        {  
            Console.WriteLine("Blob {0} does not exist.", blobName);  
            Console.WriteLine("Additional error information: " + e.Message);  
        }  
        else  
        {  
            Console.WriteLine(e.Message);  
            Console.ReadLine();  
            throw;  
        }  
    }  
  
    Console.WriteLine();  
}  
  
```