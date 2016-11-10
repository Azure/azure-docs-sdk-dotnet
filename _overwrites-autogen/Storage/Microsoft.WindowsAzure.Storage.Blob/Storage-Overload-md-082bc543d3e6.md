---
uid: 
remarks: *content
---
---
uid: 
examples: *content
---
## Remarks  
 Call this method to return a segmented list of containers whose names begin with the specified prefix. You can specify the number of results to return per segment in the `maxResults` parameter; if you pass in `null`, Azure Storage returns up to 5000 results per segment. Controlling the number of results returned helps to optimize performance, and may be useful if you are displaying results in a user interface.  
  
 If the number of results returned is less than the total number of results, Azure Storage returns a continuation token with the response. A continuation token is an opaque marker that you can pass to a subsequent listing call to return the next segment of results. Once the final segment of results is returned, the continuation token is set to null.  
  
## Examples  
 The following code example shows how to use a continuation token to retrieve the next set of results, if there are still results remaining. Note that the first time the `ListContainersSegmentedAsync` method is called, the continuation token is null. If there are additional results, then the method is called again with the continuation token returned by the service. Once all results have been returned, the continuation token is null.  
  
```c#  
private static async Task ListContainersWithPrefixAsync(CloudBlobClient blobClient, string prefix)  
{  
    Console.WriteLine("List all containers beginning with prefix {0}, plus container metadata:", prefix);  
  
    BlobContinuationToken continuationToken = null;  
    ContainerResultSegment resultSegment = null;  
  
    try  
    {  
        do  
        {  
            // List containers beginning with the specified prefix, returning segments of 5 results each.   
            // Note that passing in null for the maxResults parameter returns the maximum number of results (up to 5000).  
            // Requesting the container's metadata as part of the listing operation populates the metadata,   
            // so it's not necessary to call FetchAttributes() to read the metadata.  
            resultSegment = await blobClient.ListContainersSegmentedAsync(  
                prefix, ContainerListingDetails.Metadata, 5, continuationToken, null, null);  
  
            // Enumerate the containers returned.  
            foreach (var container in resultSegment.Results)  
            {  
                Console.WriteLine("\tContainer:" + container.Name);  
  
                // Write the container's metadata keys and values.  
                foreach (var metadataItem in container.Metadata)  
                {  
                    Console.WriteLine("\t\tMetadata key: " + metadataItem.Key);  
                    Console.WriteLine("\t\tMetadata value: " + metadataItem.Value);  
                }  
            }  
  
            // Get the continuation token.  
            continuationToken = resultSegment.ContinuationToken;  
  
        } while (continuationToken != null);  
  
        Console.WriteLine();  
    }  
    catch (StorageException e)  
    {  
        Console.WriteLine(e.Message);  
        Console.ReadLine();  
        throw;  
    }  
}  
  
```