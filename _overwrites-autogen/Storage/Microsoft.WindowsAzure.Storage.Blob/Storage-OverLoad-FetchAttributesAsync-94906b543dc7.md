---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.FetchAttributesAsync  
remarks: *content  
---  
  
## Remarks  
 The FetchAttributesAsync method gets the container's metadata and system properties from the service.  
  
 Call this method before reading the container's metadata (via the [Metadata](assetId:///P:Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.Metadata?qualifyHint=False&autoUpgrade=True) property), and before reading the container's system properties (via the [Properties](assetId:///P:Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.Properties?qualifyHint=False&autoUpgrade=True) property).  
  
 If the state of the container changes while your code is running, you'll need to call FetchAttributesAsync again to return the updated properties. For example, if you acquire, break, change, release, or renew a lease, the container's [LeaseDuration](assetId:///P:Microsoft.WindowsAzure.Storage.Blob.BlobContainerProperties.LeaseDuration?qualifyHint=False&autoUpgrade=True), [LeaseState](assetId:///P:Microsoft.WindowsAzure.Storage.Blob.BlobContainerProperties.LeaseState?qualifyHint=False&autoUpgrade=True), and [Overload:Microsoft.WindowsAzure.Storage.Blob.BlobContainerProperties.LeaseStatus](assetId:///Overload:Microsoft.WindowsAzure.Storage.Blob.BlobContainerProperties.LeaseStatus?qualifyHint=False&autoUpgrade=True) properties are updated by the service, and you'll need to call FetchAttributesAsync again to get the latest values.  
  
 Note that the [ListContainersSegmentedAsync](assetId:///Overload:Microsoft.WindowsAzure.Storage.Blob.CloudBlobClient.ListContainersSegmentedAsync?qualifyHint=False&autoUpgrade=True) method includes an option to retrieve container metadata. If you specify this option, you do not need to call FetchAttributesAsync on each container enumerated in order to read its metadata.  
  
---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.FetchAttributesAsync  
examples: *content  
---  
  
## Examples  
 This example calls FetchAttributesAsync to retrieve the container's  system properties, then prints out the values of the container's lease-related properties, before the lease is acquired. It then acquires a lease on a container, calls FetchAttributesAsync again, and prints out the values of the container's lease-related properties after the lease has been acquired.  
  
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