---
uid: 
remarks: *content
---
---
uid: 
examples: *content
---
## Remarks  
 A lease can be renewed before or after it expires. Renewing the lease after it has expired will fail if another client has leased the container in the meantime. When the lease is renewed, the lease duration clock resets.  
  
 A lease cannot be renewed after it is broken.  
  
 For detailed information about container leases, see [Lease Container](../Topic/Lease%20Container.md).  
  
## Examples  
 This example allows a lease to expire, then renews the lease. Once the lease has been renewed, it is used to delete the container.  
  
```c#  
private static async Task RenewContainerLease(CloudBlobClient blobClient)  
        {  
            CloudBlobContainer container = null;  
            AccessCondition condition = null;  
            string leaseId = null;  
  
            try  
            {  
                // Create a new container.  
                container = blobClient.GetContainerReference("leasing-" + Guid.NewGuid());  
                await container.CreateIfNotExistsAsync();  
  
                // Acquire a lease with a duration of 15 seconds.  
                leaseId = await container.AcquireLeaseAsync(new TimeSpan(0, 0, 15), null);  
  
                // Sleep for 16 seconds to allow lease to expire.  
                Console.WriteLine("Waiting 16 seconds for lease break interval to expire....");  
                System.Threading.Thread.Sleep(new TimeSpan(0, 0, 16));  
  
                // Get container's leasing properties to see that the lease has expired.  
                await container.FetchAttributesAsync();  
                PrintContainerLeaseProperties(container);  
  
                // Renew the lease using the lease ID. The lease is renewed for the original lease interval (15 seconds).  
                condition = new AccessCondition() { LeaseId = leaseId };  
                await container.RenewLeaseAsync(condition);  
            }  
            catch (StorageException e)  
            {  
                Console.WriteLine(e.Message);  
                Console.ReadLine();  
                throw;  
            }  
            finally  
            {  
                // Delete the leased container using the lease ID.  
                await container.DeleteAsync(condition, null, null);  
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