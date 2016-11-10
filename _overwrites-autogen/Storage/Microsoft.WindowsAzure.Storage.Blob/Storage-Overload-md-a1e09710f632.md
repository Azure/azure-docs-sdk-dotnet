---
uid: 
remarks: *content
---
---
uid: 
examples: *content
---
## Remarks  
 This method lists all blobs that match the specified prefix. The specified prefix must include the complete name of an existing container in the account and a forward slash (/) at a minimum. The prefix may optionally include the blob name prefix as well.  
  
 Here are some examples of valid prefixes:  
  
-   **sample-container/**: Returns all blobs in this container.  
  
-   **sample-container/s**: Returns all blobs in this container whose names begin with 's'.  
  
-   **sample-container/media/s**: Returns all blobs in this container whose names begin with 'media/s'.  
  
 Some overloads include the `useFlatBlobListing` parameter indicates whether to list blobs in a hierarchical listing, traversing virtual directories based on the blob delimiter character, or to use a flat listing, returning all blobs that match the prefix at one time. See [Enumerating Blob Resources](../Topic/Enumerating%20Blob%20Resources.md) for additional details on the two types of listing operations.  
  
 You can use this method to return results in segments. Some overloads include the `maxResults` parameter, which you can use to specify the size of the segment to return. If `maxResults` is null, this method returns the maximum number of results per segment, up to 5000.  
  
 To return the next segment, use the continuation token that is provided by the service when there are additional results to return. The continuation token is an opaque value that indicates to the service the point from which to return the next set of results. A continuation token value is returned with each call until there are no more results, at which point the value of the continuation token is set to null.  
  
## Examples  
 This code example shows how to list blobs in segments and use a continuation token to retrieve each segment of results.  
  
```c#  
private static async Task ListBlobsFromServiceClientAsync(CloudBlobClient blobClient, string prefix)  
{  
    Console.WriteLine("List blobs by prefix. Prefix must include container name:");  
  
    BlobContinuationToken continuationToken = null;  
    BlobResultSegment resultSegment = null;   
  
    try  
    {  
        do  
        {  
            // The prefix is required when listing blobs from the service client. The prefix must include  
            // the container name.  
            resultSegment = await blobClient.ListBlobsSegmentedAsync(prefix, continuationToken);  
            foreach (var blob in resultSegment.Results)  
            {  
                Console.WriteLine("\tBlob:" + blob.Uri);  
            }  
  
            Console.WriteLine();  
  
            // Get the continuation token.  
            continuationToken = resultSegment.ContinuationToken;  
  
        } while (continuationToken != null);  
  
    }  
    catch (StorageException e)  
    {  
        Console.WriteLine(e.Message);  
        Console.ReadLine();  
        throw;  
    }  
}  
  
```