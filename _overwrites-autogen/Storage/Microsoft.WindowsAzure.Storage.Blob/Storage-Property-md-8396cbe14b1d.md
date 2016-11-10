---
uid: 
remarks: *content
---
---
uid: 
examples: *content
---
## Remarks  
 If your storage account uses read-access geo-redundant storage (RA-GRS), you can design your application to read from the secondary location if the primary location should become unavailable. The StorageURI property returns both the primary and secondary URIs for the container.  
  
> [!NOTE]
>  The StorageURI property is a client-side property, so it will return a secondary URI whether or not RA-GRS is enabled. However, if RA-GRS is not enabled, then subsequent calls against the secondary URI will fail.  
  
## Examples  
 This example gets service stats for the secondary endpoint. The call will fail if read-access geo-redundant storage (RA-GRS) is not enabled for the storage account.  
  
```c#  
private static async Task GetServiceStatsForSecondaryAsync(CloudBlobClient blobClient)  
{  
    try  
    {  
        // Get the URI for the secondary endpoint for Blob storage.  
        Uri secondaryUri = blobClient.StorageUri.SecondaryUri;  
  
        // Create a new service client based on the secondary endpoint.  
        CloudBlobClient blobClientSecondary = new CloudBlobClient(secondaryUri, blobClient.Credentials);  
  
        // Get the current stats for the secondary.  
        // The call will fail if your storage account does not have RA-GRS enabled.  
        // Change the retry policy for this call so that if it fails, it fails quickly.  
        BlobRequestOptions requestOptions = new BlobRequestOptions() { RetryPolicy = new NoRetry() };  
        ServiceStats blobStats = await blobClientSecondary.GetServiceStatsAsync(requestOptions, null);  
  
        Console.WriteLine("Geo-replication status: {0}", blobStats.GeoReplication.Status);  
        Console.WriteLine("Last geo-replication sync time: {0}", blobStats.GeoReplication.LastSyncTime);  
        Console.WriteLine();  
    }  
    catch (StorageException e)  
    {  
        // In this case, we do not re-throw the exception, so that the sample will continue to run even if RA-GRS is not enabled  
        // for this storage account.  
        if (e.RequestInformation.HttpStatusCode == 403)  
        {  
            Console.WriteLine("This storage account does not appear to support RA-GRS.");  
            Console.WriteLine("More information: {0}", e.Message);  
            Console.WriteLine();  
        }  
        else  
        {  
            Console.WriteLine(e.Message);  
            Console.ReadLine();  
            throw;  
        }  
    }  
}  
  
```