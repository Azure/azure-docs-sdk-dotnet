---
title: Authenticate with the Azure Management Libraries for .NET
description: Authenticate with a service principal into the Azure Management Libraries for .NET
keywords: Azure, .NET, SDK, API, authentication, active directory, service principal
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

# Authenticate with the Azure Management Libraries for .NET

## Authenticate with AzureTokenCredentials

TBD

## File-based authentication

The simplest way to authenticate is to create a `*.properties` file that contains credentials for an [Azure service principal](/azure/active-directory/develop/active-directory-application-objects).

```text
# sample management library properties file
subscription=########-####-####-####-############
client=########-####-####-####-############
key=XXXXXXXXXXXXXXXX
tenant=########-####-####-####-############
managementURI=https://management.core.windows.net/
baseURL=https://management.azure.com/
authURL=https://login.windows.net/
graphURL=https://graph.windows.net/
```

- subscription: use the *id* value from `az account show` in the Azure CLI 2.0.
- client: use the *appId* value from the output taken from a service principal output.
- key: use the *password* value from the service principal output .
- tenant: use the *tenant* value from the service principal output.

Save this file in a secure location on your system where your code can read it. Set an environment variable named `AZURE_AUTH_LOCATION` with the full path to the file, for example:

![System environment variable dialog](media/dotnet-sdk-azure-authenticate/environment-var.png)

Create the entry point `Azure` object to start working with the API:

```csharp
// pull in the location of the authenticaiton properties file from the environment 
var credentials = SdkContext.AzureCredentialsFactory
    .FromFile(Environment.GetEnvironmentVariable("AZURE_AUTH_LOCATION"));

var azure = Azure
    .Configure()
    .WithLogLevel(HttpLoggingDelegatingHandler.Level.Basic)
    .Authenticate(credentials)
    .WithDefaultSubscription();
```