---
title: Azure .NET Storage APIs
description: Reference for Azure Storage libraries for .NET
keywords: Azure, .NET, SDK, API, storage, blob
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

# Azure Storage APIs for .NET

## Overview

Read and write files, blob (object) data, key-value pairs, and messages from your .NET applications with [Azure Storage](https://review.docs.microsoft.com/en-us/azure/storage/storage-introduction).

To get started with Azure Storage, see [Get started with Azure Blob storage using .NET](/azure/storage/storage-dotnet-how-to-use-blobs).

## Client library

Use [connection strings](/azure/storage/storage-create-storage-account#manage-your-storage-account) to connect to an Azure Storage account, then use the client libraries' classes and methods to work with blob, table, file, or queue storage.

Install the [NuGet package](https://www.nuget.org/packages/WindowsAzure.Storage) directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].

#### Visual Studio Package Manager

```powershell
Install-Package WindowsAzure.Storage
```

### .NET Core CLI

```bash
dotnet add package WindowsAzure.Storage
```

### Code Example

This example creates a new blob to a new container in an existing storage account.

```csharp
/* Include these "using" directives...
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Blob;
*/

string storageConnectionString = "DefaultEndpointsProtocol=https;"
    + "AccountName=[Storage Account Name]"
    + ";AccountKey=[Storage Account Key]"
    + ";EndpointSuffix=core.windows.net";

CloudStorageAccount account = CloudStorageAccount.Parse(storageConnectionString);
CloudBlobClient serviceClient = account.CreateCloudBlobClient();

// Create container. Name must be lower case.
Console.WriteLine("Creating container...");
var container = serviceClient.GetContainerReference("mycontainer");
container.CreateIfNotExistsAsync().Wait();

// write a blob to the container
CloudBlockBlob blob = container.GetBlockBlobReference("helloworld.txt");
blob.UploadTextAsync("Hello, World!").Wait();
```

> [!div class="nextstepactions"]
> [Explore the client APIs](/dotnet/api/overview/azure/storage/client)

## Management APIs

Create and manage Azure Storage accounts and connection keys with the management API.

Install the [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.Management.Storage.Fluent) directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].

#### Visual Studio package manager

```powershell
Install-Package Microsoft.Azure.Management.Storage.Fluent
```

#### .NET Core CLI

````bash
dotnet add package Microsoft.Azure.Management.Storage.Fluent
````

### Code Example

This example creates a storage account.

```csharp
/* Include this "using" directive...
using Microsoft.Azure.Management.Storage.Fluent
*/

IStorageAccount storage = azure.StorageAccounts.Define(storageAccountName)
    .WithRegion(Region.USEast)
    .WithNewResourceGroup(rgName)
    .Create();
```

> [!div class="nextstepactions"]
> [Explore the management APIs](/dotnet/api/overview/azure/storage/management)

## Samples

* [Get started with Azure Blob Storage in .NET](https://azure.microsoft.com/resources/samples/storage-blob-dotnet-getting-started/) 
* [Get started with Azure Queue Storage in .NET](https://azure.microsoft.com/resources/samples/storage-queue-dotnet-getting-started/)

View the [complete list](https://azure.microsoft.com/resources/samples/?platform=dotnet&term=storage) of Azure Storage samples.

[PackageManager]: https://docs.microsoft.com/nuget/tools/package-manager-console
[DotNetCLI]: https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-add-package