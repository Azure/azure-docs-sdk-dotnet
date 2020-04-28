---
title: Azure Key Vault libraries for .NET
description: The Azure Key Vault libraries for .NET offer a convenient interface for making calls to Azure Key Vault.
ms.date: 03/04/2020
ms.topic: reference
ms.service: key-vault
---

# Azure Key Vault libraries for .NET

The Azure Key Vault libraries for .NET offer a convenient interface for making calls to Azure Key Vault. For more information about Azure Key Vault, see [Introduction to Azure Key Vault](https://docs.microsoft.com/en-us/azure/key-vault/general/overview).

## Libraries for data access

The latest version of the Azure Key Vault library is version 4.x. Microsoft recommends using version 4.x for new applications.

If you cannot update existing applications to version 4.x, then Microsoft recommends using version 3.x.

### Version 4.x

The version 4.x libraries for .NET are part of the Azure SDK for .NET. The source code for the Key Vault libraries for .NET is available on [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/keyvault).

Use the following version 4.x libraries to work with certificates, keys, and secrets:

| Library | Reference | Package | Source |
|----------------------------------------|-------------------------------------------------------------|-----------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|
|    Azure.Security.KeyVault.Certificates    |      [Reference](https://docs.microsoft.com/en-us/dotnet/api/azure.security.keyvault.certificates)       |    [Nuget](https://www.nuget.org/packages/Azure.Security.KeyVault.Certificates/)    |    [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/keyvault/Azure.Security.KeyVault.Certificates)    |
|    Azure.Security.KeyVault.Keys    |     [Reference](https://docs.microsoft.com/en-us/dotnet/api/azure.security.keyvault.keys)    |    [Nuget](https://www.nuget.org/packages/Azure.Security.KeyVault.Keys/)      |     [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/keyvault/Azure.Security.KeyVault.Keys)|
|    Azure.Security.KeyVault.Secrets    |    [Reference](https://docs.microsoft.com/en-us/dotnet/api/azure.security.keyvault.secrets)    |    [Nuget](https://www.nuget.org/packages/Azure.Security.KeyVault.Secrets/)    |    [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/keyvault/Azure.Security.KeyVault.Secrets)    |
|    Azure.Security.KeyVault.Shared    |         |        |    [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/keyvault/Azure.Security.KeyVault.Shared)    |

### Version 3.x

The source code for the Azure Key Vault libraries for .NET is available on [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/keyvault).

Use the following version 3.x libraries to work with certificates, keys, and secrets:

| Library | Reference | Package | Source |
|--------------------------------------|---------------------------------------------------------------|-------------------------------------------------------------------------------|-------------------------------------------------------------------------------|
|    Microsoft.Azure.KeyVault.Core    |    [Reference](https://docs.microsoft.com/en-us/dotnet/api/microsoft.azure.keyvault.core)    |    [Nuget](https://www.nuget.org/packages/Microsoft.Azure.KeyVault.Core)    |    [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/keyvault/Microsoft.Azure.KeyVault.Core)    |
|    Microsoft.Azure.KeyVault.Cryptography    |    [Reference](https://docs.microsoft.com/en-us/dotnet/api/microsoft.azure.keyvault.cryptography)    |    [Nuget](https://www.nuget.org/packages/Microsoft.Azure.KeyVault.Cryptography)    |    [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/keyvault/Microsoft.Azure.KeyVault.Cryptography)    |
|    Microsoft.Azure.KeyVault.Extensions    |      |    [Nuget](https://www.nuget.org/packages/Microsoft.Azure.KeyVault.Extensions)    |    [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/keyvault/Microsoft.Azure.KeyVault.Extensions)    |
|    Microsoft.Azure.KeyVault.WebKey    |    [Reference](https://docs.microsoft.com/en-us/dotnet/api/microsoft.azure.keyvault.webkey)    |    [Nuget](https://www.nuget.org/packages/Microsoft.Azure.KeyVault.WebKey)    |    [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/keyvault/Microsoft.Azure.KeyVault.WebKey)    |
|    Microsoft.Azure.KeyVault    |    [Reference](https://docs.microsoft.com/en-us/dotnet/api/microsoft.azure.keyvault)    |    [Nuget](https://www.nuget.org/packages/Microsoft.Azure.KeyVault)    |    [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/keyvault/Microsoft.Azure.KeyVault)    |

## Libraries for resource management

Use the following library to work with the Azure Key Vault resource provider:

|    Library    |    Reference    |    Package    |    Source    |
|------------------------------------------|-------------------------------------------------------------------|-----------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|
|    Microsoft.Azure.Management.KeyVault    |    [Reference](https://docs.microsoft.com/en-us/dotnet/api/microsoft.azure.management.keyvault)    |    [Nuget](https://www.nuget.org/packages/Microsoft.Azure.Management.KeyVault/)    |    [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/keyvault/Microsoft.Azure.Management.KeyVault)    |