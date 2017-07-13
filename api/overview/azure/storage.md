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

Use the Azure Storage client libraries to:

* Read and write objects and files from [Azure Blob storage](https://docs.microsoft.com/azure/storage/storage-dotnet-how-to-use-blobs).
* Send and receive messages between cloud-connected applications with [Azure Queue storage](https://docs.microsoft.com/azure/storage/storage-dotnet-how-to-use-queues).
* Read and write large structured data with [Azure Table storage](https://docs.microsoft.com/azure/storage/storage-dotnet-how-to-use-tables).
* Share storage between apps with [Azure File storage](https://docs.microsoft.com/azure/storage/storage-dotnet-how-to-use-files).

Use the Azure Storage management libraries to:

* Create, update, and manage Azure Storage accounts.
* Query and regenerate access keys from your .NET code.

## Install the packages

### Visual Studio 

In the Package Manager console, execute:

```powershell
# Client library
Install-Package WindowsAzure.Storage

# Management library
Install-Package Microsoft.Azure.Management.Storage.Fluent
``` 

### .NET Core command line

In your project directory, execute:

```bash
# Client library
dotnet add package WindowsAzure.Storage

# Management library
dotnet add package Microsoft.Azure.Management.Storage.Fluent
```

To learn more about the Azure .NET APIs, see [Get started with the Azure .NET APIs](/dotnet/azure/dotnet-sdk-azure-get-started).

## Example usage

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

## Samples


| | |
|--|--|
| [Get started with Azure Blob Storage in .NET](https://azure.microsoft.com/resources/samples/storage-blob-dotnet-getting-started/) | Create, read, update, restrict access, and delete files and objects in Azure Storage. |
| [Get started with Azure Queue Storage in .NET](https://azure.microsoft.com/resources/samples/storage-queue-dotnet-getting-started/) | Insert, peek, retrieve and delete messages from Azure Storage queues. | 


Explore [more sample .NET code and applications](https://azure.microsoft.com/resources/samples/?platform=dotnet).