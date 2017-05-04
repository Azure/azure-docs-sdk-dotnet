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

The Azure libraries for .NET let you use Azure services and manage Azure resources from your application code. The libraries are available as [NuGet packages](dotnet-sdk-azure-install.md) for use in your .NET projects. 

## Consume Azure services

Use services such as SQL Database, Azure Storage, Active Directory, and DocumentDB in your .NET applications with native APIs. Import the libraries for the services you want to use from [the complete list](/dotnet-sdk-azure-install/#data) and check out the [.NET developer center](https://azure.microsoft.com/develop/net/) to learn more about building .NET apps with Azure services.

## Manage Azure resources

The Azure libraries for .NET let you create and manage Azure resources from your .NET applications.

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

Review the [install instructions](dotnet-sdk-azure-install.md) to start using the libraries immediately with your projects. Set up authentication and run sample code against your own Azure subscription in the [get started article](dotnet-sdk-azure-get-started.md). The [concepts article](dotnet-sdk-azure-concepts.md) goes into the conventions the SDK uses and how to leverage them to simplify your application code. New features, breaking changes, and migration instructions are available in the [release notes](dotnet-sdk-azure-release-notes.md).

## Samples

The following samples cover common automation tasks with the Azure libraries for .NET:

- [Virtual machines](dotnet-sdk-azure-virtual-machine-samples.md)
- [Web apps](dotnet-sdk-azure-web-apps-samples.md)
- [SQL Database](dotnet-sdk-azure-sql-database-samples.md)

A unified [reference](https://docs.microsoft.com/dotnet/api) is available for all packages in both the service and management libraries. New features, breaking changes, and migration instructions are available in the [release notes](dotnet-sdk-azure-release-notes.md).

[!include[Contribute and community](includes/contribute.md)]