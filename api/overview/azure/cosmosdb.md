---
title: Azure CosmosDB libraries for .NET
description: Reference for Azure CosmosDB libraries for .NET
keywords: Azure, .NET, SDK, API, CosmosDB
author: camsoper
ms.author: casoper
manager: wpickett
ms.date: 10/19/2017
ms.topic: reference
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.service: cosmos-db
ms.custom: devcenter, svc-overview
---

# Azure CosmosDB libraries for .NET

## Overview

[Azure CosmosDB](https://docs.microsoft.com/azure/cosmos-db/introduction) is a distributed and scalable data store, supporting multiple different types of databases.

## Client library

Use the CosmosDB .NET client library to access and store data in a CosmosDB data store.

Install the [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.DocumentDB.Core) directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].

#### Visual Studio Package Manager

```powershell
Install-Package Microsoft.Azure.DocumentDB.Core
```

#### .NET Core CLI

```bash
dotnet add package Microsoft.Azure.DocumentDB.Core
```

### Code Example

This example connects to an existing CosmosDB DocumentDB API database, reads a document from a collection, and deserializes it as an `Item` object.

```csharp
/* Include this "using" directive...
using Microsoft.Azure.Documents.Client;
*/

DocumentClient client = new DocumentClient(endpointUri, authKeyString);
Uri documentUri = UriFactory.CreateDocumentUri("MyDatabaseName", "MyCollectionName", "DocumentId");
// "Item" is a class defined elsewhere...
Item item = client.ReadDocumentAsync<Item>(documentUri).ToString()).Result;
```

> [!div class="nextstepaction"]
> [Explore the client APIs](/dotnet/api/overview/azure/cosmosdb/client)

## Samples

* [Developing a .NET app using Azure Cosmos DB's MongoDB API](https://azure.microsoft.com/en-us/resources/samples/azure-cosmos-db-mongodb-dotnet-getting-started/)

View the [complete list](https://azure.microsoft.com/en-us/resources/samples/?platform=dotnet&term=cosmosdb) of Azure Cosmos DB samples.

[PackageManager]: https://docs.microsoft.com/nuget/tools/package-manager-console
[DotNetCLI]: https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-add-package
