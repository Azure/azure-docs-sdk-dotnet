---
title: Azure Data Lake Store libraries for .NET
description: Reference for Azure Data Lake Store libraries for .NET
keywords: Azure, .NET, SDK, API, Data Lake Store
author: camsoper
ms.author: casoper
manager: douge
ms.date: 07/18/2017
ms.topic: reference
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.service: multiple
---

# Azure Data Lake Store libraries for .NET

## Overview

Azure Data Lake Store is an enterprise-wide hyper-scale repository for big data analytic workloads. Azure Data Lake enables you to capture data of any size, type, and ingestion speed in one single place for operational and exploratory analytics.

## Management library

Use the management library to connect to and manage your big data repositories.

Install the [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.Management.DataLake.Store) directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].

#### Visual Studio Package Manager

```powershell
Install-Package Microsoft.Azure.Management.DataLake.Store
```

```bash
dotnet add package Microsoft.Azure.Management.DataLake.Store
```

### Example

This example authenticates to an analytics account and store and creates the clients necessary for management.

```csharp
// Setup authentication 
var auth = new AdlClient.Authentication("microsoft.onmicrosoft.com"); // change this to YOUR tenant
auth.Authenticate();

// Collect info about the Azure resources needed for this connection
string subid = "<Azure Subscription Id>";
string rg = "<Azure Resource Group>";
string adla_name = "<Analytics Account User Name>";
string adls_name = "<Store Account User Name>";

// Identify the accounts
var adla_account = new AdlClient.Models.AnalyticsAccountRef(subid, rg, adla_name);
var adls_account = new AdlClient.Models.StoreAccountRef(subid, rg, adls_name);

// Create the clients
var az = new AdlClient.AzureClient(auth);
var adla = new AdlClient.AnalyticsClient(auth, adla_account);
var adls = new AdlClient.StoreClient(auth, adls_account);
```

> [!div class="nextstepaction"]
> [Explore the management APIs](/dotnet/api/overview/azure/datalakestore/management)

## Samples

* [Azure Data Lake .NET Client Example](https://azure.microsoft.com/en-us/resources/samples/data-lake-dotnet-client/)

[PackageManager]: https://docs.microsoft.com/nuget/tools/package-manager-console
[DotNetCLI]: https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-add-package
