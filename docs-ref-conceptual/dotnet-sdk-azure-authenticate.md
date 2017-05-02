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

[!include[File-based authentication](includes/file-based-auth.md)]

Create the entry point `Azure` object to start working with the API:

```csharp
// pull in the location of the authenticaiton properties file from the environment 
var credentials = SdkContext.AzureCredentialsFactory
    .FromFile(Environment.GetEnvironmentVariable("AZURE_AUTH_LOCATION"));

var azure = Azure
    .Configure()
    .Authenticate(credentials)
    .WithDefaultSubscription();
```