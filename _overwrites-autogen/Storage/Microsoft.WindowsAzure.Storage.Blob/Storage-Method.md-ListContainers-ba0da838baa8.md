---
uid: 
remarks: *content
---
---
uid: 
examples: *content
---
## Remarks  
  
> [!NOTE]
>  [!INCLUDE[azure-storage-async-alert](../Token/azure-storage-async-alert_md.md)]  
>   
>  The analogous method that uses Async/Await is [Microsoft.WindowsAzure.Storage.Blob](assetId:///N:Microsoft.WindowsAzure.Storage.Blob?qualifyHint=False&autoUpgrade=True).  
  
## Examples  
 The code example below demonstrates a synchronous operation to list all containers in the storage account. This method returns all containers in the storage account, or the subset of containers that begin with a specified prefix.  
  
```c#  
private static void ListAllContainers(CloudBlobClient blobClient, string prefix)  
{  
    // List all containers in this storage account.  
    Console.WriteLine("List all containers in account:");  
  
    try  
    {  
        // List containers beginning with the specified prefix, and without returning container metadata.  
        foreach (var container in blobClient.ListContainers(prefix, ContainerListingDetails.None, null, null))  
        {  
            Console.WriteLine("\tContainer:" + container.Name);  
        }  
  
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