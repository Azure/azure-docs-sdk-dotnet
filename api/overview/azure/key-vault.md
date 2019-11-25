---
title: Azure Key Vault libraries for .NET
description: Reference for Azure Key Vault libraries for .NET
ms.date: 11/25/2019
ms.topic: reference
ms.service: key-vault
---

# Azure Key Vault libraries for .NET

## Overview

Azure Key Vault helps safeguard cryptographic keys and secrets used by cloud applications and services.

Read more about [What is Key Vault?](/azure/key-vault/key-vault-whatis) then [Get started with Azure Key Vault](/azure/key-vault/key-vault-get-started) or learn how to [Use Key Vault from a web app](/azure/key-vault/key-vault-use-from-web-application).

## Client library

Use the client library to manage keys and related assets such as certificates and secrets.

Install the NuGet packages: [Key Vault Keys](https://www.nuget.org/packages/Azure.Security.KeyVault.Keys), 
[Key Vault Secrets](https://www.nuget.org/packages/Azure.Security.KeyVault.Secrets), [Azure Identity](https://www.nuget.org/packages/Azure.Identity) 
You can install directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].

#### Visual Studio Package Manager

```powershell
Install-Package Azure.Identity
Install-Package Azure.Security.KeyVault.Keys
Install-Package Azure.Security.KeyVault.Secrets
```

### Example

The following example retrieves the secret for a specific key that is identified in the application settings.

```csharp
using System;
using Azure.Identity;
using Azure.Security.KeyVault.Secrets;
using Azure.Security.KeyVault.Keys;

// Create a new secret client using the default credential from Azure.Identity 
var secret_client = new SecretClient(vaultUri: new Uri("https://<vaultname>.vault.azure.net"), credential: new DefaultAzureCredential());

// Retrieve a secret using the secret client.
secret = secret_client.GetSecret(WebConfigurationManager.AppSettings["SecretUri"]);
```
Explore more with the links below

| Service | Package | Readme | Samples | API Reference | Changelog |
| ------- | ------- | ------ | ------- | ------------- | --------- |
| Key Vault - Keys | [Azure.Security.KeyVault.Keys - 4.0.0](https://www.nuget.org/packages/Azure.Security.KeyVault.Keys/4.0.0) | [ReadMe](https://github.com/Azure/azure-sdk-for-net/blob/Azure.Security.KeyVault.Keys_4.0.0/sdk/keyvault/Azure.Security.KeyVault.Keys/README.md) | [Samples](https://github.com/Azure/azure-sdk-for-net/blob/Azure.Security.KeyVault.Keys_4.0.0/sdk/keyvault/Azure.Security.KeyVault.Keys/samples) | [Api Reference](https://azuresdkdocs.blob.core.windows.net/$web/dotnet/Azure.Security.KeyVault.Keys/4.0.0/api/index.html) | [ChangeLog](https://github.com/Azure/azure-sdk-for-net/blob/Azure.Security.KeyVault.Keys_4.0.0/sdk/keyvault/Azure.Security.KeyVault.Keys/ChangeLog.md) |
| Key Vault - Secrets | [Azure.Security.KeyVault.Secrets - 4.0.0](https://www.nuget.org/packages/Azure.Security.KeyVault.Secrets/4.0.0) | [ReadMe](https://github.com/Azure/azure-sdk-for-net/blob/Azure.Security.KeyVault.Secrets_4.0.0/sdk/keyvault/Azure.Security.KeyVault.Secrets/README.md) | [Samples](https://github.com/Azure/azure-sdk-for-net/blob/Azure.Security.KeyVault.Secrets_4.0.0/sdk/keyvault/Azure.Security.KeyVault.Secrets/samples) | [Api Reference](https://azuresdkdocs.blob.core.windows.net/$web/dotnet/Azure.Security.KeyVault.Secrets/4.0.0/api/index.html) | [ChangeLog](https://github.com/Azure/azure-sdk-for-net/blob/Azure.Security.KeyVault.Secrets_4.0.0/sdk/keyvault/Azure.Security.KeyVault.Secrets/ChangeLog.md) |


> [!div class="nextstepaction"]
> [Get Started with the client APIs](/azure/key-vault/quick-create-net)

## Management library

Use the management library to create, delete, and query key vaults.

Install the [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.Management.KeyVault.Fluent) directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].

#### Visual Studio Package Manager

```powershell
Install-Package Microsoft.Azure.Management.KeyVault.Fluent
```

```bash
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
