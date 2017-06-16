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

Define, configure, and deploy new Windows and Linux virtual machines and virtual machine scale sets from your code with the Azure management libraries for .NET. The libraries also let start and stop existing virtual machines and attach or detach disks to stopped VMs in your subscription.

## Import the libraries

### Visual Studio 

In the [Package Manager](https://docs.microsoft.com/dotnet/azure/dotnet-sdk-azure-install?view=azure-dotnet) window, use the following cmdlet:

```powershell
Install-Package Microsoft.Azure.Management.Compute.Fluent
``` 

### .NET Core command line

Execute the following command in your project directory:

```bash
dotnet add package Microsoft.Azure.Management.Compute.Fluent
```

## Example

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

## Samples

- [Azure management libraries for .NET samples for virtual machines](/dotnet/azure/dotnet-sdk-azure-virtual-machine-samples)