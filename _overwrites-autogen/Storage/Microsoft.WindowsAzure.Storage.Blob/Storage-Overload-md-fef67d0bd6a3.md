---
uid: 
remarks: *content
---
---
uid: 
examples: *content
---
## Remarks  
 The ListBlobsSegmentedAsync method lists blobs and virtual directories in a container, optionally in segments of a specified or default size.  
  
 You can optionally specify a blob prefix to list blobs whose names begin with the same string. If you use a delimiter character in your blob names to create a virtual directory structure, the blob prefix can include all or part of the virtual directory structure (but not the container name).  
  
 You can list blobs hierarchically, in a manner similar to traversing a file system, or in a flat listing, where all blobs matching the specified prefix are returned by the listing operation.  
  
 You can specify additional details to return with the listing, including copy properties, metadata, snapshots, and uncommitted blobs.  
  
 The `maxResults` parameter specifies the number of blob items to return per segment, up to a maximum of 5000. If this parameter is null, then the maximum number of available results is returned, up to 5000. If there are additional results remaining after the first segment is returned, the service returns a continuation token, an opaque value that can be passed back to the service on a subsequent call to return the next segment. Once all results have been returned, the service returns a null continuation token.  
  
 For more information on listing blobs, see [List Blobs](../Topic/List%20Blobs.md) and [Enumerating Blob Resources](../Topic/Enumerating%20Blob%20Resources.md)  
  
 .  
  
## Examples  
 This example lists virtual directories and blobs beginning with the specified prefix in a hierarchical listing. The method is called recursively to traverse the virtual directory structure.  
  
```c#  
private static async Task ListBlobsHierarchicalListingAsync(CloudBlobContainer container, string prefix)  
{  
    // List blobs in segments.  
    Console.WriteLine("List blobs (hierarchical listing):");  
    Console.WriteLine();  
  
    // Enumerate the result segment returned.  
    BlobContinuationToken continuationToken = null;  
    BlobResultSegment resultSegment = null;  
  
    try  
    {  
        // Call ListBlobsSegmentedAsync recursively and enumerate the result segment returned, while the continuation token is non-null.  
        // When the continuation token is null, the last segment has been returned and execution can exit the loop.  
        // Note that blob snapshots cannot be listed in a hierarchical listing operation.  
        do  
        {  
            resultSegment = await container.ListBlobsSegmentedAsync(prefix, false, BlobListingDetails.Metadata, null, continuationToken, null, null);  
  
            foreach (var blobItem in resultSegment.Results)  
            {  
                Console.WriteLine("************************************");  
                Console.WriteLine(blobItem.Uri);  
  
                // A hierarchical listing returns both virtual directories and blobs.  
                // Call recursively with the virtual directory prefix to enumerate the contents of each virtual directory.  
                if (blobItem is CloudBlobDirectory)  
                {  
                    PrintVirtualDirectoryProperties((CloudBlobDirectory)blobItem);  
                    CloudBlobDirectory dir = blobItem as CloudBlobDirectory;  
                    await ListBlobsHierarchicalListingAsync(container, dir.Prefix);  
                }  
                else  
                {  
                    // Write out blob properties and metadata.  
                    PrintBlobPropertiesAndMetadata((CloudBlob)blobItem);  
                }  
            }  
  
            Console.WriteLine();  
  
            // Get the continuation token, if there are additional segments of results.  
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
  
private static void PrintVirtualDirectoryProperties(CloudBlobDirectory dir)  
{  
    Console.WriteLine();  
    Console.WriteLine("-----Virtual Directory Properties-----");  
    Console.WriteLine("\t Container: {0}", dir.Container.Name);  
    Console.WriteLine("\t Parent: {0}", dir.Parent);  
    Console.WriteLine("\t Prefix: {0}", dir.Prefix);  
    Console.WriteLine("\t Uri: {0}", dir.Uri);  
    Console.WriteLine();  
}  
  
private static void PrintBlobPropertiesAndMetadata(CloudBlob blob)  
{  
    // Write out properties that are common to all blob types.  
    Console.WriteLine();  
    Console.WriteLine("-----Blob Properties-----");  
    Console.WriteLine("\t Name: {0}", blob.Name);  
    Console.WriteLine("\t Container: {0}", blob.Container.Name);  
    Console.WriteLine("\t BlobType: {0}", blob.Properties.BlobType);  
    Console.WriteLine();  
}  
  
```  
  
 This example lists blobs beginning with the specified prefix in a flat listing.  
  
```c#  
private static async Task ListBlobsFlatListingAsync(CloudBlobContainer container, int? segmentSize)  
{  
    // List blobs to the console window.  
    Console.WriteLine("List blobs in segments (flat listing):");  
    Console.WriteLine();  
  
    int i = 0;  
    BlobContinuationToken continuationToken = null;  
    BlobResultSegment resultSegment = null;  
  
    try  
    {  
        // Call ListBlobsSegmentedAsync and enumerate the result segment returned, while the continuation token is non-null.  
        // When the continuation token is null, the last segment has been returned and execution can exit the loop.  
        do  
        {  
            // This overload allows control of the segment size. You can return all remaining results by passing null for the maxResults parameter,   
            // or by calling a different overload.  
            // Note that requesting the blob's metadata as part of the listing operation   
            // populates the metadata, so it's not necessary to call FetchAttributes() to read the metadata.  
            resultSegment = await container.ListBlobsSegmentedAsync(string.Empty, true, BlobListingDetails.Metadata, segmentSize, continuationToken, null, null);  
            if (resultSegment.Results.Count() > 0)  
            {  
                Console.WriteLine("Page {0}:", ++i);  
            }  
  
            foreach (var blobItem in resultSegment.Results)  
            {  
                Console.WriteLine("************************************");  
                Console.WriteLine(blobItem.Uri);  
  
                // A flat listing operation returns only blobs, not virtual directories.  
                // Write out blob properties and metadata.  
                if (blobItem is CloudBlob)  
                {  
                    PrintBlobPropertiesAndMetadata((CloudBlob)blobItem);  
                }  
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
  
private static void PrintBlobPropertiesAndMetadata(CloudBlob blob)  
{  
    // Write out properties that are common to all blob types.  
    Console.WriteLine();  
    Console.WriteLine("-----Blob Properties-----");  
    Console.WriteLine("\t Name: {0}", blob.Name);  
    Console.WriteLine("\t Container: {0}", blob.Container.Name);  
    Console.WriteLine("\t BlobType: {0}", blob.Properties.BlobType);  
    Console.WriteLine();  
}  
  
```