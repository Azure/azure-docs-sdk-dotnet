---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.ChangeLeaseAsync  
remarks: *content  
---  
  
## Remarks  
 This method changes the lease ID on a leased container. To change the lease ID, the client must possess the current lease ID. The current lease ID provided by the client is checked against the container's lease ID on the service to ensure that the two match before the operation proceeds. Specify the current lease ID in the [LeaseId](assetId:///P:Microsoft.WindowsAzure.Storage.AccessCondition.LeaseId?qualifyHint=False&autoUpgrade=True) property of an AccessCondition object.  
  
 For detailed information about container leases, see [Lease Container](../Topic/Lease%20Container.md).  
  
---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.ChangeLeaseAsync  
examples: *content  
---  
  
## Examples  
 This example creates a new container, then acquires an infinite lease on the container. The example then changes the lease ID for the active lease. The new lease ID is used to delete the container.  
  
```c#  
private static async Task ChangeContainerLeaseID(CloudBlobClient blobClient)  
        {  
            CloudBlobContainer container = null;  
            AccessCondition condition = null;  
            string originalLeaseId = null;  
            string newLeaseId = null;  
  
            try  
            {  
                // Create a new container.  
                container = blobClient.GetContainerReference("leasing-" + Guid.NewGuid());  
                await container.CreateIfNotExistsAsync();  
  
                // Acquire an infinite lease on the container, and get the lease ID.  
                originalLeaseId = await container.AcquireLeaseAsync(null, null);  
  
                // Print the container's leasing properties.  
                await container.FetchAttributesAsync();  
                PrintContainerLeaseProperties(container);  
  
                // Specify the access condition that ensures that the specified lease ID   
                // matches the lease ID on the container.  
                condition = new AccessCondition() { LeaseId = originalLeaseId };  
  
                // Change the lease ID.  
                newLeaseId = await container.ChangeLeaseAsync(Guid.NewGuid().ToString(), condition);  
                Console.WriteLine("Changed lease ID for container {0} from {1} to {2}", container.Name, originalLeaseId, newLeaseId);  
                Console.WriteLine();  
            }  
            catch (StorageException e)  
            {  
                Console.WriteLine(e.Message);  
                Console.ReadLine();  
                throw;  
            }  
            finally  
            {  
                // Delete the container using the new lease ID.  
                condition = new AccessCondition() { LeaseId = newLeaseId };  
                await container.DeleteAsync(condition, null, null);  
                Console.WriteLine("Deleted container: {0}", container.Name);  
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