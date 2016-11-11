---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.SetPermissionsAsync  
remarks: *content  
---  
  
## Remarks  
 The SetPermissionsAsync method sets the container's permissions. Permissions on a container include:  
  
-   The container's public access setting, if any.  
  
-   Any shared access policies that you have defined for the container. A shared access policy optionally provides parameters for shared access signatures (SAS) on the container or its blobs.  
  
> [!NOTE]
>  Note that setting permissions on a container overwrites any existing permissions settings. In order to preserve the container's permissions, it's recommended that you retrieve the container's permissions, modify the permissions as desired, and then set the container's permissions, as shown in the examples below.  
  
 For more details about retrieving container permissions, see [Set Container ACL](../Topic/Set%20Container%20ACL.md).  
  
---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobContainer.SetPermissionsAsync  
examples: *content  
---  
  
## Examples  
 This example gets the current permissions for the container, and then sets the container's public access level to Container. At this level, anonymous clients can read container properties and metadata, list blobs, and read blobs in the container.  
  
```c#  
private static async Task SetAnonymousAccessLevelAsync(CloudBlobContainer container, BlobContainerPublicAccessType accessType)  
{  
    try  
    {  
        // Read the existing permissions first so that we have all container permissions.   
        // This ensures that we do not inadvertently remove any shared access policies while setting the public access level.  
        BlobContainerPermissions permissions = await container.GetPermissionsAsync();  
  
        // Set the container's public access level.  
        permissions.PublicAccess = BlobContainerPublicAccessType.Container;  
        await container.SetPermissionsAsync(permissions);  
  
        Console.WriteLine("Container public access set to {0}", accessType.ToString());  
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
  
 This example creates a shared access policy on a container and adds it to the container's existing permissions. A shared access signature (SAS) can use the shared access policy to specify its parameters.  
  
```c#  
private static async Task CreateSharedAccessPolicyAsync(CloudBlobContainer container, string policyName)  
{  
    // Create a new shared access policy and define its constraints.  
    // The access policy provides create, write, read, list, and delete permissions.  
    SharedAccessBlobPolicy sharedPolicy = new SharedAccessBlobPolicy()  
    {  
        // When the start time for the SAS is omitted, the start time is assumed to be the time when the storage service receives the request.   
        // Omitting the start time for a SAS that is effective immediately helps to avoid clock skew.  
        SharedAccessExpiryTime = DateTime.UtcNow.AddHours(24),  
        Permissions = SharedAccessBlobPermissions.Read | SharedAccessBlobPermissions.List |  
            SharedAccessBlobPermissions.Write | SharedAccessBlobPermissions.Create | SharedAccessBlobPermissions.Delete  
    };  
  
    // Get the container's existing permissions.  
    BlobContainerPermissions permissions = await container.GetPermissionsAsync();  
  
    // Add the new policy to the container's permissions, and set the container's permissions.  
    permissions.SharedAccessPolicies.Add(policyName, sharedPolicy);  
    await container.SetPermissionsAsync(permissions);  
}  
  
```