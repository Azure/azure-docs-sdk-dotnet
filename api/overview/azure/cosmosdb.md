---
title: Azure Cosmos DB libraries for .NET
description: Reference for Azure Cosmos DB libraries for .NET
ms.date: 08/31/2018
ms.topic: reference
ms.service: cosmos-db
---

# Azure Cosmos DB libraries for .NET

## Overview

[Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction) is a globally distributed, multi-model database service. It is designed to elastically and independently scale throughput and storage across any number of geographical regions with a comprehensive SLA. With Azure Cosmos DB, you can store and access document, key-value, wide-column, and graph databases by using APIs and programming models. 

[Get started with Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/create-sql-api-dotnet).

## Client library

Use the Azure Cosmos DB .NET client library to access and store data in an existing Azure Cosmos DB data store. To automate creation of a new Azure Cosmos DB account, use the Azure portal, CLI, or PowerShell.

Install the [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.DocumentDB.Core) directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].

To install version 2.x:

#### Visual Studio Package Manager

```powershell
Install-Package Microsoft.Azure.DocumentDB.Core
```

#### .NET Core CLI

```bash
dotnet add package Microsoft.Azure.DocumentDB.Core
```

To install the preview of version 3.0, which targets .NET standard: 

#### Visual Studio Package Manager

```powershell
Install-Package Microsoft.Azure.Cosmos -prerelease
```

#### .NET Core CLI

```bash
dotnet add package Microsoft.Azure.Cosmos
```


### Code Example

This example connects to an existing Azure Cosmos DB SQL API database, reads a document from a collection, and deserializes it as an `TodoItem` object. This example uses version 2.x of the .NET SDK.   

```csharp
/* Include this "using" directive...
using Microsoft.Azure.Documents.Client;
*/

DocumentClient client = new DocumentClient(endpointUri, authKeyString);
Uri documentUri = UriFactory.CreateDocumentUri("MyDatabaseName", "MyCollectionName", "DocumentId");
var todoItem = client.ReadDocumentAsync<TodoItem>(documentUri);
```

This example connects to an existing Azure Cosmos DB SQL API database, creates a new database and container, reads an item from the container, and deserializes it to a `TodoItem` object. This example uses version 3.x of the .NET SDK.   

```csharp
using (CosmosClient cosmosClient = new CosmosClient("endpoint", "primaryKey"))
{
    // Read item from container
    CosmosItemResponse<TodoItem> todoItemResponse = await cosmosClient.Databases["DatabaseId"].Containers["ContainerId"].Items.ReadItemAsync<TodoItem>("partitionKeyValue", "ItemId");
}
```

> [!div class="nextstepaction"]
> [Explore the client APIs](/dotnet/api/overview/azure/cosmosdb/client)

## Samples

* [Developing a .NET app using Azure Cosmos DB's SQL API (Version 2.x)](https://github.com/Azure-Samples/documentdb-dotnet-todo-app/)
* [Developing a .NET app using Azure Cosmos DB's SQL API (Version 3.x Preview)](https://github.com/Azure-Samples/cosmos-dotnet-todo-app/)
* [Developing a .NET Core app using Azure Cosmos DB's SQL API (Version 3.x Preview)](https://github.com/Azure-Samples/cosmos-dotnet-core-getting-started)

View the [complete list](https://azure.microsoft.com/resources/samples/?platform=dotnet&term=cosmosdb) of Azure Cosmos DB samples.

[PackageManager]: https://docs.microsoft.com/nuget/tools/package-manager-console
[DotNetCLI]: https://docs.microsoft.com/dotnet/core/tools/dotnet-add-package
