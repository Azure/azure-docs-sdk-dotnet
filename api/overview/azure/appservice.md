---
title: Azure App Service libraries for .NET
description: Reference for Azure App Service libraries for .NET
keywords: Azure, .NET, SDK, API, web apps, app service, mobile, asp.net
author: camsoper
ms.author: casoper
manager: douge
ms.date: 06/09/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.service: multiple

ms.author: casoper
manager: douge
ms.date: 06/09/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.service: multiple
---

# Azure App Service libraries for .NET

## Overview

Deploy, manage, and scale web apps, APIs, and mobile apps running in [Azure App Service](https://docs.microsoft.com/azure/app-service) from your .NET code using the management libraries. The management libraries also provide a .NET interface for automating app configuration as an alternative to using the Azure portal, [PowerShell](https://docs.microsoft.com/powershell/azure/get-started-azureps?view=azurermps-4.0.0), or [CLI](https://docs.microsoft.com/cli/azure/install-azure-cli).

## Import the libraries

### Visual Studio 

In the [Package Manager](https://docs.microsoft.com/dotnet/azure/dotnet-sdk-azure-install?view=azure-dotnet) window, use the following cmdlet:

```powershell
Install-Package Microsoft.Azure.Management.AppService.Fluent
``` 

### .NET Core command line

Execute the following command in your project directory:

```bash
dotnet add package Microsoft.Azure.Management.AppService.Fluent
```

## Example

Create a new web app.

```csharp

var app1 = azure.WebApps
        .Define(app1Name)
        .WithRegion(Region.USWest)
        .WithNewResourceGroup(rg1Name)
        .WithNewWindowsPlan(PricingTier.StandardS1)
        .Create();
```

## Samples

- [Azure management libraries for .NET samples for web apps](/dotnet/azure/dotnet-sdk-azure-web-apps-samples)