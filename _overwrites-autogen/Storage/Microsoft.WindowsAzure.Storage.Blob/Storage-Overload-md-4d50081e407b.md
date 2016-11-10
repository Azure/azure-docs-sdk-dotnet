---
uid: 
examples: *content
---
## Examples  
 This code example gets a shared access signature (SAS) for a block blob, either as an ad-hoc SAS, or by using a stored access policy. If no stored access policy is specified, an ad-hoc SAS is created.  
  
```c#  
private static string GetBlobSasUri(CloudBlobContainer container, string blobName, string policyName = null)  
{  
    string sasBlobToken;  
  
    // Get a reference to a blob within the container.  
    // Note that the blob may not exist yet, but a SAS can still be created for it.  
    CloudBlockBlob blob = container.GetBlockBlobReference(blobName);  
  
    if (policyName == null)  
    {  
        // Create a new access policy and define its constraints.  
        // Note that the SharedAccessBlobPolicy class is used both to define the parameters of an ad-hoc SAS, and   
        // to construct a shared access policy that is saved to the container's shared access policies.   
        SharedAccessBlobPolicy adHocSAS = new SharedAccessBlobPolicy()  
        {  
            // When the start time for the SAS is omitted, the start time is assumed to be the time when the storage service receives the request.   
            // Omitting the start time for a SAS that is effective immediately helps to avoid clock skew.  
            SharedAccessExpiryTime = DateTime.UtcNow.AddHours(24),  
            Permissions = SharedAccessBlobPermissions.Read | SharedAccessBlobPermissions.Write | SharedAccessBlobPermissions.Create  
        };  
  
        // Generate the shared access signature on the blob, setting the constraints directly on the signature.  
        sasBlobToken = blob.GetSharedAccessSignature(adHocSAS);  
  
        Console.WriteLine("SAS for blob (ad hoc): {0}", sasBlobToken);  
        Console.WriteLine();  
    }  
    else  
    {  
        // Generate the shared access signature on the blob. In this case, all of the constraints for the  
        // shared access signature are specified on the container's stored access policy.  
        sasBlobToken = blob.GetSharedAccessSignature(null, policyName);  
  
        Console.WriteLine("SAS for blob (stored access policy): {0}", sasBlobToken);  
        Console.WriteLine();  
    }  
  
    // Return the URI string for the container, including the SAS token.  
    return blob.Uri + sasBlobToken;  
}  
  
```  
  
 This code example tests a SAS URI, to see what operations it supports. To call it, pass in the full SAS URI (the resource URI plus the SAS token).  
  
```c#  
private static async Task TestBlobSASAsync(string sasUri, string blobContent)  
{  
    // Try performing blob operations using the SAS provided.  
  
    // Return a reference to the blob using the SAS URI.  
    CloudBlockBlob blob = new CloudBlockBlob(new Uri(sasUri));  
  
    // Create operation: Upload a blob with the specified name to the container.  
    // If the blob does not exist, it will be created. If it does exist, it will be overwritten.  
    try  
    {  
        MemoryStream msWrite = new MemoryStream(Encoding.UTF8.GetBytes(blobContent));  
        msWrite.Position = 0;  
        using (msWrite)  
        {  
            await blob.UploadFromStreamAsync(msWrite);  
        }  
  
        Console.WriteLine("Create operation succeeded for SAS {0}", sasUri);  
        Console.WriteLine();  
    }  
    catch (StorageException e)  
    {  
        if (e.RequestInformation.HttpStatusCode == 403)  
        {  
            Console.WriteLine("Create operation failed for SAS {0}", sasUri);  
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
  
    // Write operation: Add metadata to the blob  
    try  
    {  
        await blob.FetchAttributesAsync();  
        string rnd = new Random().Next().ToString();  
        string metadataName = "name";  
        string metadataValue = "value";  
        blob.Metadata.Add(metadataName, metadataValue);  
        await blob.SetMetadataAsync();  
  
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
  
    // Read operation: Read the contents of the blob.  
    try  
    {  
        MemoryStream msRead = new MemoryStream();  
        using (msRead)  
        {  
            await blob.DownloadToStreamAsync(msRead);  
            msRead.Position = 0;  
            using (StreamReader reader = new StreamReader(msRead, true))  
            {  
                string line;  
                while ((line = reader.ReadLine()) != null)  
                {  
                    Console.WriteLine(line);  
                }  
            }  
  
            Console.WriteLine();  
        }  
  
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
  
    // Delete operation: Delete the blob.  
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
}  
  
```