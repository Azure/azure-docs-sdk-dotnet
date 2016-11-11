---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlob.Properties  
remarks: *content  
---  
  
## Remarks  
 The Properties property returns system properties for a blob. System properties are stored on the service and must be retrieved via a request to the service. System  properties are defined in the [Microsoft.WindowsAzure.Storage.Blob.BlobProperties](assetId:///T:Microsoft.WindowsAzure.Storage.Blob.BlobProperties?qualifyHint=False&autoUpgrade=True) class.  
  
> [!NOTE]
>  To retrieve the blob's system properties, call [FetchAttributesAsync](assetId:///Overload:Microsoft.WindowsAzure.Storage.Blob.CloudBlob.FetchAttributesAsync?qualifyHint=False&autoUpgrade=True) before checking the property values. FetchAttributesAsync makes a request against the service to retrieve the most up-to-date values for system properties.  
  
---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlob.Properties  
examples: *content  
---  
  
## Examples  
 This example prints properties and metadata values for a blob to the console window, including the blob's system properties.  
  
```  
private static void PrintBlobPropertiesAndMetadata(CloudBlob blob)  
{  
    // Write out properties that are common to all blob types.  
    Console.WriteLine();  
    Console.WriteLine("-----Blob Properties-----");  
    Console.WriteLine("\t Name: {0}", blob.Name);  
    Console.WriteLine("\t URI: {0}", blob.Uri);  
    Console.WriteLine("\t BlobType: {0}", blob.Properties.BlobType);  
    Console.WriteLine("\t Container: {0}", blob.Container.Name);  
  
    // Print out the blob's parent directory, if it has one.  
    if(blob.Parent.Prefix != string.Empty)  
    {   
        Console.WriteLine("\t Parent: {0}", blob.Parent.Prefix);  
    }  
  
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