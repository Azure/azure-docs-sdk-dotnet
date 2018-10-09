---
title: Azure compute libraries for .NET
description: Reference for Azure compute libraries for .NET
ms.date: 10/19/2017
ms.topic: reference
ms.service: virtual-machines
---

# Azure virtual machine libraries for .NET

## Overview

On-demand, scalable computing resources running Linux or Windows.

To get started with Azure virtual machines, see [Create a Linux virtual machine with the Azure portal](https://review.docs.microsoft.com/azure/virtual-machines/linux/quick-create-portal).

## Management APIs

Create, configure, and scale out Windows and Linux virtual machines in Azure from your code with the management API.

Install the [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.Management.Compute.Fluent) directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].

#### Visual Studio Package Manager

```powershell
Install-Package Microsoft.Azure.Management.Compute.Fluent
```

#### .NET Core CLI

```bash
dotnet add package Microsoft.Azure.Management.Compute.Fluent
```

### Code Example

Create a Windows VM.

```csharp
/* Include these "using" directives...
using Microsoft.Azure.Management.Compute.Fluent;
using Microsoft.Azure.Management.Compute.Fluent.Models;
using Microsoft.Azure.Management.ResourceManager.Fluent.Core;
*/

IVirtualMachine windowsVM = azure.VirtualMachines.Define("MyVirtualMachine")
    .WithRegion(Region.USEast)
    .WithNewResourceGroup("MyResourceGroup")
    .WithNewPrimaryNetwork("10.0.0.0/28")
    .WithPrimaryPrivateIPAddressDynamic()
    .WithNewPrimaryPublicIPAddress("MyIPAddressLabel")
    .WithPopularWindowsImage(KnownWindowsVirtualMachineImage.WindowsServer2012R2Datacenter)
    .WithAdminUsername("UserName")
    .WithAdminPassword("Password")
    .WithSize(VirtualMachineSizeTypes.StandardD3V2)
    .Create();
```

> [!div class="nextstepaction"]
> [Explore the management APIs](https://docs.microsoft.com/dotnet/api/overview/azure/virtualmachines/management?view=azure-dotnet)

### Samples

* [Create and manage virtual machines](/dotnet/azure/dotnet-sdk-azure-virtual-machine-samples)
* [Deploy an SSH-enabled VM with a Template with .NET](https://azure.microsoft.com/resources/samples/resource-manager-dotnet-template-deployment/)

View the [complete list](https://azure.microsoft.com/resources/samples/?platform=dotnet&term=VM) of virtual machine samples.

[PackageManager]: https://docs.microsoft.com/nuget/tools/package-manager-console
[DotNetCLI]: https://docs.microsoft.com/dotnet/core/tools/dotnet-add-package
