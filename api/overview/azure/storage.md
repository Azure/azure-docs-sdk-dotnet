---
title: Azure Storage libraries for .NET
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

# Azure Storage libraries

## Overview

Use the Azure Storage client libraries to:

- Read and write objects and files from [Azure Blob storage](https://docs.microsoft.com/azure/storage/storage-dotnet-how-to-use-blobs)
- Send and receive messages between cloud-connected applications with [Azure Queue storage](https://docs.microsoft.com/azure/storage/storage-dotnet-how-to-use-queues)
- Read and write large structured data with [Azure Table storage](https://docs.microsoft.com/azure/storage/storage-dotnet-how-to-use-tables) 
- Share storage between apps with [Azure File storage](https://docs.microsoft.com/azure/storage/storage-dotnet-how-to-use-files)

Create, update, and manage Azure Storage accounts and query and regenerate access keys from your .NET code with the management libraries.

## Import the libraries

### Visual Studio 

In the [Package Manager](https://docs.microsoft.com/dotnet/azure/dotnet-sdk-azure-install?view=azure-dotnet) window, use the following cmdlet:

```powershell
Install-Package WindowsAzure.Storage
``` 

### .NET Core command line

Execute the following command in your project directory:

```bash
dotnet add package WindowsAzure.Storage
```
## Example usage

The following code writes a new file to an existing blob storage container using a provided [storage connection string](https://docs.microsoft.com/azure/storage/storage-configure-connection-string).

```csharp
// Retrieve storage account from connection string.
CloudStorageAccount storageAccount = CloudStorageAccount.Parse(
    CloudConfigurationManager.GetSetting("StorageConnectionString"));

// Create the blob client.
CloudBlobClient blobClient = storageAccount.CreateCloudBlobClient();

// Retrieve reference to a previously created container.
CloudBlobContainer container = blobClient.GetContainerReference("mycontainer");

// Retrieve reference to a blob named "myblob".
CloudBlockBlob blockBlob = container.GetBlockBlobReference("myblob");

// Create or overwrite the "myblob" blob with contents from a local file.
using (var fileStream = System.IO.File.OpenRead(@"path\myfile"))
{
    blockBlob.UploadFromStream(fileStream);
}
```

## Samples


| | |
|--|--|
| [Get started with Azure Blob Storage in .NET](https://azure.microsoft.com/resources/samples/storage-blob-dotnet-getting-started/) | Create, read, update, restrict access, and delete files and objects in Azure Storage. |
| [Get started with Azure Queue Storage in .NET](https://azure.microsoft.com/resources/samples/storage-queue-dotnet-getting-started/) | Insert, peek, retrieve and delete messages from Azure Storage queues. | 


Explore [more sample .NET code and applications](https://azure.microsoft.com/resources/samples/?platform=dotnet).