---
title: Migrate your .NET web app or service to Azure App Service
description: Learn how to migrate a .NET web app or service from on-premises to Azure App Service.
keywords: Azure .NET, ASP.NET, WCF, App Service, Web App, migrate, migration
author: camsoper
manager: wpickett
ms.author: casoper
ms.date: 07/16/2018
ms.topic: article
ms.technology: azure
ms.devlang: dotnet
ms.service: app-service
ms.custom: devcenter
---

# Migrate your .NET web app or service to Azure App Service 

Most ASP.NET websites (Webforms, MVC) and services (Web API, WCF) can move directly to Azure App Service with no changes. Some may need minor changes while others may need some refactoring.

## Port Bindings

Azure App Service supports port 80 for HTTP and port 443 for HTTPS traffic.

For WCF, the following bindings are supported:

Binding | Notes
--------|--------
BasicHttp | 
WSHttp | 
WSDualHttpBinding | Requires message security. Web socket support must be enabled for the App Service.
NetHttpBinding | Web socket support must be enabled for the App Service.
NetHttpsBinding | Web socket support must be enabled for the App Service.
BasicHttpContextBinding |
WebHttpBinding |
WSHttpContextBinding |

## Authentication

Azure App Service supports anonymous authentication by default and Forms authentication when intended. Windows authentication can be used by integrating with Azure Active Directory and ADFS only. [Learn more about how to integrate your on-premises directories with Azure Active Directory](https://docs.microsoft.com/azure/active-directory/connect/active-directory-aadconnect).

## Assemblies in the GAC (Global Assembly Cache) 

This isn't supported. Consider local copy assemblies to \bin. Custom .MSIs installed on the server (e.g. PDF generators, etc.) cannot be used.  

## IIS settings
Everything traditionally configured via applicationHost.config in your application can now be configured through the Azure portal. This applies to AppPool bitness, enable/disable websockets, managed pipeline version, .NET Framework version (2.0/4.0), etc. To modify your [application settings](https://docs.microsoft.com/azure/app-service/web-sites-configure), navigate to the [Azure portal](https://portal.azure.com), open the blade for your web app, and then select the **Application Settings** tab.

### IIS5 Compatibility Mode
IIS5 Compatibility Mode is not supported. In Azure App Service each Web App and all of the applications under it run in the same worker process with a specific set of [application pool](http://technet.microsoft.com/en-us/library/cc735247(v=WS.10).aspx).

### IIS7+ Schema Compliance:  
Some elements and attributes are not defined in the Azure App Service IIS schema. If you encounter issues, consider using [XDT transforms](http://azure.microsoft.com/documentation/articles/web-sites-transform-extend/).

### Single Application Pool Per Site  
In Azure App Service each Web App and all of the applications under it run in the same application pool. Consider establishing a single application pool with common settings or creating a separate Web App for each application.

## COM and COM+ components  
Azure App Service does not allow the registration of COM components on the platform. If your app makes use of any COM components, these would need to be rewritten in managed code and deployed with the site or application.  

## Physical directories 
Azure App Service does not allow physical drive access. You may need to use a [Azure Files](https://docs.microsoft.com/azure/storage/files/storage-files-introduction) to access files via SMB. [Azure Blob Storage](https://docs.microsoft.com/azure/storage/blobs/storage-blobs-introduction) can store files for access via HTTPS. 

## On-premise resources

Verify access to on-premise resources as these may need to be migrated or changed. The following are options for mitigating access to on-premise resources:

* Create a VPN connecting App Service to on-premise resources using [Azure Virtual Networks](https://docs.microsoft.com/en-us/azure/app-service/web-sites-integrate-with-vnet).
* Securely expose on-premise services to the cloud without firewall changes using [Azure Relay](https://docs.microsoft.com/en-us/azure/service-bus-relay/relay-what-is-it).
* Migrate certain other dependencies, such as a [SQL database](https://go.microsoft.com/fwlink/?linkid=863217), to Azure.
* Use platform-as-a-service offerings in the cloud to reduce dependecies. For example, rather than connect to an on-premise mail server, consider using [SendGrid](https://docs.microsoft.com/en-us/azure/sendgrid-dotnet-how-to-send-email). 

## ISAPI Filters  
Azure App Service can support the use of ISAPI Filters, however, the ISAPI DLL must be deployed with your site and registered via web.config.  

## HTTPS bindings and SSL 
HTTPS bindings will not be migrated, nor will the SSL certificates associated with your web sites. [SSL certificates can be manually uploaded](https://docs.microsoft.com/azure/app-service/app-service-web-tutorial-custom-ssl) after site migration is completed, however.  

## SharePoint and FrontPage 
SharePoint and FrontPage Server Extensions (FPSE) are not supported.

## Web site size  
Free sites have a size limit of 1 GB of content. If your site is greater than 1 GB, you must upgrade to a paid SKU. See [App Service pricing](https://azure.microsoft.com/pricing/details/app-service/windows/). 

## Database size  
For SQL Server databases, please check the current [SQL Database pricing](http://azure.microsoft.com/pricing/details/sql-database).  

## Azure Active Directory (AAD) integration  
AAD does not work with free apps. To use AAD, you must upgrade the app SKU. See [App Service pricing](https://azure.microsoft.com/pricing/details/app-service/windows/).

## Monitoring and Diagnostics
Your current on-premises solutions for monitoring and diagnostics are unlikely to work in the cloud. However, Azure provides tools for logging, monitoring, and diagnostics so that you can identify and debug issues with web apps. You can easily enable diagnostics for your web app in its configuration, and you can view the logs recorded in Azure Application Insights. [Learn more about enabling diagnostics logging for web apps](https://docs.microsoft.com/azure/app-service/web-sites-enable-diagnostic-log).

## Connection Strings and application settings
Consider using [Azure KeyVault](https://docs.microsoft.com/azure/key-vault/), a service that securely stores sensitive information used in your application. Alternatively, you can store this data as an App Service setting.

## DNS
You may need to update DNS configurations based on the requirements of your application. These DNS settings can be configured in the App Service [custom domain settings](https://docs.microsoft.com/azure/app-service/app-service-web-tutorial-custom-domain). 

## Azure App Service with Windows Containers
If your app cannot be migrated directly to App Service, consider App Service using Windows Containers (%TODO%: Link), which enables usage of the GAC, COM components, MSIs, full access to .NET FX APIs, DirectX, and more.

## Additional Reading

* [How to determine if your app qualifies for App Service](https://azure.microsoft.com/downloads/migration-assistant/)
* [Moving your database to the cloud](https://go.microsoft.com/fwlink/?linkid=863217)

## Next steps

> [!div class="nextstepaction"]
> [Migrate an ASP.NET Web application to Azure App Service](https://aka.ms/azure-webapp-migrate)
