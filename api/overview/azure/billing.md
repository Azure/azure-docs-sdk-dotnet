---
title: Azure Billing libraries for .NET
description: Reference for Azure Billing libraries for .NET
keywords: Azure, .NET, SDK, API, Billing
author: spboyer
ms.author: casoper
manager: douge
ms.date: 07/07/2017
ms.topic: reference
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.service: multiple
---
# Azure Billing libraries for .NET

## Overview

Azure Billing API (preview) provides programmatic access to your Azure billing information and invoices.

## Management library

Install the [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.Management.Billing) directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].

#### Visual Studio Package Manager

```powershell
Install-Package Microsoft.Azure.Management.Billing
```

```bash
dotnet add package Microsoft.Azure.Management.Billing
```

### Code Example

Connect to Azure and get a list of invoices.

```csharp
/* Include these directives
using Microsoft.Rest.Azure.Authentication;
using Microsoft.Azure.Management.Billing;
using Microsoft.Azure.Management.Billing.Models;
*/

// Log into Azure
var serviceCreds = ApplicationTokenProvider.LoginSilentAsync(tenantId, clientId, secret);
var billingClient = new BillingClient(serviceCreds);
billingClient.SubscriptionId = subscriptionId;

// Get list of invoices
billingClient.Invoices.List();
```

> [!div class="nextstepaction"]
> [Explore the management APIs](/dotnet/api/overview/azure/billing/management)

## Samples

* [Usage API](https://azure.microsoft.com/en-us/resources/samples/billing-dotnet-usage-api/)
* [RateCard API](https://azure.microsoft.com/en-us/resources/samples/billing-dotnet-ratecard-api/)
* [Multi-Tenant Web Application](https://azure.microsoft.com/en-us/resources/samples/billing-dotnet-webapp-multitenant/)

[PackageManager]: https://docs.microsoft.com/nuget/tools/package-manager-console
[DotNetCLI]: https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-add-package
