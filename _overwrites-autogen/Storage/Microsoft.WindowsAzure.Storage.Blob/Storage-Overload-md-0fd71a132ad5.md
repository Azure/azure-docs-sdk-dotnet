---
uid: 
remarks: *content
---
---
uid: 
examples: *content
---
## Remarks  
 The AcquireLeaseAsync method aqcuires a lease on the container and returns a lease ID. The client may specify a lease ID when calling the method; otherwise a lease ID will be assigned by the service. The duration of a lease may be 15 to 60 seconds, or it may be infinite (if the duration is set to null).  
  
 A lease on a container provides exclusive delete access to the container for the client that holds the lease ID. By leasing a container, you can ensure that only one client can attempt to delete it at any given time. The lease only restricts container deletion; other operations on the container can proceed without the lease ID.  
  
 If a client attempts to delete the container without the lease ID, the request fails with error code 412 (Precondition Failed).  
  
 For detailed information about container leases, see [Lease Container](../Topic/Lease%20Container.md).  
  
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