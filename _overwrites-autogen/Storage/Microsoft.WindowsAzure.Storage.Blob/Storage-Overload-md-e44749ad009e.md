---
uid: 
remarks: *content
---
---
uid: 
examples: *content
---
## Remarks  
 Releasing a lease allows another client to immediately acquire the lease for the container as soon as the release is complete. To release a lease, the lease ID specified on the request must match the lease ID on the container.  
  
 A lease that has been broken can also be released. A client can immediately acquire a container lease that has been released, even if the lease break interval has not yet expired.  
  
 For detailed information about container leases, see [Lease Container](../Topic/Lease%20Container.md).  
  
## Examples  
 This example creates a new container and acquires a finite lease on it, then releases the lease before the lease duration has elapsed.  
  
```c#  
private static async Task ReleaseContainerLease(CloudBlobClient blobClient)  
{  
    CloudBlobContainer container = null;  
    AccessCondition condition = null;  
    string leaseId = null;  
  
    try  
    {  
        // Create a new container.  
        container = blobClient.GetContainerReference("leasing-" + Guid.NewGuid());  
        await container.CreateIfNotExistsAsync();  
  
        // Acquire a lease with a duration of 60 seconds.  
        leaseId = await container.AcquireLeaseAsync(new TimeSpan(0, 0, 15), null);  
  
        // Sleep for 5 seconds.  
        Console.WriteLine("Waiting 5 seconds into lease interval.");  
        System.Threading.Thread.Sleep(new TimeSpan(0, 0, 5));  
  
        // Get container's leasing properties to see that the container is leased.  
        await container.FetchAttributesAsync();  
        PrintContainerLeaseProperties(container);  
  
        // Release the lease for another client to acquire.  
        condition = new AccessCondition() { LeaseId = leaseId };  
        await container.ReleaseLeaseAsync(condition);  
  
        // Get container's leasing properties to see that the container is no longer leased.  
        await container.FetchAttributesAsync();  
        PrintContainerLeaseProperties(container);  
    }  
    catch (StorageException e)  
    {  
        Console.WriteLine(e.Message);  
        Console.ReadLine();  
        throw;  
    }  
    finally  
    {  
        // Delete the container to clean up.  
        await container.DeleteAsync();  
        Console.WriteLine("Deleted container {0}", container.Name);  
        Console.WriteLine();  
    }  
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