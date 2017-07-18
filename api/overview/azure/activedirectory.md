---
title: Azure Active Directory libraries for .NET
description: Reference for Azure Active Directory libraries for .NET
keywords: Azure, .NET, SDK, API, AAD, Active Directory
author: camsoper
ms.author: casoper
manager: douge
ms.date: 07/17/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.service: multiple
---

# Azure Active Directory libraries for .NET

## Overview

Sign-on users and manage access to applications and APIs with Azure Active Directory.

To get started with Azure Active Directory, see [ASP.NET web app sign-in and sign-out with Azure AD](https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-devquickstarts-webapp-dotnet).

## Client library

Connect and authenticate users or applications over OAuth2, OpenID Connect, Active Directory Graph API authentication or [SAML 2.0](https://docs.microsoft.com/azure/active-directory/develop/active-directory-saml-protocol-reference).

Install the [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.Management.AppService.Fluent) directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].

#### Visual Studio Package Manager

```powershell
Install-Package Microsoft.IdentityModel.Clients.ActiveDirectory
```

#### .NET Core CLI

```bash
dotnet add package Microsoft.IdentityModel.Clients.ActiveDirectory
```

### Example

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

[!div class="nextstepaction"]
[Explore the client APIs](/dotnet/api/overview/azure/activedirectory/client)

### Samples

* [Use OpenID Connect to authenticate users from an Azure AD tenant][1]
* [Use Oauth2 to call a web API with application permissions][2]
* [Use role-based access control (RBAC) in an application][3]

Explore the full collection of [Azure Active Directory code samples](https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-code-samples).

[1]: [https://azure.microsoft.com/en-us/resources/samples/active-directory-dotnet-webapp-openidconnect/]
[2]: [https://azure.microsoft.com/en-us/resources/samples/active-directory-dotnet-webapp-webapi-oauth2-appidentity/]
[3]: [https://azure.microsoft.com/en-us/resources/samples/active-directory-dotnet-webapp-roleclaims/]
[PackageManager]: https://docs.microsoft.com/nuget/tools/package-manager-console
[DotNetCLI]: https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-add-package