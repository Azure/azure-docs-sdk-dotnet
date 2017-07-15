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
ms.date: 06/20/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.service: multiple
---

# Azure App Service libraries for .NET

## Overview

[Azure App Service](/azure/app-service/app-service-value-prop-what-is) allows you to deploy and scale websites, web applications, services, and REST APIs.

## Management API

Deploy, manage, and scale elements hosted in Azure App Service with the management API.

#### Visual Studio package manager

```powershell
Install-Package Microsoft.Azure.Management.AppService.Fluent
```

#### .NET Core CLI

```bash
dotnet add package Microsoft.Azure.Management.AppService.Fluent
```

### #Example

Create a new web app.

```csharp

var app1 = azure.WebApps
        .Define(app1Name)
        .WithRegion(Region.USWest)
        .WithNewResourceGroup(rg1Name)
        .WithNewWindowsPlan(PricingTier.StandardS1)
        .Create();
```

[!div class="nextstepaction"]
[Explore the Management APIs](/dotnet/api/overview/azure/appservice/management)

### Samples

* [Manage your web apps with the .NET SDK for Azure](https://azure.microsoft.com/en-us/resources/samples/app-service-web-dotnet-manage/)
* [ASP.NET sample for Azure App Service](https://azure.microsoft.com/en-us/resources/samples/app-service-web-dotnet-get-started/)

View the [complete list](https://azure.microsoft.com/en-us/resources/samples/?platform=dotnet&term=app%20service) of Azure App Service samples.