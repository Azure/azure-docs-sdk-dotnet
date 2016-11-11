---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.BreakLeaseAsync  
remarks: *content  
---  
  
## Remarks  
 This method breaks an active lease on a container. The lease ID is not required to break the lease.  
  
 When you break a lease, there may be an interval before the lease is broken, during which only BreakLeaseAsync or [ReleaseLeaseAsync](assetId:///Overload:Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.ReleaseLeaseAsync?qualifyHint=False&autoUpgrade=True) may be called on the leased container.  
  
 For a finite lease, you can manage the break interval as follows:  
  
-   You can permit the default lease break interval to expire, by passing null to the BreakLeaseAsync method. The lease break interval in this case is the duration of the lease minus the elapsed period. During this period, the lease state is set to `Breaking`. Once the interval expires, the lease state is set to `Broken`.  
  
-   You can specify a custom break interval of 0 to 60 seconds, by passing a new `TimeSpan` value to the BreakLeaseAsync method.  This break period is only used if it is shorter than the time remaining on the lease. If longer, the time remaining on the lease is used.  
  
     If the specified break interval is 0, then the lease is broken immediately.  
  
 For an infinite lease, if the break interval is null, then the lease breaks immediately. If a custom break interval is specified, then that interval elapses before the lease breaks.  
  
 For detailed information about container leases, see [Lease Container](../Topic/Lease%20Container.md).  
  
---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.BreakLeaseAsync  
examples: *content  
---  
  
## Examples  
 This example breaks the container lease, allowing the break interval to be the remainder of the lease. While the lease is being broken, the container can be deleted by passing the lease ID.  
  
```c#  
private static async Task BreakContainerLeaseWithInterval(CloudBlobClient blobClient)  
{  
    CloudBlobContainer container = null;  
    AccessCondition condition = null;  
    string leaseId = null;  
  
    try  
    {  
        // Create a new container.  
        container = blobClient.GetContainerReference("leasing-" + Guid.NewGuid());  
        await container.CreateIfNotExistsAsync();  
  
        // Acquire the lease with a 60-second duration.  
        leaseId = await container.AcquireLeaseAsync(new TimeSpan(0, 0, 60), null);  
  
        // Break the lease. Passing null indicates that the break interval will be   
        // the remainder of the current lease (i.e., 60 seconds minus the elapsed interval).  
        TimeSpan breakInterval = await container.BreakLeaseAsync(null);  
        Console.WriteLine("Lease is breaking on container {0}", container.Name);  
        Console.WriteLine("Lease break interval: {0}", breakInterval.ToString());  
  
        // Get container properties to see the breaking lease.  
        // The lease break interval has not yet elapsed.  
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
        // Delete the container. If the lease is breaking, the container can be deleted by  
        // passing the lease ID.   
        await container.FetchAttributesAsync();  
        if (container.Properties.LeaseState == LeaseState.Breaking)  
        {   
            condition = new AccessCondition() { LeaseId = leaseId };  
            await container.DeleteAsync(condition, null, null);  
        }  
        else  
        {  
            await container.DeleteAsync();  
        }  
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
  
 This example breaks the container lease immediately. Once the lease is broken, the container is no longer leased, so it can be deleted without the lease ID.  
  
```c#  
private static async Task BreakContainerLeaseImmediately(CloudBlobClient blobClient)  
{  
    CloudBlobContainer container = null;  
    string leaseId = null;  
  
    try  
    {  
        // Create a new container.  
        container = blobClient.GetContainerReference("leasing-" + Guid.NewGuid());  
        await container.CreateIfNotExistsAsync();  
  
        // Acquire the lease with a 60-second duration.  
        leaseId = await container.AcquireLeaseAsync(new TimeSpan(0, 0, 60), null);  
  
        // Break the lease. Passing zero breaks the lease immediately.  
        await container.BreakLeaseAsync(new TimeSpan(0));  
        Console.WriteLine("Lease is broken on container {0}", container.Name);  
  
        // Get container properties to see that the lease is broken.  
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
        // Delete the container.   
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