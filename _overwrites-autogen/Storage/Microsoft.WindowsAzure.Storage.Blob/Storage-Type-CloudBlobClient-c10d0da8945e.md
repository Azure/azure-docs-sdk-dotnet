---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobClient  
remarks: *content  
---  
  
## Remarks  
 The Blob service client provides an abstraction for developing against Azure Blob storage. This object serves as an entry point in your code for programming with blobs.  
  
 The Blob service client stores credentials for use in subsequent operations. Valid credentials may be your account name and account key, or a shared access signature (SAS). You may also create a service client for anonymous operations.  
  
 You can use the service client to configure settings on the Blob service itself, such as storage analytics and CORS. The service client may also store other settings for requests against Blob storage. For example, you can specify options on the service client's [DefaultRequestOptions](assetId:///P:Microsoft.WindowsAzure.Storage.Blob.CloudBlobClient.DefaultRequestOptions?qualifyHint=False&autoUpgrade=True) property, such as a default retry policy or server timeout for all Blob service operations that use the service client.  
  
 A simple way to return an instance of a CloudBlobClient object is to create a [CloudStorageAccount](assetId:///T:Microsoft.WindowsAzure.Storage.CloudStorageAccount?qualifyHint=False&autoUpgrade=True) object to represent your account, and then call the [CreateCloudBlobClient](assetId:///M:Microsoft.WindowsAzure.Storage.CloudStorageAccount.CreateCloudBlobClient?qualifyHint=False&autoUpgrade=True) method (shown in the example below). You can also use the CloudBlobClient constructors to create a new instance.  
  
---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobClient  
examples: *content  
---  
  
## Examples  
 Here's an example that parses a connection string from a configuration file (such as app.config or web.config) to create a [CloudStorageAccount](assetId:///T:Microsoft.WindowsAzure.Storage.CloudStorageAccount?qualifyHint=False&autoUpgrade=True) object, then calls [CreateCloudBlobClient](assetId:///M:Microsoft.WindowsAzure.Storage.CloudStorageAccount.CreateCloudBlobClient?qualifyHint=False&autoUpgrade=True) to create the service client. This example uses the [Microsoft Azure Configuration Manager](https://www.nuget.org/packages/Microsoft.WindowsAzure.ConfigurationManager/); to try it, you'll need to install that package from NuGet, and add a using statement to your code.  
  
```c#  
CloudStorageAccount storageAccount;  
  
try  
{  
    // Use the Azure CloudConfigurationManager class to return a named connection string from a config file.   
    storageAccount = CloudStorageAccount.Parse(CloudConfigurationManager.GetSetting("StorageConnectionString"));  
}  
catch (StorageException e)  
{  
    Console.WriteLine(e.Message);  
    Console.ReadLine();  
    throw;  
}  
  
// Create service client for credentialed access to the Blob service.  
CloudBlobClient blobClient = storageAccount.CreateCloudBlobClient();  
```  
  
 In the example above, the connection string may use Shared Key authentication, or a shared access signature (SAS). For more information on connection strings for Azure Storage, see [Configure Azure Storage Connection Strings](https://azure.microsoft.com/documentation/articles/storage-configure-connection-string/).