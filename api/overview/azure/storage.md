---
title: Azure .NET Storage APIs
description: Reference for Azure Storage libraries for .NET
keywords: Azure, .NET, SDK, API, storage, blob
author: camsoper
ms.author: casoper
manager: douge
ms.date: 06/20/2017
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

#### Visual Studio Package Manager

```powershell
Install-Package WindowsAzure.Storage
```

### .NET Core CLI

```bash
dotnet add package WindowsAzure.Storage
```

### Example

# CAM -- REWRITE FOLLOWING EXAMPLE --

The following code creates a storage account, and then writes a new file to a blob storage container.

```csharp
// Create the Azure management object
IAzure azure = Azure
    .Configure()
    .Authenticate(credentials)
    .WithDefaultSubscription();

// Create the storage account
IStorageAccount storage = azure.StorageAccounts.Define(storageAccountName)
    .WithRegion(Region.USEast)
    .WithNewResourceGroup(rgName)
    .Create();

// Build a storage connection string
var storageKeys = storage.GetKeys();
string storageConnectionString = "DefaultEndpointsProtocol=https;"
    + "AccountName=" + storage.Name
    + ";AccountKey=" + storageKeys[0].Value
    + ";EndpointSuffix=core.windows.net";

//Create a client to connect to the storage account
CloudStorageAccount account = CloudStorageAccount.Parse(storageConnectionString);
CloudBlobClient serviceClient = account.CreateCloudBlobClient();

// Create container. Name must be lower case.
CloudBlobContainer container = serviceClient.GetContainerReference("helloazure");
container.CreateIfNotExistsAsync().Wait();

// Make the container public
BlobContainerPermissions containerPermissions = new BlobContainerPermissions()
    { PublicAccess = BlobContainerPublicAccessType.Container };
container.SetPermissionsAsync(containerPermissions).Wait();

// write a blob to the container
CloudBlockBlob blob = container.GetBlockBlobReference("helloazure.txt");
blob.UploadTextAsync("Hello, Azure!").Wait();
Console.WriteLine("Your blob is located at {0}", blob.StorageUri.PrimaryUri);     

```

[!div class="nextstepactions"]
[Explore the client APIs](/dotnet/api/overview/azure/storage/client)

## Management APIs

Create and manage Azure Storage accounts and connection keys with the management API.

#### Visual Studio package manager

```powershell
Install-Package Microsoft.Azure.Management.Storage.Fluent
```

#### .NET Core CLI

````bash
dotnet add package Microsoft.Azure.Management.Storage.Fluent
````

### Example

# CAM -- PUT EXAMPLE HERE --

[!div class="nextstepactions"]
[Explore the management APIs](/dotnet/api/overview/azure/storage/management)

## Samples

* [Get started with Azure Blob Storage in .NET](https://azure.microsoft.com/resources/samples/storage-blob-dotnet-getting-started/) 
* [Get started with Azure Queue Storage in .NET](https://azure.microsoft.com/resources/samples/storage-queue-dotnet-getting-started/)

View the [complete list](https://azure.microsoft.com/resources/samples/?platform=dotnet&term=storage) of Azure Storage samples.