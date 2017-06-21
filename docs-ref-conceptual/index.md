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

<ul class="cardsY panelContent">
    <li>
        <a href="dotnet-tools.md">
            <div class="cardSize">
                <div class="cardPadding">

                    <div class="card" style="height: 84px">
                        <div class="cardImageOuter">
                            <div class="cardImage" style="margin-top: 12px">
                                <img src="/media/common/i_tools.svg" alt="" />
                            </div>
                        </div>
                        <div class="cardText">
                            <h3 style="margin-bottom: 0; font-size: 24px">Tools</h3>
                            <p style="font-size: 1rem">Download Azure tools and plugins</p>
                        </div>
                    </div>
                </div>
            </div>
        </a>
    </li>
    <li>
        <a href="dotnet-sdk-azure-install.md">
            <div class="cardSize">
                <div class="cardPadding">
                    <div class="card" style="height: 84px">
                        <div class="cardImageOuter">
                            <div class="cardImage" style="margin-top: 12px">
                                <img src="/media/common/i_reference.svg" alt="" />
                            </div>
                        </div>
                        <div class="cardText">
                            <h3 style="margin-bottom: 0; font-size: 24px">Libraries</h3>
                            <p style="font-size: 1rem">Use services and manage Azure resources</p>
                        </div>
                    </div>
                </div>
            </div>
        </a>
    </li>
    <li>
        <a href="https://docs.microsoft.com/azure/virtual-machines/windows/tutorial-vsts-iis-cicd">
            <div class="cardSize">
                <div class="cardPadding">
                    <div class="card" style="height: 84px">
                        <div class="cardImageOuter">
                            <div class="cardImage" style="margin-top: 12px">
                                <img src="/media/common/i_deploy.svg" alt="" />
                            </div>
                        </div>
                        <div class="cardText">
                            <h3 style="margin-bottom: 0; font-size: 24px">Team Services CI/CD</h3>
                            <p style="font-size: 1rem">Deploy with Visual Studio Team Services</p>
                        </div>
                    </div>
                </div>
            </div>
        </a>
    </li>
</ul>

## Five-minute Quickstarts

Learn how to build .NET apps with Azure services.

* [Deploy a ASP.NET web app](/azure/app-service-web/app-service-web-get-started-dotnet)
* [Connect to Azure SQL Database](/azure/sql-database/sql-database-connect-query-dotnet)
* [Build a NoSQL app with CosmosDB](/azure/cosmos-db/documentdb-dotnet-application)

## Free PluralSight video training

<ul class="panelContent cardsW">
   <li>
      <div class="cardSize">
         <div class="cardPadding">
            <div class="card">
               <div class="cardImageOuter">
                  <div class="cardImage">
                     <a href="https://www.pluralsight.com/courses/developing-dotnet-microsoft-azure-getting-started?twoid=d6abac77-7dcc-4d33-9e03-f85e78989f02" data-linktype="external">
                     <img alt="" src="https://docs.microsoft.com/azure/app-service-web/media/index/video-training-dotnet.png" data-linktype="external"></a>
                  </div>
               </div>
               <div class="cardText">
                  <p>
                     <a href="https://www.pluralsight.com/courses/developing-dotnet-microsoft-azure-getting-started?twoid=d6abac77-7dcc-4d33-9e03-f85e78989f02" data-linktype="external">Developing with .NET</a>
                  </p>
               </div>
            </div>
         </div>
      </div>
   </li>
</ul>

## Manage Azure resources

Install our easy-to-use fluent [.NET APIs](dotnet-sdk-azure-install.md) to manage Azure resources. 

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


## Tutorials

Learn how to use Azure services and tools in your .NET apps.

* [ASP.NET with SQL Database](/azure/app-service-web/app-service-web-tutorial-dotnet-sqldatabase)
