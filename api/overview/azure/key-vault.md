---
title: Azure Key Vault libraries for .NET
description: Reference for Azure Key Vault libraries for .NET
ms.date: 03/04/2020
ms.topic: reference
ms.service: key-vault
---

# Azure Key Vault libraries for .NET

## Overview

Azure Key Vault helps safeguard cryptographic keys and secrets used by cloud applications and services.  Read more at [What is Key Vault?](/azure/key-vault/key-vault-whatis,) then learn how to use the SDK at [Get started with the Azure Key Vault client library for .NET (SDK v4)](/azure/key-vault/quick-create-net).

## Client library

Client libraries to manage keys, secrets and certificates can be installed from NuGet, either directly from the Visual Studio [Package Manager console](/nuget/consume-packages/install-use-packages-powershell) or with the [.NET Core CLI](/dotnet/core/tools/).

- [Azure.Security.KeyVault.Keys](https://www.nuget.org/packages/Azure.Security.KeyVault.Keys/)
- [Azure.Security.KeyVault.Secrets](https://www.nuget.org/packages/Azure.Security.KeyVault.Secrets/)
- [Azure.Security.KeyVault.Certificates](https://www.nuget.org/packages/Azure.Security.KeyVault.Certificates/)

#### Visual Studio Package Manager

```powershell
Install-Package Azure.Security.KeyVault.Keys
Install-Package Azure.Security.KeyVault.Secrets
Install-Package Azure.Security.KeyVault.Certificates
```

```dotnetcli
dotnet add package Azure.Security.KeyVault.Keys
dotnet add package Azure.Security.KeyVault.Secrets
dotnet add package Azure.Security.KeyVault.Certificates
```

### Example

The following example uses [Azure.Security.KeyVault.Secrets](https://www.nuget.org/packages/Azure.Security.KeyVault.Secrets/) to retrieve the secret for a specific key that is identified in the application settings.

```csharp
var client = new SecretClient(new Uri(kvUri), new DefaultAzureCredential());

KeyVaultSecret secret = client.GetSecret(secretName);

// secret.Value holds the secret
```

> [!div class="nextstepaction"]
> [Explore the client APIs](/dotnet/api/overview/azure/keyvault/client)

## Management library

Use the management library to create, delete, and query key vaults.

Install the [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.Management.KeyVault.Fluent) directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].

#### Visual Studio Package Manager

```powershell
Install-Package Microsoft.Azure.Management.KeyVault.Fluent
```

```dotnetcli
dotnet add package Microsoft.Azure.Management.KeyVault.Fluent
```

### Example

The following example demonstrates how to create a new key vault for a given resource group and location.

```csharp
using (KeyVaultManagementClient client = new KeyVaultManagementClient(
    new TokenCloudCredentials(subscriptionId, accessToken)))
{
    client.Vaults.CreateOrUpdate(resourceGroupName, "myKeyVault", new VaultCreateOrUpdateParameters
    {
        Properties = new VaultProperties
        {
            EnabledForDeployment = true,
            EnabledForDiskEncryption = true,
            EnabledForTemplateDeployment = true,
            Location = resourceGroupLocation,
            // SKU level, access policies, tenants, etc.
        }
    });
}
```

> [!div class="nextstepaction"]
> [Explore the management APIs](/dotnet/api/overview/azure/keyvault/management)

## Samples

* [Download the Azure Key Vault client samples](https://www.microsoft.com/download/details.aspx?id=45343)
* [Getting Started with Azure Client Side Encryption in .NET](https://azure.microsoft.com/resources/samples/storage-dotnet-client-side-encryption/)


Explore more [sample .NET code](https://azure.microsoft.com/resources/samples/?platform=dotnet) you can use in your apps.

[PackageManager]: https://docs.microsoft.com/nuget/tools/package-manager-console
[DotNetCLI]: https://docs.microsoft.com/dotnet/core/tools/dotnet-add-package
