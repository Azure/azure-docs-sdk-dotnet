---
title: Azure Cognitive Search libraries for .NET
description: Reference for Azure Cognitive Search libraries for .NET
ms.date: 07/20/2020
ms.topic: reference
ms.service: search
---

# Azure Cognitive Search libraries for .NET

## Overview

[Azure Cognitive Search](https://docs.microsoft.com/azure/search/search-what-is-azure-search) is a fully managed cloud search service that provides a rich search experience over content in web, mobile, and enterprise applications. The client library is used to access and execute indexing and search operations on a search service, index, documents, and other objects.

## Libraries for data access

The `Azure.Search.Documents` client library (v11) is a new offering for .NET developers who want to use search technology in their applications. This version is functionally equivalent to the previous **Microsoft.Azure.Search** client library (v10), but takes dependencies on **Azure.Core** and **System.Net.Json** to provide a standard approach for service configuration, authentication, document serialization, and other tasks.

This version has different clients, namespaces, and class names, so you will need to migrate existing code to use the new library. When reviewing code samples and content, be sure to check for the namespace (`using Azure.Search.Documents;` for version 11) to confirm which client library is demonstrated.

### Version 11.0

Use the following version 11.0 of the **Azure.Search** libraries to work with Azure Cognitive Search objects. Moving forward, all new features and enhancements will roll out in this client library.

|    Library    |    Reference    |    Package    |    Source    |
|---------------|-----------------|----------------|-------------|
| Azure.Search.Documents | [Reference](/dotnet/api/azure.search.documents) | [NuGet](https://www.nuget.org/packages/Azure.Search.Documents/) | [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/search/Azure.Search.Documents) |

There is only one package and one client library for this version.

### Version 10.0 (legacy)

Use the following version 10.x of the **Microsoft.Azure.Search** libraries to maintain existing solutions. This version is fully supported, but With the exception of bug fixes, no further updates are planned for this library. For an introduction, see [How to use Microsoft.Azure.Search (v10)](https://docs.microsoft.com/azure/search/search-howto-dotnet-sdk).

|    Library    |    Reference    |    Package    |    Source    |
|---------------|-----------------|----------------|-------------|
| Microsoft.Azure.Search | [Reference](/dotnet/api/microsoft.azure.search) | [NuGet](https://www.nuget.org/packages/Microsoft.Azure.Search/) | [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/search/Microsoft.Azure.Search) |
| Microsoft.Azure.Search.Common | [Reference](/dotnet/api/microsoft.azure.search.common) |   |  |
| Microsoft.Azure.Search.Models | [Reference](/dotnet/api/microsoft.azure.search.models) |   |  |
| Microsoft.Azure.Search.Models.Internal | [Reference](/dotnet/api/microsoft.azure.search.models.internal) | |  |
| Microsoft.Azure.Search.Serialization | [Reference](/dotnet/api/microsoft.azure.search.serialization) |   |  |
| Microsoft.Azure.Search.Serialization.internal | [Reference](/dotnet/api/microsoft.azure.search.serialization.internal) |  |  |

## Libraries for resource management

Use the Azure Cognitive Search management library to provision a service, manage api-keys, and adjust resources. Service management has a dependency on Azure Resource Manager for subscriber and tenant identification. Typically, authentication and application registration with Azure Active Directory is also necessary to support the workflow. For an introduction to Azure Cognitive Search service provisioning, see [How to use the Management REST API](https://docs.microsoft.com/rest/api/searchmanagement/search-howto-management-rest-api).

|    Library    |    Reference    |    Package    |    Source    |
|---------------|-----------------|----------------|-------------|
| Microsoft.Azure.Management.Search | [Reference](/dotnet/api/overview/azure/search/management) | [NuGet](https://www.nuget.org/packages/Microsoft.Azure.Management.Search) | [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/search/Microsoft.Azure.Management.Search)