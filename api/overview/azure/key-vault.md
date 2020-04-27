---
title: Azure Key Vault  libraries for .NET
description: Reference for Azure Key Vault libraries for .NET
ms.date: 03/04/2020
ms.topic: reference
ms.service: key-vault
---

# Azure Key Vault libraries for .NET

Azure Key Vault helps safeguard cryptographic keys and secrets used by cloud applications and services.  Read more at [What is Key Vault?](/azure/key-vault/key-vault-whatis,) then learn how to use the SDK at [Get started with the Azure Key Vault client library for .NET (SDK v4)](/azure/key-vault/quick-create-net).

## Libraries for data access

The latest version of the Azure Key Vault library is version 12.x. Microsoft recommends using version 12.x for new applications.

If you cannot update existing applications to version 12.x, then Microsoft recommends using version 11.x.

### Version 12.x

The version 12.x client libraries for .NET are part of the Azure SDK for .NET. The source code for the Key Vault libraries for .NET is available on [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/keyvault).

Use the following version 12.x libraries to work with certificates, keys, and secrets:

| Library | Reference | Package | Source |
|----------------------------------------|-------------------------------------------------------------|-----------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|
|    Azure.Security.KeyVault.Certificates    |      [Reference](/dotnet/api/azure.security.keyvault.certificates)       |    [Nuget](https://www.nuget.org/packages/Azure.Security.KeyVault.Certificates/)    |    [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/keyvault/Azure.Security.KeyVault.Certificates)    |
|    Azure.Security.KeyVault.Keys    |     [Reference](/dotnet/api/azure.security.keyvault.keys)    |    [Nuget](https://www.nuget.org/packages/Azure.Security.KeyVault.Keys/)      |     [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/keyvault/Azure.Security.KeyVault.Keys)|
|    Azure.Security.KeyVault.Secrets    |    [Reference](/dotnet/api/azure.security.keyvault.secrets)    |    [Nuget](https://www.nuget.org/packages/Azure.Security.KeyVault.Secrets/)    |    [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/keyvault/Azure.Security.KeyVault.Secrets)    |
|    Azure.Security.KeyVault.Shared    |         |        |    [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/keyvault/Azure.Security.KeyVault.Shared)    |

### Version 11.x

The source code for the Azure Key Vault libraries for .NET is available on [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/keyvault).

Use the following version 11.x libraries to work with certificates, keys, and secrets:

| Library | Reference | Package | Source |
|--------------------------------------|---------------------------------------------------------------|-------------------------------------------------------------------------------|-------------------------------------------------------------------------------|
|    Microsoft.Azure.KeyVault.Core/src    |    [Reference](/dotnet/api/microsoft.azure.keyvault.core)    |    [Nuget](https://www.nuget.org/packages/Microsoft.Azure.KeyVault.Core)    |    [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/keyvault/Microsoft.Azure.KeyVault.Core/src)    |
|    Microsoft.Azure.KeyVault.Cryptography    |    [Reference](/dotnet/api/microsoft.azure.keyvault.cryptography)    |    [Nuget](https://www.nuget.org/packages/Microsoft.Azure.KeyVault.Cryptography)    |    [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/keyvault/Microsoft.Azure.KeyVault.Cryptography)    |
|    Microsoft.Azure.KeyVault.Extensions    |      |    [Nuget](https://www.nuget.org/packages/Microsoft.Azure.KeyVault.Extensions)    |    [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/keyvault/Microsoft.Azure.KeyVault.Extensions)    |
|    Microsoft.Azure.KeyVault.WebKey    |    [Reference](/dotnet/api/microsoft.azure.keyvault.webkey)    |    [Nuget](https://www.nuget.org/packages/Microsoft.Azure.KeyVault.WebKey)    |    [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/keyvault/Microsoft.Azure.KeyVault.WebKey)    |
|    Microsoft.Azure.KeyVault    |    [Reference](/dotnet/api/microsoft.azure.keyvault)    |    [Nuget](https://www.nuget.org/packages/Microsoft.Azure.KeyVault)    |    [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/keyvault/Microsoft.Azure.KeyVault)    |

## Libraries for resource management

Use the following library to work with the Azure Key Vault resource provider:

|    Library    |    Reference    |    Package    |    Source    |
|------------------------------------------|-------------------------------------------------------------------|-----------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|
|    Microsoft.Azure.Management.KeyVault    |    [Reference](/dotnet/api/microsoft.azure.management.keyvault)    |    [Nuget](https://www.nuget.org/packages/Microsoft.Azure.Management.KeyVault/)    |    [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/keyvault/Microsoft.Azure.Management.KeyVault)    |