---
title: Install Azure Libraries for .NET
description: Import Azure Management Libraries for .NET into your project
keywords: Azure, .NET, SDK, API, NuGet
author: camsoper
ms.author: casoper
manager: douge
ms.date: 04/16/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.service: multiple
ms.assetid:
---

# Install Azure Libraries for .NET

Use the Azure Libraries for .NET to manage, integrate, and consume Azure services in your .NET applications.

* [Packages for managing Azure resources](#mgmt)
* [Packages for integrating Azure services and consuming data](#data)

## Installation

### Visual Studio

If you're using Visual Studio, use the **NuGet Package Manager Console** to import the package into your project.

1. With your Visual Studio solution open, launch the console by clicking **Tools**, followed by **NuGet Packager Manager**, and then click **Package Manager Console**.  

    ![Package Manager Console](media/dotnet-sdk-azure-install/package-manager.png)

2. In the console window, use the **Install-Package** cmdlet to download and install the NuGet package.  For example, to include the latest version of the [Azure Resource Management Library](http://www.nuget.org/packages/Microsoft.Azure.Management.ResourceManager) for .NET:

    ```powershell
    Install-Package Microsoft.Azure.Management.ResourceManager -Pre 
    ``` 
    To use a specific version, include the version number like this:

    ```powershell
    Install-Package Microsoft.Azure.Management.ResourceMananger -Version 1.4.0-preview
    ``` 

### .NET Core

If you're using .NET Core with Visual Studio Code (or any other editor), edit your csproj file to add the package as a **PackageReference** element.  This example uses a specific version of **Microsoft.Azure.Management.ResourceManager**, which is the best practice, but NuGet [floating versions](/nuget/consume-packages/package-references-in-project-files#floating-versions) are also supported.

```xml
<Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>netcoreapp1.1</TargetFramework>
  </PropertyGroup>

  <ItemGroup>
    <PackageReference Include="Microsoft.Azure.Management.ResourceManager" Version="1.4.0-preview" />
  </ItemGroup>

</Project>
```

> [!TIP]
> Previous versions of .NET Core used project.json files instead of csproj.  To learn about mapping project.json to csproj, [see this document](/dotnet/articles/core/tools/project-json-to-csproj).


## Verify your install

After configuring your build tool or IDE, create a new class source file in the location appropriate to your project tooling with the following contents:

```csharp
using System;
using Microsoft.Azure.Management.Fluent;
using Microsoft.Azure.Management.ResourceManager.Fluent.Authentication;

namespace MyApplication
{
    class AzureDotNet
    {
        static void Main(string[] args)
        {
            AzureCredentials credentials = null;

            try
            {
                IAzure azure = Azure.Configure()
                    .Authenticate(credentials)
                    .WithDefaultSubscription();
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
                Console.WriteLine(ex.StackTrace);
            }
        }
    }
}
```

If you're using Visual Studio, the installation of the packages is successful if `IAzure` and `AzureCredentials` resolve (no red highlighting). On the command line for .NET Core, run the code with `dotnet run` and verify that the compile is successful.

## <a id="mgmt" />Azure Management Libraries for .NET

Use these libraries to **manage and provision** Azure resources in your applications.  For example, your application may need to provision virtual machines, modify settings for Azure App Service, or modify resource groups.

> [!TIP]
> [Fluent libraries](https://azure.microsoft.com/blog/simpler-azure-management-libraries-for-net/) improve the developer experience by providing a higher-level, object-oriented API optimized for readability and writability. They clarify what is required vs. optional vs. non-modifiable. These libraries can run side-by-side with non-fluent libraries, so use the fluent packages if you prefer that syntax. [Microsoft.Azure.Management.Fluent](https://www.nuget.org/packages/Microsoft.Azure.Management.Fluent) is a rollup package that contains all of the fluent management libraries.

Service | Fluent package | Standard package
--------|---------------------------|-------------------------
[Analysis Services](/azure/analysis-services/) | | [![Microsoft.Azure.Management.Analysis](https://img.shields.io/nuget/v/Microsoft.Azure.Management.Analysis.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.ApiManagement)
[ApiManagement](/azure/api-management/) | | [![Microsoft.Azure.Management.ApiManagement](https://img.shields.io/nuget/v/Microsoft.Azure.Management.ApiManagement.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.ApiManagement)
[Authorization](/rest/api/authorization) | | [![Microsoft.Azure.Management.Authorization](https://img.shields.io/nuget/v/Microsoft.Azure.Management.Authorization.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.Authorization)
[Automation](/azure/automation/) | | [![Microsoft.Azure.Management.Automation](https://img.shields.io/nuget/v/Microsoft.Azure.Management.Automation.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.Automation)
[Backup](/azure/backup/) | | [![Microsoft.Azure.Management.RecoveryServices.Backup](https://img.shields.io/nuget/v/Microsoft.Azure.Management.RecoveryServices.Backup.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.RecoveryServices.Backup)
[Batch](/azure/batch/) | [![Microsoft.Azure.Management.Batch.Fluent](https://img.shields.io/nuget/v/Microsoft.Azure.Management.Batch.Fluent.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.Batch.Fluent) | [![Microsoft.Azure.Management.Batch](https://img.shields.io/nuget/v/Microsoft.Azure.Management.Batch.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.Batch)
[Billing](/azure/billing/) | | [![Microsoft.Azure.Management.Billing](https://img.shields.io/nuget/v/Microsoft.Azure.Management.Billing.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.Billing)
[CDN](/azure/cdn/) | [![Microsoft.Azure.Management.Cdn.Fluent](https://img.shields.io/nuget/v/Microsoft.Azure.Management.Cdn.Fluent.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.Cdn.Fluent) | [![Microsoft.Azure.Management.Cdn](https://img.shields.io/nuget/v/Microsoft.Azure.Management.Cdn.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.Cdn)
[Cognitive Services](/azure/cognitive-services/) | | [![Microsoft.Azure.Management.CognitiveServices](https://img.shields.io/nuget/v/Microsoft.Azure.Management.CognitiveServices.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.CognitiveServices)
[Commerce](/azure/billing/billing-usage-rate-card-overview) | | [![Microsoft.Azure.Commerce.UsageAggregates](https://img.shields.io/nuget/v/Microsoft.Azure.Commerce.UsageAggregates.svg)](https://www.nuget.org/packages/Microsoft.Azure.Commerce.UsageAggregates)
[Container Registry](/azure/container-registry) | | [![Microsoft.Azure.Management.ContainerRegistry](https://img.shields.io/nuget/v/Microsoft.Azure.Management.ContainerRegistry.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.ContainerRegistry)
[Customer Insights](/dynamics365/customer-insights) | | [![Microsoft.Azure.Management.CustomerInsights](https://img.shields.io/nuget/v/Microsoft.Azure.Management.CustomerInsights.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.CustomerInsights)
[Data Factory](/azure/data-factory/) | | [![Microsoft.Azure.Management.DataFactories](https://img.shields.io/nuget/v/Microsoft.Azure.Management.DataFactories.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.DataFactories)
[Data Lake Analytics](/azure/data-lake-analytics/) | | [![Microsoft.Azure.Management.DataLake.Analytics](https://img.shields.io/nuget/v/Microsoft.Azure.Management.DataLake.Analytics.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.DataLake.Analytics)
[Data Lake Store](/azure/data-lake-store/) | | [![Microsoft.Azure.Management.DataLake.Store](https://img.shields.io/nuget/v/Microsoft.Azure.Management.DataLake.Store.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.DataLake.Store)<br/>[![Microsoft.Azure.Management.DataLake.StoreUploader](https://img.shields.io/nuget/v/Microsoft.Azure.Management.DataLake.StoreUploader.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.DataLake.StoreUploader)
[DevTest Labs](/azure/devtest-lab/) | | [![Microsoft.Azure.Management.DevTestLabs](https://img.shields.io/nuget/v/Microsoft.Azure.Management.DevTestLabs.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.DevTestLabs)
[DNS](/azure/dns/) | [![Microsoft.Azure.Management.Dns.Fluent](https://img.shields.io/nuget/v/Microsoft.Azure.Management.Dns.Fluent.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.Dns.Fluent) | [![Microsoft.Azure.Management.Dns](https://img.shields.io/nuget/v/Microsoft.Azure.Management.Dns.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.Dns)
[Graph](/rest/api/graphrbac) | | [![Microsoft.Azure.Graph.RBAC](https://img.shields.io/nuget/v/Microsoft.Azure.Graph.RBAC.svg)](https://www.nuget.org/packages/Microsoft.Azure.Graph.RBAC)
[HD Insight](/azure/hdinsight/) | | [![Microsoft.Azure.Management.HDInsight](https://img.shields.io/nuget/v/Microsoft.Azure.Management.HDInsight.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.HDInsight)
[Key Vault](/azure/key-vault/) | [![Microsoft.Azure.Management.KeyVault.Fluent](https://img.shields.io/nuget/v/Microsoft.Azure.Management.KeyVault.Fluent.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.KeyVault.Fluent) | [![Microsoft.Azure.Management.KeyVault](https://img.shields.io/nuget/v/Microsoft.Azure.Management.KeyVault.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.KeyVault)
[Log Analytics](/azure/log-analytics/) | | [![Microsoft.Azure.Management.OperationalInsights](https://img.shields.io/nuget/v/Microsoft.Azure.Management.OperationalInsights.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.OperationalInsights)
[Logic Apps](/azure/logic-apps/) | | [![Microsoft.Azure.Management.Logic](https://img.shields.io/nuget/v/Microsoft.Azure.Management.Logic.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.Logic)
[MachineLearning](/azure/machine-learning/) | | [![Microsoft.Azure.Management.MachineLearning](https://img.shields.io/nuget/v/Microsoft.Azure.Management.Logic.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.MachineLearning)
[Media Services](/azure/media-services/) | | [![Microsoft.Azure.Management.Media](https://img.shields.io/nuget/v/Microsoft.Azure.Management.Media.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.Media)
[Monitor](/azure/monitoring-and-diagnostics/) | | [![Microsoft.Azure.Insights](https://img.shields.io/nuget/v/Microsoft.Azure.Management.Insights.svg)](https://www.nuget.org/packages/Microsoft.Azure.Insights)
[Notification Hubs](/azure/notification-hubs/) | | [![Microsoft.Azure.Management.NotificationHubs](https://img.shields.io/nuget/v/Microsoft.Azure.Management.NotificationHubs.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.NotificationHubs)
[PowerBI Embedded](/azure/power-bi-embedded/) | | [![Microsoft.Azure.Management.PowerBIEmbedded](https://img.shields.io/nuget/v/Microsoft.Azure.Management.PowerBIEmbedded.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.PowerBIEmbedded)
[Recovery Services](/azure/site-recovery/) | | [![Microsoft.Azure.Management.RecoveryServices](https://img.shields.io/nuget/v/Microsoft.Azure.Management.RecoveryServices.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.RecoveryServices)
[Redis Cache](/azure/redis-cache/) | [![Microsoft.Azure.Management.Redis.Fluent](https://img.shields.io/nuget/v/Microsoft.Azure.Management.Redis.Fluent.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.Redis.Fluent) | [![Microsoft.Azure.Management.Redis](https://img.shields.io/nuget/v/Microsoft.Azure.Management.Redis.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.Redis)
[Resource Manager](/azure/azure-resource-manager/) | [![Microsoft.Azure.Management.ResourceManager.Fluent](https://img.shields.io/nuget/v/Microsoft.Azure.Management.ResourceManager.Fluent.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.ResourceManager.Fluent) | [![Microsoft.Azure.Management.ResourceManager](https://img.shields.io/nuget/v/Microsoft.Azure.Management.ResourceManager.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.ResourceManager)
[Scheduler](/azure/scheduler/) | | [![Microsoft.Azure.Management.Scheduler](https://img.shields.io/nuget/v/Microsoft.Azure.Management.Scheduler.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.Scheduler)
[Search](/azure/search/) |  | [![Microsoft.Azure.Management.Search](https://img.shields.io/nuget/v/Microsoft.Azure.Management.Search.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.Search)
[Service Bus](/azure/service-bus/) | | [![Microsoft.Azure.Management.ServiceBus](https://img.shields.io/nuget/v/Microsoft.Azure.Management.ServiceBus.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.ServiceBus)
[SQL Database](/azure/sql-database/) | [![Microsoft.Azure.Management.Sql.Fluent](https://img.shields.io/nuget/v/Microsoft.Azure.Management.Sql.Fluent.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.Sql.Fluent) | [![Microsoft.Azure.Management.Sql](https://img.shields.io/nuget/v/Microsoft.Azure.Management.Sql.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.Sql)
[Storage](/azure/storage/) | [![Microsoft.Azure.Management.Storage.Fluent](https://img.shields.io/nuget/v/Microsoft.Azure.Management.Storage.Fluent.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.Storage.Fluent) | [![Microsoft.Azure.Management.Storage](https://img.shields.io/nuget/v/Microsoft.Azure.Management.Storage.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.Storage)<br/>[![Microsoft.Azure.Storage.DataMovement](https://img.shields.io/nuget/v/Microsoft.Azure.Storage.DataMovement.svg)](https://www.nuget.org/packages/Microsoft.Azure.Storage.DataMovement)
[Stream Analytics](/azure/stream-analytics/) | | [![Microsoft.Azure.Management.StreamAnalytics](https://img.shields.io/nuget/v/Microsoft.Azure.Management.StreamAnalytics.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.StreamAnalytics)
[Traffic Manager](/azure/traffic-manager/) | [![Microsoft.Azure.Management.TrafficManager.Fluent](https://img.shields.io/nuget/v/Microsoft.Azure.Management.TrafficManager.Fluent.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.TrafficManager.Fluent) | [![Microsoft.Azure.Management.TrafficManager](https://img.shields.io/nuget/v/Microsoft.Azure.Management.TrafficManager.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.TrafficManager)
[Virtual Machines](/azure/virtual-machines/) | [![Microsoft.Azure.Management.Compute.Fluent](https://img.shields.io/nuget/v/Microsoft.Azure.Management.Compute.Fluent.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.Compute.Fluent)| [![Microsoft.Azure.Management.Compute](https://img.shields.io/nuget/v/Microsoft.Azure.Management.Compute.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.Compute)
[Virtual Network](/azure/virtual-network/) | [![Microsoft.Azure.Management.Network.Fluent](https://img.shields.io/nuget/v/Microsoft.Azure.Management.Network.Fluent.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.Network.Fluent) | [![Microsoft.Azure.Management.Network](https://img.shields.io/nuget/v/Microsoft.Azure.Management.Network.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.Network)
[Web Apps](/azure/app-service-web) | [![Microsoft.Azure.Management.AppService.Fluent](https://img.shields.io/nuget/v/Microsoft.Azure.Management.AppService.Fluent.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.AppService.Fluent) | [![Microsoft.Azure.Management.Websites](https://img.shields.io/nuget/v/Microsoft.Azure.Management.Websites.svg)](https://www.nuget.org/packages/Microsoft.Azure.Management.Websites)

## <a id="data" />Azure Data Libraries for .NET

Use these libraries to **consume and integrate** Azure services in your applications.  For example, your application may need to store documents in DocumentDB, read blobs from Azure Storage, or use SQL Database.

Service | Package  
--------|--------
[Azure Active Directory](/azure/active-directory) | [![Microsoft.IdentityModel.Clients.ActiveDirectory](https://img.shields.io/nuget/v/Microsoft.IdentityModel.Clients.ActiveDirectory.svg)](https://www.nuget.org/packages/Microsoft.IdentityModel.Clients.ActiveDirectory)  
[Batch](/azure/batch/) | [![Azure.Batch](https://img.shields.io/nuget/v/Azure.Batch.svg)](https://www.nuget.org/packages/Azure.Batch) 
[Data Lake Analytics](/azure/data-lake-analytics/) | [![Microsoft.Azure.Management.DataLake.Analytics](https://img.shields.io/nuget/v/Microsoft.Azure.Management.DataLake.Analytics.svg)](http://www.nuget.org/packages/Microsoft.Azure.Management.DataLake.Analytics)
[Data Lake Store](/azure/data-lake-store/) | [![Microsoft.Azure.Management.DataLake.Store](https://img.shields.io/nuget/v/Microsoft.Azure.Management.DataLake.Store.svg)](http://www.nuget.org/packages/Microsoft.Azure.Management.DataLake.Store)
[DocumentDB](/azure/documentdb/) | [![Microsoft.Azure.DocumentDB.Core](https://img.shields.io/nuget/v/Microsoft.Azure.DocumentDB.Core.svg)](https://www.nuget.org/packages/Microsoft.Azure.DocumentDB.Core)  
[Event Hubs](/azure/event-hubs/) | [![Microsoft.Azure.EventHubs](https://img.shields.io/nuget/v/Microsoft.Azure.EventHubs.svg)](https://www.nuget.org/packages/Microsoft.Azure.EventHubs)<br/>[![Microsoft.Azure.EventHubs.Processor](https://img.shields.io/nuget/v/Microsoft.Azure.EventHubs.Processor.svg)](https://www.nuget.org/packages/Microsoft.Azure.EventHubs.Processor)
[HD Insight](/azure/hdinsight/) | [![Microsoft.Azure.Management.HDInsight.Job](https://img.shields.io/nuget/v/Microsoft.Azure.Management.HDInsight.Job.svg)](http://www.nuget.org/packages/Microsoft.Azure.Management.HDInsight.Job) 
[IoT Hub](/azure/iot-hub/)&nbsp;<b>&#42;</b> | [![Microsoft.Azure.Devices](https://img.shields.io/nuget/v/Microsoft.Azure.Devices.svg)](https://www.nuget.org/packages/Microsoft.Azure.Devices)<br/>[![Microsoft.Azure.Devices.Client](https://img.shields.io/nuget/v/Microsoft.Azure.Devices.Client.svg)](https://www.nuget.org/packages/Microsoft.Azure.Devices.Client)
[Key Vault](/azure/key-vault/) | [![Microsoft.Azure.KeyVault](https://img.shields.io/nuget/v/Microsoft.Azure.KeyVault.svg)](https://www.nuget.org/packages/Microsoft.Azure.KeyVault)
[Media Services](/azure/media-services/)&nbsp;<b>&#42;</b> | [![windowsazure.mediaservices.extensions](https://img.shields.io/nuget/v/windowsazure.mediaservices.extensions.svg)](https://www.nuget.org/packages/windowsazure.mediaservices.extensions) 
[Notification Hubs](/azure/notification-hubs/)&nbsp;<b>&#42;</b> | [![Microsoft.Azure.NotificationHubs](https://img.shields.io/nuget/v/Microsoft.Azure.NotificationHubs.svg)](https://www.nuget.org/packages/Microsoft.Azure.NotificationHubs)<br/>[![WindowsAzure.Messaging.Managed](https://img.shields.io/nuget/v/WindowsAzure.Messaging.Managed.svg)](https://www.nuget.org/packages/WindowsAzure.Messaging.Managed) 
[Redis Cache](/azure/redis-cache/) | [![StackExchange.Redis](https://img.shields.io/nuget/v/StackExchange.Redis.svg)](https://www.nuget.org/packages/StackExchange.Redis/)
[Search](/azure/search/)&nbsp;<b>&#42;</b> | [![Microsoft.Azure.Search](https://img.shields.io/nuget/v/Microsoft.Azure.Search.svg)](https://www.nuget.org/packages/Microsoft.Azure.Search) 
[Service Bus](/azure/service-bus/)&nbsp;<b>&#42;</b> | [![WindowsAzure.ServiceBus](https://img.shields.io/nuget/v/WindowsAzure.ServiceBus.svg)](https://www.nuget.org/packages/WindowsAzure.ServiceBus)
[Service Bus Relay](/azure/service-bus-relay/) | [![Microsoft.Azure.Relay](https://img.shields.io/nuget/v/Microsoft.Azure.Relay.svg)](https://www.nuget.org/packages/Microsoft.Azure.Relay)
[Service Fabric](/azure/service-fabric/)&nbsp;<b>&#42;</b> | [![Microsoft.ServiceFabric](https://img.shields.io/nuget/v/Microsoft.ServiceFabric.svg)](https://www.nuget.org/profiles/servicefabric)
[SQL Database](/azure/sql-database/) | [![System.Data.SqlClient](https://img.shields.io/nuget/v/System.Data.SqlClient.svg)](https://www.nuget.org/packages/System.Data.SqlClient/) 
[Storage](/azure/storage/) | [![WindowsAzure.Storage](https://img.shields.io/nuget/v/WindowsAzure.Storage.svg)](http://www.nuget.org/packages/WindowsAzure.Storage) 

\* *- Denotes package is currently incompatible with .NET Core.*

## Next steps

Now that the SDK is ready to use, visit the [get started with the Azure SDK for Java] guide to see it in action.