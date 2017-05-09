---
title: Azure management libraries for .NET web apps samples
description: Get sample code for creating and updating Azure Web Apps using the Azure management libraries for .NET.
keywords: Azure, .NET, SDK, API, SQL, database
author: camsoper
ms.author: casoper
manager: douge
ms.date: 05/08/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.service: multiple
ms.assetid: 
---

# Azure management libraries for .NET samples for web apps

This article links to source you can use to create and configure Azure Web Apps.

[!include[Sample prerequisites](includes/sample-prereqs.md)]

## Manage web app source control

Deploy four web apps using different methods, including FTP and Git.  Requires the Git command line client on your PATH.

```cmd
git clone https://github.com/Azure-Samples/app-service-dotnet-configure-deployment-sources-for-web-apps.git
```

## Manage deployment slots

Create a web app and deploy to staging slots, then swap between slots.

```cmd
git clone https://github.com/Azure-Samples/app-service-dotnet-manage-staging-and-production-slots-for-web-apps.git
```

## Manage web app with custom domain SSL

Create an Azure Web App with a custom domain and self-signed SSL certificate.

```cmd
git clone https://github.com/Azure-Samples/app-service-dotnet-manage-web-apps-with-custom-domains.git
```

## Scale a web app with high availability across regions

Use Traffic Manager to load-balance multiple web app instances and scale for additional capacity.

```cmd
git clone https://github.com/Azure-Samples/app-service-dotnet-scale-web-apps.git
```

## Connect a web app to a storage account

Create an Azure storage account and add the storage account connection string to the app settings.

```cmd
git clone https://github.com/Azure-Samples/app-service-dotnet-manage-storage-connections-for-web-apps.git
```

## Deploy a web app with a SQL database

Create an Azure SQL Database, deploy a web app using the database, and configure the database firewall.

```cmd
git clone https://github.com/Azure-Samples/app-service-dotnet-manage-data-connections-for-web-apps.git
```

[!include[More samples](includes/more-samples.md)]