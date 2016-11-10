---
uid: 
remarks: *content
---
---
uid: 
examples: *content
---
## Remarks  
 Gets a reference to a blob with a request to the server. Contrast this method with other methods that return a reference to a blob, where no call to the server is made.  
  
 Specify the absolute URI to the blob, including the service endpoint, the container name, and the blob name.  
  
 If the blob does not exist, this call will fail with a 404 error (Not Found).  
  
## Examples  
 This example gets a reference to a blob by making a request to the service. Note that the example uses the absolute URI to the blob.  
  
```c#  
private static async Task GetExistingBlobReferenceAsync(CloudBlobClient blobClient)  
{  
    const string blobUri = "https://storagesample.blob.core.windows.net/sample-container/sample-blob.txt";  
    ICloudBlob blob = null;  
  
    try  
    {  
        // Get a reference to a blob with a request to the server.  
        // If the blob does not exist, this call will fail with a 404 (Not Found).  
        blob = await blobClient.GetBlobReferenceFromServerAsync(new Uri(blobUri));  
  
        // The previous call gets the blob's properties, so it's not necessary to call FetchAttributes  
        // to read a property.  
        Console.WriteLine("Blob {0} was last modified at {1} local time.", blob.Name,  
            blob.Properties.LastModified.Value.LocalDateTime);  
    }  
    catch (StorageException e)  
    {  
        if (e.RequestInformation.HttpStatusCode == 404)  
        {  
            Console.WriteLine("Blob does not exist.");  
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