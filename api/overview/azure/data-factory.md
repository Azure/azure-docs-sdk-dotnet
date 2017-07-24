---
title: Azure Data Factory libraries for .NET
description: Reference for Azure Data Factory libraries for .NET
keywords: Azure, .NET, SDK, API, Data Factory
author: camsoper
ms.author: casoper
manager: douge
ms.date: 07/20/2017
ms.topic: reference
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.service: multiple
---

# Azure Data Factory libraries for .NET

## Overview

Azure Data Factory is a cloud-based data integration service. It enables you to create data-driven workflows in the cloud to orchestrate and automate data movement and data transformation. Using Azure Data Factory, you can create and schedule data-driven workflows (called pipelines). Pipelines ingest data from disparate data stores and process/transform the data by using compute services. You can integrate with services such as [Azure HDInsight Hadoop](/azure/hdinsight/), Spark, [Azure Data Lake Analytics](/data-lake-analytics/), and [Azure Machine Learning](/azure/machine-learning). Publish output data to data stores such as [Azure SQL Data Warehouse](/azure/sql-data-warehouse) for business intelligence (BI) applications to consume.

To learn more, read the [Introduction to Azure Data Factory](/azure/data-factory/data-factory-introduction).

Get started with one of the following tutorials:

* [Create a pipeline to copy data](/azure/data-factory/data-factory-copy-data-from-azure-blob-storage-to-sql-database)
* [Create a pipeline to transform data](/azure/data-factory/data-factory-build-your-first-pipeline)
* [Move data between on-premises sources and the cloud](/azure/data-factory/data-factory-move-data-between-onprem-and-cloud)

## Management library

Use the management library to create and schedule data-driven workflows (pipelines).

Install the [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.Management.DataFactories) directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].

#### Visual Studio Package Manager

```powershell
Install-Package Microsoft.Azure.Management.DataFactories
```

```bash
dotnet add package Microsoft.Azure.Management.DataFactories
```

### Code Example

The following example uses the management library to create a data factory.

```csharp
DataFactoryManagementClient client = new DataFactoryManagementClient(aadTokenCredentials, resourceManagerUri);
client.DataFactories.CreateOrUpdate(resourceGroupName,
    new DataFactoryCreateOrUpdateParameters()
    {
        DataFactory = new DataFactory()
        {
            Name = dataFactoryName,
            Location = "westus",
            Properties = new DataFactoryProperties()
        }
    }
);
```

> [!div class="nextstepaction"]
> [Explore the management APIs](/dotnet/api/overview/azure/datafactories/management)

## Samples

* [MyDriving - An Azure IOT and Mobile Sample Application](https://azure.microsoft.com/resources/samples/mydriving/) that uses Data Factory to drive insights.

Explore more [sample .NET code](https://azure.microsoft.com/resources/samples/?platform=dotnet) you can use in your apps.

[PackageManager]: https://docs.microsoft.com/nuget/tools/package-manager-console
[DotNetCLI]: https://docs.microsoft.com/dotnet/core/tools/dotnet-add-package
