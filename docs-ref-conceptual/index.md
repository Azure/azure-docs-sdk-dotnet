---
title: Azure for .NET developers - Tutorials, API Reference | Microsoft Docs
description: Tools, SDKs, tutorials, and samples to help you create and deploy .NET apps to Azure.
keywords: Azure, .NET, SDK, API, NuGet
author: camsoper
ms.author: casoper
manager: douge
layout: LandingPage
ms.date: 06/20/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.service: multiple
---

# Azure for .NET developers

<ul class="panelContent">
    <li> 
        <div class="cardSize">
            <div class="cardPadding">
                <div class="card">
                    <div class="cardText">
                        <a href="dotnet-tools.md">
                            <h2>Tools</h2>
                            <span>Download Azure tools and plugins.</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </li>
    <li>
        <div class="cardSize">
            <div class="cardPadding">
                <div class="card">
                    <div class="cardText">
                        <a href="dotnet-sdk-azure-install.md">
                            <h2>Libraries</h2>
                            <span>Use services and manage Azure resources.</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </li>
</ul>

## Manage Azure resources

Import the [Azure management libraries for .NET](dotnet-sdk-azure-install.md) to manage your Azure resources with an easy-to-use [fluent API](dotnet-sdk-azure-concepts.md). 

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

[Get started with the Azure management libraries for .NET](dotnet-sdk-azure-get-started.md)

## Five-minute quickstarts

Create and deploy an app using your favorite tools in five minutes.

* [Visual Studio](dotnet-quickstart-vs.md)
* [Command line](dotnet-quickstart-xplat.md)

## Tutorials and samples

Complete walkthroughs for app creation and deployment.

* [App Service](/azure/app-service-web/app-service-web-get-started-dotnet?toc=%2fdotnet%2fazure%2ftoc.json&bc=%2fdotnet%2fazure_breadcrumb%2ftoc.json)
* [SQL Database](/azure/sql-database/sql-database-connect-query-dotnet?toc=%2fdotnet%2fazure%2ftoc.json&bc=%2fdotnet%2fazure_breadcrumb%2ftoc.json)
* [CosmosDB](/azure/cosmos-db/documentdb-dotnet-application?toc=%2fdotnet%2fazure%2ftoc.json&bc=%2fdotnet%2fazure_breadcrumb%2ftoc.json)
* [Azure Storage](/azure/storage/storage-dotnet-how-to-use-blob-storage?toc=%2fdotnet%2fazure%2ftoc.json&bc=%2fdotnet%2fazure_breadcrumb%2ftoc.json)
* [Redis Cache](/azure/redis-cache/cache-web-app-howto?toc=%2fdotnet%2fazure%2ftoc.json&bc=%2fdotnet%2fazure_breadcrumb%2ftoc.json)