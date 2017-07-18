---
title: Azure Data Lake Analytics libraries for .NET
description: Reference for Azure Data Lake Analytics libraries for .NET
keywords: Azure, .NET, SDK, API, Data Lake Analytics
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

# Azure Data Lake Analytics libraries for .NET

## Overview

Azure Data Lake Analytics is an on-demand analytics job service to simplify big data analytics. You can focus on writing, running, and managing jobs rather than on operating distributed infrastructure. Instead of deploying, configuring, and tuning hardware, you write queries to transform your data and extract valuable insights. The analytics service can handle jobs of any scale instantly by setting the dial for how much power you need. You only pay for your job when it is running, making it cost-effective. The analytics service supports Azure Active Directory letting you manage access and roles, integrated with your on-premises identity system. It also includes U-SQL, a language that unifies the benefits of SQL with the expressive power of user code. This scalable distributed runtime enables you to efficiently analyze data in the store. It operates across SQL Servers in Azure, Azure SQL Database, and Azure SQL Data Warehouse.

## Management library

Use the management library to connect to the service and manage analytics jobs.

Install the [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.Management.DataLake.Analytics) directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].

#### Visual Studio Package Manager

```powershell
Install-Package Microsoft.Azure.Management.DataLake.Analytics
```

```bash
dotnet add package Microsoft.Azure.Management.DataLake.Analytics
```

### Example

This example creates the clients to connect with and manage the analytics and store accounts.

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
> [Explore the management APIs](/dotnet/api/overview/azure/datalakeanalytics/management)

## Samples

* [Azure Data Lake .NET Client Example](https://azure.microsoft.com/en-us/resources/samples/data-lake-dotnet-client/)

[PackageManager]: https://docs.microsoft.com/nuget/tools/package-manager-console
[DotNetCLI]: https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-add-package
