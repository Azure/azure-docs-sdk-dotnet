---
title: Azure Cosmos DB libraries for .NET
description: Reference for Azure Cosmos DB libraries for .NET
ms.date: 06/18/2019
ms.topic: reference
ms.service: cosmos-db
---

# Azure Cosmos DB libraries for .NET

## Overview

[Azure Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/introduction) is a globally distributed, multi-model database service. It is designed to elastically and independently scale throughput and storage across any number of geographical regions with a comprehensive SLA. With Azure Cosmos DB, you can store and access document, key-value, wide-column, and graph databases by using APIs and programming models. 

[Get started](https://docs.microsoft.com/azure/cosmos-db/create-sql-api-dotnet) with Azure Cosmos DB.

## Client library

Use the Azure Cosmos DB .NET client library to access and store data in an existing Azure Cosmos DB data store. To automate creation of a new Azure Cosmos DB account, use the Azure portal, CLI, or PowerShell.

Install the [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.Cosmos) directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].

To install version 2.x:

#### Visual Studio Package Manager

```powershell
Install-Package Microsoft.Azure.DocumentDB.Core
```

#### .NET Core CLI

```dotnetcli
dotnet add package Microsoft.Azure.DocumentDB.Core
```

To install version 3.x, which targets .NET standard: 

#### Visual Studio Package Manager

```powershell
Install-Package Microsoft.Azure.Cosmos
```

#### .NET Core CLI

```dotnetcli
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
    CosmosItemResponse<TodoItem> todoItemResponse = await cosmosClient
                .GetContainer("DatabaseId", "ContainerId")
                .ReadItemAsync<TodoItem>("ItemId", new PartitionKey("partitionKeyValue"));
}
```

> [!div class="nextstepaction"]
> [Explore the client APIs](/dotnet/api/overview/azure/cosmosdb/client)

## Samples

* [ASP.NET Core MVC app using Azure Cosmos DB's SQL API](https://github.com/Azure-Samples/cosmos-dotnet-core-todo-app)

* [.NET Core Console app using Azure Cosmos DB's SQL API](https://github.com/Azure-Samples/cosmos-dotnet-core-getting-started)

* [Azure Cosmos DB .NET SDK samples](https://github.com/Azure/azure-cosmos-dotnet-v3/tree/master/Microsoft.Azure.Cosmos.Samples/CodeSamples)

[PackageManager]: https://docs.microsoft.com/nuget/tools/package-manager-console
[DotNetCLI]: https://docs.microsoft.com/dotnet/core/tools/dotnet-add-package
