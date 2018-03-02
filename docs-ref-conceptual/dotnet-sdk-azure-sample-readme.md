---
title: Azure management libraries for .NET sample instructions
description: Get sample code for creating and updating resources using the Azure management libraries for .NET.
keywords: Azure, .NET, SDK, API, sample, example
author: camsoper
ms.author: casoper
manager: wpickett
ms.date: 10/19/2017
ms.topic: reference
ms.technology: azure
ms.devlang: dotnet
ms.service: multiple
ms.custom: devcenter
---

# Azure management libraries for .NET sample instructions

This article describes the prerequisites and authentication required for running the samples for the Azure management libraries for .NET.

## Prerequisties 

* [Visual Studio 2017](https://www.visualstudio.com/vs/) or [.NET Core SDK](https://www.microsoft.com/net/download/core)
* A [Microsoft Azure subscription](https://azure.microsoft.com/free/)
* [Git command line client](https://git-scm.com/)
* [Azure PowerShell](/powershell/azure/install-azurerm-ps)

## Authentication for all samples

[!include[Create service principal](includes/create-sp.md)]

[!include[File-based authentication](includes/file-based-auth.md)]

## Running the samples

Once you have used Git to clone the sample, you can open the sample in Visual Studio and run the sample using the IDE.  Alternatively, use the .NET Core SDK to build and run the sample from the command line, like this:

```cmd
git clone https://github.com/Azure-Samples/app-service-dotnet-configure-deployment-sources-for-web-apps.git
cd app-service-dotnet-configure-deployment-sources-for-web-apps
dotnet restore
dotnet run
```