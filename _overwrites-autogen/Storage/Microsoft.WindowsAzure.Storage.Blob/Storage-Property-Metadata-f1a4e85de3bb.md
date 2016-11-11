---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlob.Metadata  
remarks: *content  
---  
  
## Remarks  
 Before checking blob metadata, call FetchAttributesAsync to retrieve metadata values from the server.  
  
 Note that if you return blob metadata as part of a listing operation, it's not necessary to call FetchAttributesAsync to retrieve metadata, as the blob's metadata is returned as part of the listing operation.  
  
---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlob.Metadata  
examples: *content  
---  
  
## Examples  
 This code example writes a blob property and metadata values to the console window.  
  
```c#  
private static void PrintBlobPropertiesAndMetadata(CloudBlob blob)  
{  
    // Write out properties that are common to all blob types.  
    Console.WriteLine();  
    Console.WriteLine("-----Blob Properties-----");  
    Console.WriteLine("\t Name: {0}", blob.Name);  
    Console.WriteLine("\t Container: {0}", blob.Container.Name);  
    Console.WriteLine("\t BlobType: {0}", blob.Properties.BlobType);  
    Console.WriteLine("\t IsSnapshot: {0}", blob.IsSnapshot);  
  
    // If the blob is a snapshot, write out snapshot properties.  
    if (blob.IsSnapshot)  
    {  
        Console.WriteLine("\t SnapshotTime: {0}", blob.SnapshotTime);  
        Console.WriteLine("\t SnapshotQualifiedUri: {0}", blob.SnapshotQualifiedUri);  
    }  
  
    Console.WriteLine("\t LeaseState: {0}", blob.Properties.LeaseState);  
  
    // If the blob has been leased, write out lease properties.  
    if (blob.Properties.LeaseState != LeaseState.Available)  
    {  
        Console.WriteLine("\t LeaseDuration: {0}", blob.Properties.LeaseDuration);  
        Console.WriteLine("\t LeaseStatus: {0}", blob.Properties.LeaseStatus);  
    }  
  
    Console.WriteLine("\t CacheControl: {0}", blob.Properties.CacheControl);  
    Console.WriteLine("\t ContentDisposition: {0}", blob.Properties.ContentDisposition);  
    Console.WriteLine("\t ContentEncoding: {0}", blob.Properties.ContentEncoding);  
    Console.WriteLine("\t ContentLanguage: {0}", blob.Properties.ContentLanguage);  
    Console.WriteLine("\t ContentMD5: {0}", blob.Properties.ContentMD5);  
    Console.WriteLine("\t ContentType: {0}", blob.Properties.ContentType);  
    Console.WriteLine("\t ETag: {0}", blob.Properties.ETag);  
    Console.WriteLine("\t LastModified: {0}", blob.Properties.LastModified);  
    Console.WriteLine("\t Length: {0}", blob.Properties.Length);  
  
    // Write out properties specific to blob type.  
    switch (blob.BlobType)  
    {  
        case BlobType.AppendBlob:  
            CloudAppendBlob appendBlob = blob as CloudAppendBlob;  
            Console.WriteLine("\t AppendBlobCommittedBlockCount: {0}", appendBlob.Properties.AppendBlobCommittedBlockCount);  
            Console.WriteLine("\t StreamWriteSizeInBytes: {0}", appendBlob.StreamWriteSizeInBytes);  
            break;  
        case BlobType.BlockBlob:  
            CloudBlockBlob blockBlob = blob as CloudBlockBlob;  
            Console.WriteLine("\t StreamWriteSizeInBytes: {0}", blockBlob.StreamWriteSizeInBytes);  
            break;  
        case BlobType.PageBlob:  
            CloudPageBlob pageBlob = blob as CloudPageBlob;  
            Console.WriteLine("\t PageBlobSequenceNumber: {0}", pageBlob.Properties.PageBlobSequenceNumber);  
            Console.WriteLine("\t StreamWriteSizeInBytes: {0}", pageBlob.StreamWriteSizeInBytes);  
            break;  
        default:  
            break;  
    }  
  
    Console.WriteLine("\t StreamMinimumReadSizeInBytes: {0}", blob.StreamMinimumReadSizeInBytes);  
    Console.WriteLine();  
  
    // Enumerate the blob's metadata.  
    Console.WriteLine("Blob metadata:");  
    foreach (var metadataItem in blob.Metadata)  
    {  
        Console.WriteLine("\tKey: {0}", metadataItem.Key);  
        Console.WriteLine("\tValue: {0}", metadataItem.Value);  
    }  
  
    Console.WriteLine();  
}  
  
```