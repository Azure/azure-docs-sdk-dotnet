---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobClient.SetServicePropertiesAsync  
remarks: *content  
---  
  
## Remarks  
 The service properties for Blob storage include properties for configuring storage analytics (logging and metrics), the default service version to use for executing anonymous requests,  and CORS rules. All of these properties are set and read at the level of the Blob service client.  
  
---  
uid: Microsoft.WindowsAzure.Storage.Blob.CloudBlobClient.SetServicePropertiesAsync  
examples: *content  
---  
  
## Examples  
 The following code example shows how to configure storage analytics for the Blob service. To run this code example, you'll need to include a `using` statement referencing the `Microsoft.WindowsAzure.Storage.Shared.Protocol` namespace, as well as the `Microsoft.WindowsAzure.Storage.Blob` namespace.  
  
> [!CAUTION]
>  If you run this code on your own storage account, you may want to save your current service property settings and restore them once you are finished with the code example. Otherwise, this code will overwrite your current settings.  
  
```c#  
private static async Task ConfigureBlobAnalytics(CloudBlobClient blobClient)  
{  
    try  
    {  
        // Get current service property settings.  
        ServiceProperties serviceProperties = await blobClient.GetServicePropertiesAsync();  
  
        // Enable analytics logging and set retention policy to 14 days.   
        serviceProperties.Logging.LoggingOperations = LoggingOperations.All;  
        serviceProperties.Logging.RetentionDays = 14;  
        serviceProperties.Logging.Version = "1.0";  
  
        // Configure service properties for hourly and minute metrics.   
        // Set retention policy to 7 days.  
        serviceProperties.HourMetrics.MetricsLevel = MetricsLevel.ServiceAndApi;  
        serviceProperties.HourMetrics.RetentionDays = 7;  
        serviceProperties.HourMetrics.Version = "1.0";  
  
        serviceProperties.MinuteMetrics.MetricsLevel = MetricsLevel.ServiceAndApi;  
        serviceProperties.MinuteMetrics.RetentionDays = 7;  
        serviceProperties.MinuteMetrics.Version = "1.0";  
  
        // Set the default service version to be used for anonymous requests.  
        serviceProperties.DefaultServiceVersion = "2015-04-05";  
  
        // Set the service properties.  
        await blobClient.SetServicePropertiesAsync(serviceProperties);              
    }  
    catch (StorageException e)  
    {  
        Console.WriteLine(e.Message);  
        Console.ReadLine();  
        throw;  
    }  
}  
  
```