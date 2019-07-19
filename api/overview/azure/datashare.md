---
title: Azure Data Share libraries for .NET
description: Reference for Azure Data Share libraries for .NET
author: zachcmadsen
ms.author: t-zamads
ms.date: 07/19/2019
ms.topic: reference
ms.service: data-share
---

# Azure Data Share libraries for .NET

## Overview

[Azure Data Share](https://azure.microsoft.com/en-us/services/data-share/) is a cloud-based service that helps customers share data with other organizations. Azure Data Share provides centralized management, monitoring, and governance for sharing data from multiple Azure data sources. Using this service, you can quickly create shares that consist of multiple datasets from a variety of Azure data stores. You can invite your customers and external partners to access these shares through incremental snapshots of your data and revoke access as needed.

## Management library

Use the management library to create and manage Data Share accounts.

Install the [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.Management.DataShare) directly from the Visual Studio [Package Manager console](https://docs.microsoft.com/nuget/tools/package-manager-console) or with the [.NET Core CLI](https://docs.microsoft.com/dotnet/core/tools/dotnet-add-package).

#### Visual Studio Package Manager

```powershell
Install-Package Microsoft.Azure.Management.DataShare
```

#### .NET Core CLI

```bash
dotnet add package Microsoft.Azure.Management.DataShare
```

### Code Example

This example creates a Data Share account.

```csharp
/*
using Microsoft.Azure.Management.DataShare
using Microsoft.Azure.Management.DataShare.Models
*/

DataShareManagementClient client = new DataShareManagementClient(tokenCredentials) { SubscriptionId = subscriptionId };
var account = new Account
{
    Location = region,
    Identity = new Identity { Type = "SystemAssigned" }
};
client.Accounts.Create(resourceGroupName, accountName, account);
```

> [!div class="nextstepaction"]
> [Explore the management APIs](/dotnet/api/overview/azure/datashare/management)
