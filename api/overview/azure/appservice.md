---
title: Azure App Service libraries for .NET
description: Reference for Azure App Service libraries for .NET
keywords: Azure, .NET, SDK, API, web apps, app service, mobile, asp.net
author: camsoper
ms.author: casoper
manager: douge
ms.date: 07/17/2017
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

Install the [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.Management.AppService.Fluent) directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].


#### Visual Studio package manager

```powershell
Install-Package Microsoft.Azure.Management.AppService.Fluent
```

#### .NET Core CLI

```bash
dotnet add package Microsoft.Azure.Management.AppService.Fluent
```

### Example

Create a new web app.

```csharp
/* Include these "using" directives:
using Microsoft.Azure.Management.ResourceManager.Fluent.Core;
using Microsoft.Azure.Management.AppService.Fluent;
*/

IWebApp app1 = azure.WebApps
    .Define("MyUniqueWebAddress")
    .WithRegion(Region.USWest)
    .WithNewResourceGroup("MyResourceGroup")
    .WithNewWindowsPlan(PricingTier.StandardS1)
    .Create();
```

[!div class="nextstepaction"]
[Explore the Management APIs](/dotnet/api/overview/azure/appservice/management)

### Samples

* [Manage your web apps with the .NET SDK for Azure](https://azure.microsoft.com/en-us/resources/samples/app-service-web-dotnet-manage/)
* [ASP.NET sample for Azure App Service](https://azure.microsoft.com/en-us/resources/samples/app-service-web-dotnet-get-started/)

View the [complete list](https://azure.microsoft.com/en-us/resources/samples/?platform=dotnet&term=app%20service) of Azure App Service samples.

[PackageManager]: https://docs.microsoft.com/nuget/tools/package-manager-console
[DotNetCLI]: https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-add-package