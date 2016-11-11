---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.GetSharedAccessSignature  
remarks: *content  
---  
  
## Remarks  
 The GetSharedAccessSignature method returns a URI query string containing  a shared access signature (SAS) generated from the specified constraints.  
  
 The SAS constraints may be provided by a stored access policy that is defined for the container and then associated with a SAS. Or, the constraints may be defined ad-hoc on the SAS itself.  
  
 Using a stored access policy is recommended when possible, so that the SAS can be revoked if it is compromised.  
  
 For more information about shared access signatures, see [Delegating Access with a Shared Access Signature](../Topic/Delegating%20Access%20with%20a%20Shared%20Access%20Signature.md) and [Using Shared Access Signatures (SAS)](https://azure.microsoft.com/documentation/articles/storage-dotnet-shared-access-signature-part-1/).  
  
---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.GetSharedAccessSignature  
examples: *content  
---  
  
## Examples  
 This example creates a SAS on a container. If a stored access policy name is provided to the method, it creates a new stored access policy and generates a SAS using that. Otherwise, it creates an ad-hoc SAS.  
  
```c#  
private static string GetContainerSasUri(CloudBlobContainer container, string storedPolicyName = null)  
{  
    string sasContainerToken;  
  
    // If no stored policy is specified, create a new access policy and define its constraints.  
    if (storedPolicyName == null)  
    {  
        // Note that the SharedAccessBlobPolicy class is used both to define the parameters of an ad-hoc SAS, and   
        // to construct a shared access policy that is saved to the container's shared access policies.   
        SharedAccessBlobPolicy adHocPolicy = new SharedAccessBlobPolicy()  
        {  
            // When the start time for the SAS is omitted, the start time is assumed to be the time when the storage service receives the request.   
            // Omitting the start time for a SAS that is effective immediately helps to avoid clock skew.  
            SharedAccessExpiryTime = DateTime.UtcNow.AddHours(24),  
            Permissions = SharedAccessBlobPermissions.Write | SharedAccessBlobPermissions.List  
        };  
  
        // Generate the shared access signature on the container, setting the constraints directly on the signature.  
        sasContainerToken = container.GetSharedAccessSignature(adHocPolicy, null);  
  
        Console.WriteLine("SAS for blob container (ad hoc): {0}", sasContainerToken);  
        Console.WriteLine();  
    }  
    else  
    {  
        // Generate the shared access signature on the container. In this case, all of the constraints for the  
        // shared access signature are specified on the stored access policy, which is provided by name.  
        // It is also possible to specify some constraints on an ad-hoc SAS and others on the stored access policy.  
        sasContainerToken = container.GetSharedAccessSignature(null, storedPolicyName);  
  
        Console.WriteLine("SAS for blob container (stored access policy): {0}", sasContainerToken);  
        Console.WriteLine();  
    }  
  
    // Return the URI string for the container, including the SAS token.  
    return container.Uri + sasContainerToken;  
}  
  
```  
  
 This example tests a SAS URI (a container URI with a SAS token appended) to determine which operations the SAS supports.  
  
```c#  
/// <summary>  
/// Tests a container SAS to determine which operations it allows.  
/// </summary>  
/// <param name="sasUri">A string containing a URI with a SAS appended.</param>  
/// <param name="blobName">A string containing the name of the blob.</param>  
/// <param name="blobContent">A string content content to write to the blob.</param>  
/// <returns>A Task object.</returns>  
private static async Task TestContainerSASAsync(string sasUri, string blobName, string blobContent)  
{  
    // Try performing container operations with the SAS provided.  
    // Note that the storage account credentials are not required here; the SAS provides the necessary  
    // authentication information on the URI.  
  
    // Return a reference to the container using the SAS URI.  
    CloudBlobContainer container = new CloudBlobContainer(new Uri(sasUri));  
  
    // Return a reference to a blob to be created in the container.  
    CloudBlockBlob blob = container.GetBlockBlobReference(blobName);  
  
    // Write operation: Upload a new blob to the container.  
    try  
    {  
        MemoryStream msWrite = new MemoryStream(Encoding.UTF8.GetBytes(blobContent));  
        msWrite.Position = 0;  
        using (msWrite)  
        {  
            await blob.UploadFromStreamAsync(msWrite);  
        }  
  
        Console.WriteLine("Write operation succeeded for SAS {0}", sasUri);  
        Console.WriteLine();  
    }  
    catch (StorageException e)  
    {  
        if (e.RequestInformation.HttpStatusCode == 403)  
        {  
            Console.WriteLine("Write operation failed for SAS {0}", sasUri);  
            Console.WriteLine("Additional error information: " + e.Message);  
            Console.WriteLine();  
        }  
        else  
        {  
            Console.WriteLine(e.Message);  
            Console.ReadLine();  
            throw;  
        }  
    }  
  
    // List operation: List the blobs in the container.  
    try  
    {  
        foreach (ICloudBlob blobItem in container.ListBlobs(  
                                                            prefix: null,   
                                                            useFlatBlobListing: true,   
                                                            blobListingDetails: BlobListingDetails.None,   
                                                            options: null,   
                                                            operationContext: null))  
        {  
            Console.WriteLine(blobItem.Uri);  
        }  
  
        Console.WriteLine("List operation succeeded for SAS {0}", sasUri);  
        Console.WriteLine();  
    }  
    catch (StorageException e)  
    {  
        if (e.RequestInformation.HttpStatusCode == 403)  
        {  
            Console.WriteLine("List operation failed for SAS {0}", sasUri);  
            Console.WriteLine("Additional error information: " + e.Message);  
            Console.WriteLine();  
        }  
        else  
        {  
            Console.WriteLine(e.Message);  
            Console.ReadLine();  
            throw;  
        }  
    }  
  
    // Read operation: Read the contents of the blob we created above.  
    try  
    {  
        MemoryStream msRead = new MemoryStream();  
        msRead.Position = 0;  
        using (msRead)  
        {  
            await blob.DownloadToStreamAsync(msRead);  
            Console.WriteLine(msRead.Length);  
        }  
  
        Console.WriteLine();  
        Console.WriteLine("Read operation succeeded for SAS {0}", sasUri);  
        Console.WriteLine();  
    }  
    catch (StorageException e)  
    {  
        if (e.RequestInformation.HttpStatusCode == 403)  
        {  
            Console.WriteLine("Read operation failed for SAS {0}", sasUri);  
            Console.WriteLine("Additional error information: " + e.Message);  
            Console.WriteLine();  
        }  
        else  
        {  
            Console.WriteLine(e.Message);  
            Console.ReadLine();  
            throw;  
        }  
    }  
  
    Console.WriteLine();  
  
    // Delete operation: Delete the blob we created above.  
    try  
    {  
        await blob.DeleteAsync();  
        Console.WriteLine("Delete operation succeeded for SAS {0}", sasUri);  
        Console.WriteLine();  
    }  
    catch (StorageException e)  
    {  
        if (e.RequestInformation.HttpStatusCode == 403)  
        {  
            Console.WriteLine("Delete operation failed for SAS {0}", sasUri);  
            Console.WriteLine("Additional error information: " + e.Message);  
            Console.WriteLine();  
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