---
title: Azure tools for Visual Studio 2015
description: Get the tools to start using the Azure .NET libraries from Visual Studio 2015.
keywords: Azure .NET, SDK, VS2015, Visual Studio 2015
author: camsoper
manager: douge
ms.author: casoper
ms.date: 07/7/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
---

# Azure tools for Visual Studio 2015

The **Azure SDK for Visual Studio 2015** and **Service Fabric SDK and Tools for Visual Studio 2015** can be downloaded and installed as individual components from the [Azure Downloads page](https://azure.microsoft.com/downloads/) or they can be installed concurrently using [Web Platform Installer](https://www.microsoft.com/web/downloads/platform.aspx).  The Microsoft Web Platform Installer is a free tool that streamlines downloading, installing, and updating the components of the Microsoft Web Platform, including Azure tools.

## Using the Web Platform Installer

1. Download and run [Web Platform Installer site](http://go.microsoft.com/fwlink/?LinkId=255386).

2. On the **Spotlight** tab, click the **Add** buttons next to **Microsoft Azure Service Fabric SDK and Tools - x.x.xxx (VS2015)** and **Microsoft Azure SDK for .NET (VS2015) - x.x.x**, and then click the **Install** button.

    ![Web PI](media\dotnet-sdk-vs2015-install\webpi.png)

3. On the next screen, click **I Accept**.  Web PI will begin downloading and installing the components you selected.

4. After the installation is finished, it will display a confirmation screen.  Click **Finish**.  You can now close Web Platform Installer.

## Verifying the installation

1. In Visual Studio 2015, click the **Tools** menu, and then click **Extensions and Updates...**.

2. The displayed list will contain several Azure tools, such as **Microsoft Azure App Service Tools**, **Microsoft Azure Storage Connected Service**, and **Service Fabric Tools**.

    ![Extensions and updates](media\dotnet-sdk-vs2015-install\ext-tools.png)

## Next steps

[Get started with Azure libraries for .NET](dotnet-sdk-azure-get-started.md).

