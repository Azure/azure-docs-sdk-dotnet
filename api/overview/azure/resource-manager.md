---
title: Azure Resource Manager libraries for .NET
description: Reference for Azure Resource Manager libraries for .NET
keywords: Azure, .NET, SDK, API, Resource Manager
author: camsoper
ms.author: casoper
manager: wpickett
ms.date: 10/19/2017
ms.topic: reference
ms.devlang: dotnet
ms.service: multiple
ms.custom: devcenter, svc-overview
---

# Azure Resource Manager libraries for .NET

## Overview

Azure Resource Manager enables you to work with the resources in your solution as a group.  For more information about Resource Manager, see [Azure Resource Manager overview](https://docs.microsoft.com/azure/azure-resource-manager/resource-group-overview).

## Management library

The Azure Resource Manager library for .NET enables you to create, update, delete, and list resources and resource groups.

Install the [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.Management.ResourceManager.Fluent) directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].

#### Visual Studio Package Manager

```powershell
Install-Package Microsoft.Azure.Management.ResourceManager.Fluent
```

```bash
dotnet add package Microsoft.Azure.Management.ResourceManager.Fluent
```

### Example

This example creates a new resource group.

```csharp
/* Include these "using" directives.
using Microsoft.Azure.Management.ResourceManager.Fluent;
using Microsoft.Azure.Management.ResourceManager.Fluent.Core;
*/

IResourceGroup resourceGroup = azure.ResourceGroups
    .Define("ResourceGroupName")
    .WithRegion(Region.USWest)
    .Create();
```

> [!div class="nextstepaction"]
> [Explore the management APIs](/dotnet/api/overview/azure/resources/management)


## Samples

* [Manage resource groups](https://github.com/Azure-Samples/resources-dotnet-manage-resource-group)
* [Manage resources](https://github.com/Azure-Samples/resources-dotnet-manage-resource)
* [Deploy resources with ARM templates](https://github.com/Azure-Samples/resources-dotnet-deploy-using-arm-template)
* [Deploy resources with ARM templates (with progress)](https://github.com/Azure-Samples/resources-dotnet-deploy-using-arm-template-with-progress)


[PackageManager]: https://docs.microsoft.com/nuget/tools/package-manager-console
[DotNetCLI]: https://docs.microsoft.com/dotnet/core/tools/dotnet-add-package
