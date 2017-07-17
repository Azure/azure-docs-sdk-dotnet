---
title: Azure compute libraries for .NET
description: Reference for Azure compute libraries for .NET
keywords: Azure, .NET, SDK, API, VM, virtual machines, compute
author: camsoper
ms.author: casoper
manager: douge
ms.date: 06/20/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.service: multiple
---

# Azure virtual machine libraries for .NET

## Overview

On-demand, scalable computing resources running Linux or Windows.

To get started with Azure virtual machines, see [Create a Linux virtual machine with the Azure portal](https://review.docs.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-portal).

## Management APIs

Create, configure, and scale out Windows and Linux virtual machines in Azure from your code with the management API.

#### Visual Studio Package Manager

```powershell
Install-Package Microsoft.Azure.Management.Compute.Fluent
```

#### .NET Core CLI

```bash
dotnet add package Microsoft.Azure.Management.Compute.Fluent
```

### Example

Create a Windows VM.

```csharp
var windowsVM = azure.VirtualMachines.Define(windowsVmName)
    .WithRegion(Region.USEast)
    .WithNewResourceGroup(rgName)
    .WithNewPrimaryNetwork("10.0.0.0/28")
    .WithPrimaryPrivateIPAddressDynamic()
    .WithNewPrimaryPublicIPAddress(publicIpDnsLabel)
    .WithPopularWindowsImage(KnownWindowsVirtualMachineImage.WindowsServer2012R2Datacenter)
    .WithAdminUsername(username)
    .WithAdminPassword(password)
    .WithSize(VirtualMachineSizeTypes.StandardD3V2)
    .Create();
```

[!div class="nextstepaction"]
[Explore the management APIs](https://review.docs.microsoft.com/en-us/dotnet/api/overview/azure/virtualmachines/management?view=azure-dotnet)

### Samples

* [Create and manage virtual machines](/dotnet/azure/dotnet-sdk-azure-virtual-machine-samples)
* [Deploy an SSH-enabled VM with a Template with .NET](https://azure.microsoft.com/en-us/resources/samples/resource-manager-dotnet-template-deployment/)

View the [complete list](https://azure.microsoft.com/en-us/resources/samples/?platform=dotnet&term=VM) of virtual machine samples.
