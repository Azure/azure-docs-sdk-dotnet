---
uid: 
remarks: *content
---
---
uid: 
examples: *content
---
## Remarks  
 If your storage account is configured for read-access geo-redundant (RA-GRS) storage, you can call this method to check the status of the read-only secondary endpoint. For more information, see [Azure Storage replication](https://azure.microsoft.com/documentation/articles/storage-redundancy/).  
  
## Examples  
 The following code example shows how to get stats for the secondary endpoint. If the storage account is not configured for RA-GRS, the call fails with error code 403 (Forbidden).  
  
```c#  
private static async Task GetServiceStatsForSecondary(CloudBlobClient blobClient)  
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