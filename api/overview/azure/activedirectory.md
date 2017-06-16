---
title: Azure Active Directory libraries for .NET
description: Reference for Azure Active Directory libraries for .NET
keywords: Azure, .NET, SDK, API, AAD, Active Directory
author: camsoper
ms.author: casoper
manager: douge
ms.date: 06/20/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.service: multiple
---

# Azure Active Directory libraries for .NET

## Overview

Sign-on users to web apps and control access to API and applications with Azure Active Directory. The [Azure Active Directory authentication library (ADAL) for .NET](https://github.com/AzureAD/azure-activedirectory-library-for-dotnet) provides an interface to set up OAuth2, OpenID Connect, and Active Directory Graph API authentication flows and provides support for single sign-on with [SAML 2.0](https://docs.microsoft.com/azure/active-directory/develop/active-directory-saml-protocol-reference).

The management libraries provide an interface to configure [role based access control](https://docs.microsoft.com/azure/active-directory/role-based-access-control-what-is) and assign identities (such as users and [service principals](https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-application-objects)) to those roles.

## Import the libraries

### Visual Studio 

In the [Package Manager](https://docs.microsoft.com/dotnet/azure/dotnet-sdk-azure-install?view=azure-dotnet) window, use the following cmdlet:

```powershell
Install-Package Microsoft.IdentityModel.Clients.ActiveDirectory
``` 

### .NET Core command line

Execute the following command in your project directory:

```bash
dotnet add package Microsoft.IdentityModel.Clients.ActiveDirectory
```

## Example

Retrieve an access token for a desktop application.

```csharp
AuthenticationResult result = null;
try
{
    result = await authContext.AcquireTokenAsync(graphResourceId, clientId, redirectUri, new PlatformParameters(PromptBehavior.Auto));
}
catch (AdalException ex)
{
    // An unexpected error occurred, or user canceled the sign in.
    if (ex.ErrorCode != "access_denied")
        MessageBox.Show(ex.Message);

    return;
}
```

## Samples

Explore the full collection of [Azure Active Directory code samples](https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-code-samples).