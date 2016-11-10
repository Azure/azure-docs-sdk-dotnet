---
uid: 
remarks: *content
---
---
uid: 
examples: *content
---
## Remarks  
 The DeleteAsync method marks the specified container for deletion. It makes a single delete request to the service, whereas the [Microsoft.WindowsAzure.Storage.Blob](assetId:///N:Microsoft.WindowsAzure.Storage.Blob?qualifyHint=False&autoUpgrade=True) method makes both a read and a delete request.  
  
 The container and any blobs contained within it are later deleted during garbage collection.  
  
 Note that you will not be able to create a new container with the same name for at least 30 seconds after the deletion request is sent, and possibly longer.  
  
 Acquiring a lease on a container ensures that only the client who holds the lease can delete the container. To delete a container with an active lease, specify the lease ID in the [LeaseId](assetId:///P:Microsoft.WindowsAzure.Storage.AccessCondition.LeaseId?qualifyHint=False&autoUpgrade=True) property of an AccessCondition object.  
  
 For additional information about deleting containers, see [Delete Container](../Topic/Delete%20Container.md).  
  
## Examples  
 This example creates a new container and acquires a finite lease on the container, then deletes the leased container.  
  
```c#  
private static async Task AcquireContainerLease(CloudBlobClient blobClient)  
{  
    CloudBlobContainer container = null;  
    AccessCondition condition = null;  
    string leaseId = null;  
  
    try  
    {  
        // Create a new container.  
        container = blobClient.GetContainerReference("leasing-" + Guid.NewGuid());  
        await container.CreateIfNotExistsAsync();  
  
        // Get container's leasing properties to see the available lease.  
        await container.FetchAttributesAsync();  
        PrintContainerLeaseProperties(container);  
  
        // Acquire the lease with a 60-second duration (use null for an infinite lease).  
        leaseId = await container.AcquireLeaseAsync(new TimeSpan(0, 0, 60), leaseId);  
        Console.WriteLine("Lease acquired on container {0}", container.Name);  
  
        // Get container's leasing properties again to see that the container is now leased.  
        await container.FetchAttributesAsync();  
        PrintContainerLeaseProperties(container);  
  
        // Create an access condition using the lease ID, and use it to delete the leased container..  
        condition = new AccessCondition() { LeaseId = leaseId };  
        await container.DeleteAsync(condition, null, null);  
        Console.WriteLine("Deleted container {0}", container.Name);  
        Console.WriteLine();  
    }  
    catch (StorageException e)  
    {  
        Console.WriteLine(e.Message);  
        Console.WriteLine(e.RequestInformation.ExtendedErrorInformation);  
        Console.ReadLine();  
        throw;  
    }  
  
private static void PrintContainerLeaseProperties(CloudBlobContainer container)  
{  
    try  
    {  
        Console.WriteLine();  
        Console.WriteLine("Leasing properties for container: {0}", container.Name);  
        Console.WriteLine("\t Lease state: {0}", container.Properties.LeaseState);  
        Console.WriteLine("\t Lease duration: {0}", container.Properties.LeaseDuration);  
        Console.WriteLine("\t Lease status: {0}", container.Properties.LeaseStatus);  
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