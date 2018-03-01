---
title: Migrate an ASP.NET web application to Azure App Service
description: Learn how to migrate an ASP.NET web application from on-premises to Azure App Service.
keywords: Azure .NET, ASP.NET, App Service, Web App, migrate, migration
author: camsoper
manager: wpickett
ms.author: casoper
ms.date: 11/15/2017
ms.topic: article
ms.technology: azure
ms.devlang: dotnet
ms.service: app-service
ms.custom: devcenter
---

# Migrate an ASP.NET web application to Azure App Service

[App Service](https://docs.microsoft.com/azure/app-service/app-service-web-overview#why-use-web-apps) is a fully-managed compute platform service that is optimized for hosting scalable websites and web applications. This document provides information on how to lift-and-shift an existing application to Azure App Service, modifications to consider, and additional resources for moving to the cloud.

Ready to get started? [Publish your ASP.NET + SQL application to Azure App Service](https://go.microsoft.com/fwlink/?linkid=863214).

# Preparation   
* [How to determine if your app qualifies for App Service](https://azure.microsoft.com/downloads/migration-assistant/)
* [Moving your database to the cloud](https://go.microsoft.com/fwlink/?linkid=863217)

# Considerations
There are several factors you must consider before migrating your application. Below is a list of potential modifications you might have to make to your application, and how to go about doing them.

## SQL Database configuration
If your application is using an on-premises database, you have several options for your web app. [Read more about migrating SQL databases to Azure](https://go.microsoft.com/fwlink/?linkid=863217).

## IIS
Everything traditionally configured via applicationHost.config in your application can now be configured through the Azure portal. This applies to AppPool bitness, enable/disable websockets, managed pipeline version, .NET Framework version (2.0/4.0), etc. To modify your [application settings](https://docs.microsoft.com/azure/app-service/web-sites-configure), navigate to the [Azure portal](https://portal.azure.com), open the blade for your web app, and then select the **Application Settings** tab.

## Authentication
If your application authenticates users at any point, you will have to modify this functionality to work once the application deployed on Azure Web Apps. One possibility is to use Azure AD Connect to integrate your on-premises directories with Azure Active Directory. [Learn more about how to integrate your on-premises directories with Azure Active Directory](https://docs.microsoft.com/azure/active-directory/connect/active-directory-aadconnect).

## Virtual Network Modification
If you use more than one Azure service you may consider using a virtual network to securely communicate between these services. You can configure a connection from your on-premises network to an [Azure Virtual Network](https://docs.microsoft.com/azure/app-service/web-sites-integrate-with-vnet) using VPN or ExpressRoute.

## Monitoring and Diagnostics
Your current on-premises solutions for monitoring and diagnostics are unlikely to work in the cloud. However, Azure provides tools for logging, monitoring, and diagnostics so that you can identify and debug issues with web apps. You can easily enable diagnostics for your web app in its configuration, and you can view the logs recorded in Azure Application Insights. [Learn more about enabling diagnostics logging for web apps](https://docs.microsoft.com/azure/app-service/web-sites-enable-diagnostic-log).

## Connection Strings and application settings
One option for keeping information safe is to use [Azure KeyVault](https://docs.microsoft.com/azure/key-vault/), a service that securely stores sensitive information used in your application. Alternatively, you can store this data as an App Service setting.

## DNS
You may need to update DNS configurations based on the requirements of your application. These DNS settings can be configured in the App Service [custom domain settings](https://docs.microsoft.com/azure/app-service/app-service-web-tutorial-custom-domain). Another factor to consider is [binding an existing custom SSL certificate](https://docs.microsoft.com/azure/app-service/app-service-web-tutorial-custom-ssl).

## File system and Storage
If your application persists data, you will need to update it to use Azure Storage instead. Azure Storage is a service that provides file shares for sharing via SMB protocol, blob storage, simple queues, and non-relational tables. [Learn more about Azure Storage file shares](https://docs.microsoft.com/azure/storage/files/storage-files-introduction).

## Next steps

> [!div class="nextstepaction"]
> [Migrate an ASP.NET Web application to Azure App Service](https://aka.ms/azure-webapp-migrate)
