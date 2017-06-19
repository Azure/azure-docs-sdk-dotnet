---
title: Install Azure libraries for .NET
description: Import Azure Management Libraries for .NET into your project
keywords: Azure, .NET, SDK, API, NuGet
author: camsoper
ms.author: casoper
manager: douge
ms.date: 06/20/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.service: multiple
ms.assetid:
---

# Azure libraries for .NET

Use the Azure libraries for .NET to manage, integrate, and consume Azure services in your .NET applications.

* [Packages for managing Azure resources](#mgmt)
* [Packages for integrating Azure services and consuming data](#data)

## Installation

### Visual Studio

If you're using Visual Studio, use the **NuGet Package Manager Console** to import the package into your project.

1. With your Visual Studio solution open, launch the console by clicking **Tools**, followed by **NuGet Packager Manager**, and then click **Package Manager Console**.  

    ![Package Manager Console](media/dotnet-sdk-azure-install/package-manager.png)

2. In the console window, use the **Install-Package** cmdlet to download and install the NuGet package.  For example, to include the latest version of the fluent [Microsoft Azure Management Client Library](http://www.nuget.org/packages/Microsoft.Azure.Management.Fluent) for .NET:

    ```powershell
    Install-Package Microsoft.Azure.Management.Fluent
    ``` 
    To use a specific version, include the version number like this:

    ```powershell
    Install-Package Microsoft.Azure.Management.Fluent -Version 1.0.0
    ``` 

### Command line

If you're using .NET Core with Visual Studio Code (or any other editor), use the `dotnet add package` command.  The following will include the latest version of the fluent [Microsoft Azure Management Client Library](http://www.nuget.org/packages/Microsoft.Azure.Management.Fluent) for .NET:

```bash
dotnet add package Microsoft.Azure.Management.Fluent
```
To use a specific version, include the version number like this:

```bash
dotnet add package Microsoft.Azure.Management.Fluent -v 1.0.0
```

## <a id="mgmt"></a>Azure Management Libraries for .NET

Use these libraries to **manage and provision** Azure resources in your applications.  For example, your application may need to provision virtual machines, modify settings for Azure App Service, or modify resource groups.

> [!TIP]
> [Fluent libraries](https://azure.microsoft.com/blog/simpler-azure-management-libraries-for-net/) improve the developer experience by providing a higher-level, object-oriented API optimized for readability and writability. They clarify what is required vs. optional vs. non-modifiable. These libraries can run side-by-side with non-fluent libraries, so use the fluent packages if you prefer that syntax. [Microsoft.Azure.Management.Fluent](https://www.nuget.org/packages/Microsoft.Azure.Management.Fluent) is a rollup package that contains all of the fluent management libraries.

Service | Package
--------|---------
All fluent libraries | [Microsoft.Azure.Management.Fluent](https://www.nuget.org/packages/Microsoft.Azure.Management.Fluent)
[Analysis Services](/azure/analysis-services/) | [Microsoft.Azure.Management.Analysis](https://www.nuget.org/packages/Microsoft.Azure.Management.Analysis)
[ApiManagement](/azure/api-management/) | [Microsoft.Azure.Management.ApiManagement](https://www.nuget.org/packages/Microsoft.Azure.Management.ApiManagement)
[Authorization](/rest/api/authorization) | [Microsoft.Azure.Management.Authorization](https://www.nuget.org/packages/Microsoft.Azure.Management.Authorization)
[Automation](/azure/automation/) | [Microsoft.Azure.Management.Automation](https://www.nuget.org/packages/Microsoft.Azure.Management.Automation)
[Backup](/azure/backup/) | [Microsoft.Azure.Management.RecoveryServices.Backup](https://www.nuget.org/packages/Microsoft.Azure.Management.RecoveryServices.Backup)
[Batch](/azure/batch/) | [Microsoft.Azure.Management.Batch.Fluent](https://www.nuget.org/packages/Microsoft.Azure.Management.Batch.Fluent)<br />[Microsoft.Azure.Management.Batch](https://www.nuget.org/packages/Microsoft.Azure.Management.Batch)
[Billing](/azure/billing/) | [Microsoft.Azure.Management.Billing](https://www.nuget.org/packages/Microsoft.Azure.Management.Billing)
[CDN](/azure/cdn/) | [Microsoft.Azure.Management.Cdn.Fluent](https://www.nuget.org/packages/Microsoft.Azure.Management.Cdn.Fluent)<br/>[Microsoft.Azure.Management.Cdn](https://www.nuget.org/packages/Microsoft.Azure.Management.Cdn)
[Cognitive Services](/azure/cognitive-services/) | [Microsoft.Azure.Management.CognitiveServices](https://www.nuget.org/packages/Microsoft.Azure.Management.CognitiveServices)
[Commerce](/azure/billing/billing-usage-rate-card-overview) | [Microsoft.Azure.Commerce.UsageAggregates](https://www.nuget.org/packages/Microsoft.Azure.Commerce.UsageAggregates)
[Container Registry](/azure/container-registry) | [Microsoft.Azure.Management.ContainerRegistry](https://www.nuget.org/packages/Microsoft.Azure.Management.ContainerRegistry)
[Customer Insights](/dynamics365/customer-insights) | [Microsoft.Azure.Management.CustomerInsights](https://www.nuget.org/packages/Microsoft.Azure.Management.CustomerInsights)
[Data Factory](/azure/data-factory/) | [Microsoft.Azure.Management.DataFactories](https://www.nuget.org/packages/Microsoft.Azure.Management.DataFactories)
[Data Lake Analytics](/azure/data-lake-analytics/) | [Microsoft.Azure.Management.DataLake.Analytics](https://www.nuget.org/packages/Microsoft.Azure.Management.DataLake.Analytics)
[Data Lake Store](/azure/data-lake-store/) | [Microsoft.Azure.Management.DataLake.Store](https://www.nuget.org/packages/Microsoft.Azure.Management.DataLake.Store)<br/>[Microsoft.Azure.Management.DataLake.StoreUploader](https://www.nuget.org/packages/Microsoft.Azure.Management.DataLake.StoreUploader)
[DevTest Labs](/azure/devtest-lab/) | [Microsoft.Azure.Management.DevTestLabs](https://www.nuget.org/packages/Microsoft.Azure.Management.DevTestLabs)
[DNS](/azure/dns/) | [Microsoft.Azure.Management.Dns.Fluent](https://www.nuget.org/packages/Microsoft.Azure.Management.Dns.Fluent)<br/>[Microsoft.Azure.Management.Dns](https://www.nuget.org/packages/Microsoft.Azure.Management.Dns)
[Graph](/rest/api/graphrbac) | [Microsoft.Azure.Graph.RBAC](https://www.nuget.org/packages/Microsoft.Azure.Graph.RBAC)
[HD Insight](/azure/hdinsight/) | [Microsoft.Azure.Management.HDInsight](https://www.nuget.org/packages/Microsoft.Azure.Management.HDInsight)
[Key Vault](/azure/key-vault/) | [Microsoft.Azure.Management.KeyVault.Fluent](https://www.nuget.org/packages/Microsoft.Azure.Management.KeyVault.Fluent)<br/>[Microsoft.Azure.Management.KeyVault](https://www.nuget.org/packages/Microsoft.Azure.Management.KeyVault)
[Log Analytics](/azure/log-analytics/) | [Microsoft.Azure.Management.OperationalInsights](https://www.nuget.org/packages/Microsoft.Azure.Management.OperationalInsights)
[Logic Apps](/azure/logic-apps/) | [Microsoft.Azure.Management.Logic](https://www.nuget.org/packages/Microsoft.Azure.Management.Logic)
[MachineLearning](/azure/machine-learning/) | [Microsoft.Azure.Management.MachineLearning](https://www.nuget.org/packages/Microsoft.Azure.Management.MachineLearning)
[Media Services](/azure/media-services/) | [Microsoft.Azure.Management.Media](https://www.nuget.org/packages/Microsoft.Azure.Management.Media)
[Monitor](/azure/monitoring-and-diagnostics/) | [Microsoft.Azure.Insights](https://www.nuget.org/packages/Microsoft.Azure.Insights)
[Notification Hubs](/azure/notification-hubs/) | [Microsoft.Azure.Management.NotificationHubs](https://www.nuget.org/packages/Microsoft.Azure.Management.NotificationHubs)
[PowerBI Embedded](/azure/power-bi-embedded/) | [Microsoft.Azure.Management.PowerBIEmbedded](https://www.nuget.org/packages/Microsoft.Azure.Management.PowerBIEmbedded)
[Recovery Services](/azure/site-recovery/) | [Microsoft.Azure.Management.RecoveryServices](https://www.nuget.org/packages/Microsoft.Azure.Management.RecoveryServices)
[Redis Cache](/azure/redis-cache/) | [Microsoft.Azure.Management.Redis.Fluent](https://www.nuget.org/packages/Microsoft.Azure.Management.Redis.Fluent)<br/>[Microsoft.Azure.Management.Redis](https://www.nuget.org/packages/Microsoft.Azure.Management.Redis)
[Resource Manager](/azure/azure-resource-manager/) | [Microsoft.Azure.Management.ResourceManager.Fluent](https://www.nuget.org/packages/Microsoft.Azure.Management.ResourceManager.Fluent)<br/>[Microsoft.Azure.Management.ResourceManager](https://www.nuget.org/packages/Microsoft.Azure.Management.ResourceManager)
[Scheduler](/azure/scheduler/) | [Microsoft.Azure.Management.Scheduler](https://www.nuget.org/packages/Microsoft.Azure.Management.Scheduler)
[Search](/azure/search/) | [Microsoft.Azure.Management.Search](https://www.nuget.org/packages/Microsoft.Azure.Management.Search)
[Service Bus](/azure/service-bus/) | [Microsoft.Azure.Management.ServiceBus.Fluent](https://www.nuget.org/packages/Microsoft.Azure.Management.ServiceBus.Fluent)<br/>[Microsoft.Azure.Management.ServiceBus](https://www.nuget.org/packages/Microsoft.Azure.Management.ServiceBus)
[SQL Database](/azure/sql-database/) | [Microsoft.Azure.Management.Sql.Fluent](https://www.nuget.org/packages/Microsoft.Azure.Management.Sql.Fluent)<br/>[Microsoft.Azure.Management.Sql](https://www.nuget.org/packages/Microsoft.Azure.Management.Sql)
[Storage](/azure/storage/) | [Microsoft.Azure.Management.Storage.Fluent](https://www.nuget.org/packages/Microsoft.Azure.Management.Storage.Fluent)<br/>[Microsoft.Azure.Management.Storage](https://www.nuget.org/packages/Microsoft.Azure.Management.Storage)<br/>[Microsoft.Azure.Storage.DataMovement](https://www.nuget.org/packages/Microsoft.Azure.Storage.DataMovement)
[Stream Analytics](/azure/stream-analytics/) | [Microsoft.Azure.Management.StreamAnalytics](https://www.nuget.org/packages/Microsoft.Azure.Management.StreamAnalytics)
[Traffic Manager](/azure/traffic-manager/) | [Microsoft.Azure.Management.TrafficManager.Fluent](https://www.nuget.org/packages/Microsoft.Azure.Management.TrafficManager.Fluent)<br/>[Microsoft.Azure.Management.TrafficManager](https://www.nuget.org/packages/Microsoft.Azure.Management.TrafficManager)
[Virtual Machines](/azure/virtual-machines/) | [Microsoft.Azure.Management.Compute.Fluent](https://www.nuget.org/packages/Microsoft.Azure.Management.Compute.Fluent)| [Microsoft.Azure.Management.Compute](https://www.nuget.org/packages/Microsoft.Azure.Management.Compute)
[Virtual Network](/azure/virtual-network/) | [Microsoft.Azure.Management.Network.Fluent](https://www.nuget.org/packages/Microsoft.Azure.Management.Network.Fluent)<br/>[Microsoft.Azure.Management.Network](https://www.nuget.org/packages/Microsoft.Azure.Management.Network)
[Web Apps](/azure/app-service-web) | [Microsoft.Azure.Management.AppService.Fluent](https://www.nuget.org/packages/Microsoft.Azure.Management.AppService.Fluent)<br/>[Microsoft.Azure.Management.Websites](https://www.nuget.org/packages/Microsoft.Azure.Management.Websites)

## <a id="data"></a>Azure Client Libraries for .NET

Use these libraries to **consume and integrate** Azure services in your applications.  For example, your application may need to store documents in DocumentDB, read blobs from Azure Storage, or use SQL Database.

Service | Package  
--------|--------
[Azure Active Directory](/azure/active-directory) | [Microsoft.IdentityModel.Clients.ActiveDirectory](https://www.nuget.org/packages/Microsoft.IdentityModel.Clients.ActiveDirectory)  
[Batch](/azure/batch/) | [Azure.Batch](https://www.nuget.org/packages/Azure.Batch) 
[Data Lake Analytics](/azure/data-lake-analytics/) | [Microsoft.Azure.Management.DataLake.Analytics](https://www.nuget.org/packages/Microsoft.Azure.Management.DataLake.Analytics)
[Data Lake Store](/azure/data-lake-store/) | [Microsoft.Azure.Management.DataLake.Store](https://www.nuget.org/packages/Microsoft.Azure.Management.DataLake.Store)
[DocumentDB](/azure/documentdb/) | [Microsoft.Azure.DocumentDB.Core](https://www.nuget.org/packages/Microsoft.Azure.DocumentDB.Core)  
[Event Hubs](/azure/event-hubs/) | [Microsoft.Azure.EventHubs](https://www.nuget.org/packages/Microsoft.Azure.EventHubs)<br/>[Microsoft.Azure.EventHubs.Processor](https://www.nuget.org/packages/Microsoft.Azure.EventHubs.Processor)
[HD Insight](/azure/hdinsight/) | [Microsoft.Azure.Management.HDInsight.Job](https://www.nuget.org/packages/Microsoft.Azure.Management.HDInsight.Job) 
[IoT Hub](/azure/iot-hub/) | [Microsoft.Azure.Devices](https://www.nuget.org/packages/Microsoft.Azure.Devices)&nbsp;<b>&#42;</b><br/>[Microsoft.Azure.Devices.Client](https://www.nuget.org/packages/Microsoft.Azure.Devices.Client)
[Key Vault](/azure/key-vault/) | [Microsoft.Azure.KeyVault](https://www.nuget.org/packages/Microsoft.Azure.KeyVault)
[Media Services](/azure/media-services/) | [windowsazure.mediaservices.extensions](https://www.nuget.org/packages/windowsazure.mediaservices.extensions)&nbsp;<b>&#42;</b> 
[MySQL](/azure/MySQL/) | [MySql.Data](https://www.nuget.org/packages/MySql.Data)
[Notification Hubs](/azure/notification-hubs/) | [Microsoft.Azure.NotificationHubs](https://www.nuget.org/packages/Microsoft.Azure.NotificationHubs)&nbsp;<b>&#42;</b><br/>[WindowsAzure.Messaging.Managed](https://www.nuget.org/packages/WindowsAzure.Messaging.Managed)&nbsp;<b>&#42;</b>
[PostgreSQL](/azure/postgresql/) | [Npgsql](https://www.nuget.org/packages/Npgsql/)
[Redis Cache](/azure/redis-cache/) | [StackExchange.Redis](https://www.nuget.org/packages/StackExchange.Redis/)
[Search](/azure/search/) | [Microsoft.Azure.Search](https://www.nuget.org/packages/Microsoft.Azure.Search)&nbsp;<b>&#42;</b>
[Service Bus](/azure/service-bus/) | [WindowsAzure.ServiceBus](https://www.nuget.org/packages/WindowsAzure.ServiceBus)&nbsp;<b>&#42;</b>
[Service Bus Relay](/azure/service-bus-relay/) | [Microsoft.Azure.Relay](https://www.nuget.org/packages/Microsoft.Azure.Relay)
[Service Fabric](/azure/service-fabric/) | [Microsoft.ServiceFabric](https://www.nuget.org/profiles/servicefabric)&nbsp;<b>&#42;</b>
[SQL Database](/azure/sql-database/) | [System.Data.SqlClient](https://www.nuget.org/packages/System.Data.SqlClient/) 
[Storage](/azure/storage/) | [WindowsAzure.Storage](https://www.nuget.org/packages/WindowsAzure.Storage) 

\* *- Denotes .NET Core support is coming soon.*