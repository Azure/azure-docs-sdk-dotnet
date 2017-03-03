---
title: Azure .NET API Reference 
description: Azure .NET API Reference 
keywords: Azure .NET, Azure .NET API Reference, Azure .NET class library
author: camsoper
manager: douge
ms.author: casoper
ms.date: 03/02/2016
ms.topic: managed-reference
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.assetid: 46ad4ac6-bc51-45c9-b6dd-394ed0af5424
---

# Azure NuGet Packages

Use the libraries in the .NET SDK for Azure to manage and consume Azure services in your applications.  

## Installation

### Visual Studio

If you're using Visual Studio, use the **NuGet Package Manager Console** to import the package into your project.

1. With your Visual Studio solution open, launch the console by clicking **Tools**, followed by **NuGet Packager Manager**, and then click **Package Manager Console**.  

    ![Package Manager Console](media/index/package-manager.png)

2. In the console window, use the **Install-Package** cmdlet to download and install the NuGet package.  For example, to include the latest version of the [Azure Resource Management Library](http://www.nuget.org/packages/Microsoft.Azure.Management.ResourceManager) for .NET:

    ```powershell
    Install-Package Microsoft.Azure.Management.ResourceManager -Pre 
    ``` 
    To use a specific version, include the version number like this:

    ```powershell
    Install-Package Microsoft.Azure.Management.ResourceMananger -Version 1.4.0-preview
    ``` 

### .NET Core

If you're using .NET Core with Visual Studio Code (or any other editor), edit your csproj file to add the package as a **PackageReference** element.  This example uses a specific version of **Microsoft.Azure.Management.ResourceManager**, but you can also use [floating versions](/nuget/consume-packages/package-references-in-project-files#floating-versions).

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

## Packages

**Data plane** packages are used to **consume** Azure services in your .NET applications.  **Management plane** packages are used to **manage** resources in Azure.  **Fluent** management plane packages (ending in **\*.Fluent**) use a [simplified, easy-to-read syntax](https://azure.microsoft.com/blog/simpler-azure-management-libraries-for-net/). Use the fluent packages only if you prefer the fluent syntax.

> [!NOTE]
> For projects using .NET Core, you may need to use a preview version of a given package. Check the dependencies for *.NETStandard* to verify .NET Core support.

Service | Data plane package | Management plane package
--------|--------------------|-------------------------
[Analysis Services](https://docs.microsoft.com/azure/analysis-services/) | | [Microsoft.Azure.Management.Analysis](https://www.nuget.org/packages/Microsoft.Azure.Management.Analysis)
[ApiManagement](https://docs.microsoft.com/azure/api-management/) | | [Microsoft.Azure.Management.ApiManagement](https://www.nuget.org/packages/Microsoft.Azure.Management.ApiManagement)
Authorization | | [Microsoft.Azure.Management.Authorization](https://www.nuget.org/packages/Microsoft.Azure.Management.Authorization)
[Automation](https://docs.microsoft.com/azure/automation/) | | [Microsoft.Azure.Management.Automation](https://www.nuget.org/packages/Microsoft.Azure.Management.Automation)
[Azure Active Directory](https://docs.microsoft.com/azure/active-directory) | [Microsoft.IdentityModel.Clients.ActiveDirectory](https://www.nuget.org/packages/Microsoft.IdentityModel.Clients.ActiveDirectory) | 
[Backup](https://docs.microsoft.com/azure/backup/) | | [Microsoft.Azure.Management.RecoveryServices.Backup](https://www.nuget.org/packages/Microsoft.Azure.Management.RecoveryServices.Backup)
[Batch](https://docs.microsoft.com/azure/batch/) | [Azure.Batch](https://www.nuget.org/packages/Azure.Batch) | [Microsoft.Azure.Management.Batch.Fluent](https://www.nuget.org/packages/Microsoft.Azure.Management.Batch.Fluent)<br/>[Microsoft.Azure.Management.Batch](https://www.nuget.org/packages/Microsoft.Azure.Management.Batch)
[Billing](https://docs.microsoft.com/azure/billing/) | | [Microsoft.Azure.Management.Billing](https://www.nuget.org/packages/Microsoft.Azure.Management.Billing)
[CDN](https://docs.microsoft.com/azure/cdn/) | | [Microsoft.Azure.Management.Cdn.Fluent](https://www.nuget.org/packages/Microsoft.Azure.Management.Cdn.Fluent)<br/>[Microsoft.Azure.Management.Cdn](https://www.nuget.org/packages/Microsoft.Azure.Management.Cdn)
[Cognitive Services](https://docs.microsoft.com/azure/cognitive-services/) | | [Microsoft.Azure.Management.CognitiveServices](https://www.nuget.org/packages/Microsoft.Azure.Management.CognitiveServices)
Commerce | | [Microsoft.Azure.Commerce.UsageAggregates](https://www.nuget.org/packages/Microsoft.Azure.Commerce.UsageAggregates)
Container Registry | | [Microsoft.Azure.Management.ContainerRegistry](https://www.nuget.org/packages/Microsoft.Azure.Management.ContainerRegistry)
Customer Insights | | [Microsoft.Azure.Management.CustomerInsights](https://www.nuget.org/packages/Microsoft.Azure.Management.CustomerInsights)
[Data Factory](https://docs.microsoft.com/azure/data-factory/) | | [Microsoft.Azure.Management.DataFactories](https://www.nuget.org/packages/Microsoft.Azure.Management.DataFactories)
[Data Lake Analytics](https://docs.microsoft.com/azure/data-lake-analytics/) | [Microsoft.Azure.Management.DataLake.Analytics](http://www.nuget.org/packages/Microsoft.Azure.Management.DataLake.Analytics) | [Microsoft.Azure.Management.DataLake.Analytics](https://www.nuget.org/packages/Microsoft.Azure.Management.DataLake.Analytics)
[Data Lake Store](https://docs.microsoft.com/azure/data-lake-store/) | [Microsoft.Azure.Management.DataLake.Store](http://www.nuget.org/packages/Microsoft.Azure.Management.DataLake.Store) | [Microsoft.Azure.Management.DataLake.Store](https://www.nuget.org/packages/Microsoft.Azure.Management.DataLake.Store)<br/>[Microsoft.Azure.Management.DataLake.StoreUploader](https://www.nuget.org/packages/Microsoft.Azure.Management.DataLake.StoreUploader)
[DevTest Labs](https://docs.microsoft.com/azure/devtest-lab/) | | [Microsoft.Azure.Management.DevTestLabs](https://www.nuget.org/packages/Microsoft.Azure.Management.DevTestLabs)
[DNS](https://docs.microsoft.com/azure/dns/) | | [Microsoft.Azure.Management.Dns.Fluent](https://www.nuget.org/packages/Microsoft.Azure.Management.Dns.Fluent)<br/>[Microsoft.Azure.Management.Dns](https://www.nuget.org/packages/Microsoft.Azure.Management.Dns)
[DocumentDB](https://docs.microsoft.com/azure/documentdb/) | [Microsoft.Azure.DocumentDB.Core](https://www.nuget.org/packages/Microsoft.Azure.DocumentDB.Core) | 
[Event Hubs](https://docs.microsoft.com/azure/event-hubs/) | [Microsoft.Azure.EventHubs](https://www.nuget.org/packages/Microsoft.Azure.EventHubs)<br/>[Microsoft.Azure.EventHubs.Processor](https://www.nuget.org/packages/Microsoft.Azure.EventHubs.Processor)
Graph | | [Microsoft.Azure.Graph.RBAC](https://www.nuget.org/packages/Microsoft.Azure.Graph.RBAC)
[HD Insight](https://docs.microsoft.com/azure/hdinsight/) | [Microsoft.Azure.Management.HDInsight.Job](http://www.nuget.org/packages/Microsoft.Azure.Management.HDInsight.Job) | [Microsoft.Azure.Management.HDInsight](https://www.nuget.org/packages/Microsoft.Azure.Management.HDInsight)
Insights | | [Microsoft.Azure.Insights](https://www.nuget.org/packages/Microsoft.Azure.Insights)
Intune | | [Microsoft.Azure.Management.Intune](https://www.nuget.org/packages/Microsoft.Azure.Management.Intune)
[IoT Hub](https://www.nuget.org/packages/Microsoft.Azure.DocumentDB.Core/) | [Microsoft.Azure.Devices](https://www.nuget.org/packages/Microsoft.Azure.Devices)<br/>[Microsoft.Azure.Devices.Client](https://www.nuget.org/packages/Microsoft.Azure.Devices.Client)
[Key Vault](https://docs.microsoft.com/azure/key-vault/) | [Microsoft.Azure.KeyVault](https://www.nuget.org/packages/Microsoft.Azure.KeyVault) | [Microsoft.Azure.Management.KeyVault.Fluent](https://www.nuget.org/packages/Microsoft.Azure.Management.KeyVault.Fluent)<br/>[Microsoft.Azure.Management.KeyVault](https://www.nuget.org/packages/Microsoft.Azure.Management.KeyVault)
[Logic Apps](https://docs.microsoft.com/azure/logic-apps/) | | [Microsoft.Azure.Management.Logic](https://www.nuget.org/packages/Microsoft.Azure.Management.Logic)
[MachineLearning](https://docs.microsoft.com/azure/machine-learning/) | | [Microsoft.Azure.Management.MachineLearning](https://www.nuget.org/packages/Microsoft.Azure.Management.MachineLearning)
[Media Services](https://docs.microsoft.com/azure/media-services/) | [windowsazure.mediaservices.extensions](https://www.nuget.org/packages/windowsazure.mediaservices.extensions) | [Microsoft.Azure.Management.Media](https://www.nuget.org/packages/Microsoft.Azure.Management.Media)
[Notification Hubs](https://docs.microsoft.com/azure/notification-hubs/) | [Microsoft.Azure.NotificationHubs](https://www.nuget.org/packages/Microsoft.Azure.NotificationHubs)<br/>[WindowsAzure.Messaging.Managed](https://www.nuget.org/packages/WindowsAzure.Messaging.Managed) | [Microsoft.Azure.Management.NotificationHubs](https://www.nuget.org/packages/Microsoft.Azure.Management.NotificationHubs)
Operational Insights | | [Microsoft.Azure.Management.OperationalInsights](https://www.nuget.org/packages/Microsoft.Azure.Management.OperationalInsights)
[PowerBI Embedded](https://docs.microsoft.com/azure/power-bi-embedded/) | | [Microsoft.Azure.Management.PowerBIEmbedded](https://www.nuget.org/packages/Microsoft.Azure.Management.PowerBIEmbedded)
[Recovery Services](https://docs.microsoft.com/azure/site-recovery/) | | [Microsoft.Azure.Management.RecoveryServices](https://www.nuget.org/packages/Microsoft.Azure.Management.RecoveryServices)
[Redis Cache](https://docs.microsoft.com/azure/redis-cache/) | [StackExchange.Redis](https://www.nuget.org/packages/StackExchange.Redis/) | [Microsoft.Azure.Management.Redis.Fluent](https://www.nuget.org/packages/Microsoft.Azure.Management.Redis.Fluent)<br/>[Microsoft.Azure.Management.Redis](https://www.nuget.org/packages/Microsoft.Azure.Management.Redis)
[Resource Manager](https://docs.microsoft.com/azure/azure-resource-manager/) | | [Microsoft.Azure.Management.ResourceManager.Fluent](https://www.nuget.org/packages/Microsoft.Azure.Management.ResourceManager.Fluent)<br/>[Microsoft.Azure.Management.ResourceManager](https://www.nuget.org/packages/Microsoft.Azure.Management.ResourceManager)
[Scheduler](https://docs.microsoft.com/azure/scheduler/) | | [Microsoft.Azure.Management.Scheduler](https://www.nuget.org/packages/Microsoft.Azure.Management.Scheduler)
[Search](https://docs.microsoft.com/azure/search/) | [Microsoft.Azure.Search](https://www.nuget.org/packages/Microsoft.Azure.Search) | [Microsoft.Azure.Management.Search](https://www.nuget.org/packages/Microsoft.Azure.Management.Search)
[Service Bus](https://docs.microsoft.com/azure/service-bus/) | [WindowsAzure.ServiceBus](https://www.nuget.org/packages/WindowsAzure.ServiceBus/) | [Microsoft.Azure.Management.ServiceBus](https://www.nuget.org/packages/Microsoft.Azure.Management.ServiceBus)
[Service Bus Relay](https://docs.microsoft.com/azure/service-bus-relay/) | [Microsoft.Azure.Relay](https://www.nuget.org/packages/Microsoft.Azure.Relay)
[Service Fabric](https://docs.microsoft.com/azure/service-fabric/) | [Microsoft.ServiceFabric](https://www.nuget.org/packages/Microsoft.ServiceFabric) | 
[SQL Database](https://docs.microsoft.com/azure/sql-database/) | [System.Data.SqlClient/](https://www.nuget.org/packages/System.Data.SqlClient/) | [Microsoft.Azure.Management.Sql.Fluent](https://www.nuget.org/packages/Microsoft.Azure.Management.Sql.Fluent)<br/>[Microsoft.Azure.Management.Sql](https://www.nuget.org/packages/Microsoft.Azure.Management.Sql)
[Storage](https://docs.microsoft.com/azure/storage/) | [WindowsAzure.Storage](http://www.nuget.org/packages/WindowsAzure.Storage) | [Microsoft.Azure.Management.Storage.Fluent](https://www.nuget.org/packages/Microsoft.Azure.Management.Storage.Fluent)<br/>[Microsoft.Azure.Management.Storage](https://www.nuget.org/packages/Microsoft.Azure.Management.Storage)<br/>[Microsoft.Azure.Storage.DataMovement](https://www.nuget.org/packages/Microsoft.Azure.Storage.DataMovement)
[Stream Analytics](https://docs.microsoft.com/azure/stream-analytics/) | | [Microsoft.Azure.Management.StreamAnalytics](https://www.nuget.org/packages/Microsoft.Azure.Management.StreamAnalytics)
[Traffic Manager](https://docs.microsoft.com/azure/traffic-manager/) | | [Microsoft.Azure.Management.TrafficManager.Fluent](https://www.nuget.org/packages/Microsoft.Azure.Management.TrafficManager.Fluent)<br/>[Microsoft.Azure.Management.TrafficManager](https://www.nuget.org/packages/Microsoft.Azure.Management.TrafficManager)
[Virtual Machines](https://docs.microsoft.com/azure/virtual-machines/) | | [Microsoft.Azure.Management.Compute.Fluent](https://www.nuget.org/packages/Microsoft.Azure.Management.Compute.Fluent)<br/>[Microsoft.Azure.Management.Compute](https://www.nuget.org/packages/Microsoft.Azure.Management.Compute)
[Virtual Network](https://docs.microsoft.com/azure/virtual-network/) | | [Microsoft.Azure.Management.Network.Fluent](https://www.nuget.org/packages/Microsoft.Azure.Management.Network.Fluent)<br/>[Microsoft.Azure.Management.Network](https://www.nuget.org/packages/Microsoft.Azure.Management.Network)
[Web Apps](https://docs.microsoft.com/azure/app-service-web) | | [Microsoft.Azure.Management.AppService.Fluent](https://www.nuget.org/packages/Microsoft.Azure.Management.AppService.Fluent)<br/>[Microsoft.Azure.Management.Websites](https://www.nuget.org/packages/Microsoft.Azure.Management.Websites)

> [!TIP]
> [Microsoft.Azure.Management.Fluent](https://www.nuget.org/packages/Microsoft.Azure.Management.Fluent) is a rollup package that contains all of the fluent libraries.
