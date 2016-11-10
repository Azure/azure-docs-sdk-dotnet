---
uid: 
remarks: *content
---
---
uid: 
examples: *content
---
## Remarks  
 The Metadata property returns a Dictionary object  to which you can add any number of name/value pairs. After you have added or updated metadata, call the container's [Microsoft.WindowsAzure.Storage.Blob](assetId:///N:Microsoft.WindowsAzure.Storage.Blob?qualifyHint=False&autoUpgrade=True) method to write the metadata to the service.  
  
 To remove all metadata from the container, call the Clear method on the metadata dictionary.  
  
## Examples  
 This example adds some metadata via the Metadata property, then writes the metadata to the service.  
  
```c#  
private static async Task AddContainerMetadataAsync(CloudBlobContainer container)  
{  
    try  
    {  
        // Add some metadata to the container.  
        container.Metadata.Add("docType", "textDocuments");  
        container.Metadata["category"] = "guidance";  
  
        // Set the container's metadata asynchronously.  
        await container.SetMetadataAsync();  
    }  
    catch (StorageException e)  
    {  
        Console.WriteLine(e.Message);  
        Console.WriteLine(e.RequestInformation.ExtendedErrorInformation);  
        Console.ReadLine();  
        throw;  
    }  
}  
  
```  
  
 This example lists containers in a storage account. The code returns metadata each container listed, and enumerates the metadata.  
  
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