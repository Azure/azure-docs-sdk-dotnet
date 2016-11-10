---
uid: 
remarks: *content
---
---
uid: 
examples: *content
---
## Remarks  
 A root container serves as a default container for your storage account. A blob stored in the root container may be addressed without referencing the root container name, so that a blob can be addressed at the top level of the storage account hierarchy.  
  
 A storage account may have exactly one root container. You must explicitly create the root container and name it **$root**.  
  
 Note that this method does not make a request against Blob storage. So you can return a reference to the root container whether or not it exists.  
  
## Examples  
 This example shows how to get a reference to the root container, and create it if it does not already exist.  
  
```c#  
        async public static Task CreateRootContainer(CloudBlobClient blobClient)  
        {  
            //Get a reference to the root container.  
            CloudBlobContainer container = blobClient.GetRootContainerReference();  
  
            //Create the root container if it does not exist.  
            //Note that the root container must be explicitly created for the storage account.  
            if (await container.CreateIfNotExistsAsync() == true)  
            {  
                Console.WriteLine("Created {0}", container.Name);  
            }  
            else  
            {  
                Console.WriteLine("{0} already exists", container.Name);  
            }  
            Console.WriteLine();  
}  
```