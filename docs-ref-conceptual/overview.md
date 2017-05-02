---
title: Azure libraries for .NET
description: Overview of the Azure SDK for .NET
keywords: Azure, .NET, SDK, API, NuGet
author: camsoper
ms.author: casoper
manager: douge
ms.date: 04/16/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.service: multiple
ms.assetid: 
---

# Azure libraries for .NET

The Azure libraries for .NET let you create and manage Azure resources from your .NET applications. If you're looking for documentation to create .NET apps on Azure, see [Azure for .NET developers](https://review.docs.microsoft.com/en-us/azure/dotnet/index?branch=pr-en-us-9857).

Many of the packages for managing Azure resources have a [fluent](dotnet-sdk-azure-concepts.md) interface to configure resources exactly to your specifications. For example, to add a Windows VM in an existing Azure resource group:

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

Review the [install instructions](dotnet-sdk-azure-install.md) to start using the libraries immediately with your projects. Set up authentication and run sample code against your own Azure subscription in the [get started article](dotnet-sdk-azure-get-started.md). The [concepts article](dotnet-sdk-azure-patterns.md) goes into the conventions the SDK uses and how to leverage them to simplify your application code. New features, breaking changes, and migration instructions are available in the [release notes](dotnet-sdk-release-notes.md).

The following samples cover common automation tasks with the Azure libraries for .NET and are formatted for copy and paste into you own apps:

- [Virtual machines](dotnet-sdk-azure-virtual-machine-samples.md)
- [Resource groups](dotnet-sdk-azure-resource-groups-samples.md)
- [Web apps](dotnet-sdk-azure-web-apps-samples.md)
- [SQL Database](dotnet-sdk-azure-sql-database-samples.md)

An up to date [reference](#) is available for all packages and classes.