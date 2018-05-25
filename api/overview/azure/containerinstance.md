---
title: Azure Container Instances libraries for .NET
description: Reference for Azure Container Instances libraries for .NET
keywords: Azure, .NET, SDK, API, Container Instances, ACI
author: mmacy
ms.author: marsma
manager: jeconnoc
ms.date: 05/25/2018
ms.topic: reference
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.service: dcontainer-instances
ms.custom: devcenter, svc-overview
---

# Azure Container Instances libraries for .NET

Use the Microsoft Azure Container Instances libraries for .NET to create and manage Azure container instances. Learn more by reading the [Azure Container Instances overview](/azure/container-instances/container-instances-overview).

## Management library

Use the management library to create and manage Azure container instances in Azure.

Install the [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.Management.ContainerInstance.Fluent) directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].

### Visual Studio Package Manager

```powershell
Install-Package Microsoft.Azure.Management.ContainerInstance.Fluent
```

```bash
dotnet add package Microsoft.Azure.Management.ContainerInstance.Fluent
```

## Examples

The following example creates a container group with a single container.

<!-- SOURCE REPO: https://github.com/Azure-Samples/aci-docs-sample-dotnet -->
[!code-csharp[create_container_group](~/aci-docs-sample-dotnet/Program.cs#create_container_group "Create single-container group")]

> [!div class="nextstepaction"]
> [Explore the management APIs](/dotnet/api/overview/azure/containerinstances/management)

## Samples

* The source code for the preceding examples can be found on GitHub:

  [Azure-Samples/aci-docs-sample-dotnet][aci-docs-sample-dotnet]

* More Azure Container Instances code samples:

  [Azure Code Samples][samples]

Explore more [sample .NET code](https://azure.microsoft.com/resources/samples/?platform=dotnet) you can use in your apps.

[PackageManager]: https://docs.microsoft.com/nuget/tools/package-manager-console
[DotNetCLI]: https://docs.microsoft.com/dotnet/core/tools/dotnet-add-package
[samples]: https://azure.microsoft.com/resources/samples/?sort=0&term=ACI
[aci-docs-sample-dotnet]: https://github.com/Azure-Samples/aci-docs-sample-dotnet