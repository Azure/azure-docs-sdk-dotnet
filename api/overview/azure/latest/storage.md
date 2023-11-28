---
title: Azure Storage SDK for .NET
description: Reference for Azure Storage SDK for .NET
ms.date: 11/27/2023
ms.topic: reference
ms.devlang: dotnet
ms.service: storage
---
# Azure Storage client libraries for .NET

The Azure Storage client libraries for .NET offer a convenient interface for making calls to Azure Storage. For more information about Azure Storage, see [Introduction to Azure Storage](/azure/storage/common/storage-introduction).

## Libraries for data access

The latest version of the Azure Storage client library for data access is version 12.x.x. Microsoft recommends using version 12.x.x for new applications.

If you cannot update existing applications to version 12.x.x, then Microsoft recommends using version 11.x.x.

### Version 12.x.x

The version 12.x.x client libraries for .NET are part of the Azure SDK for .NET. The source code for the Azure Storage client libraries for .NET is available on [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/main/sdk/storage).

Use the following version 12.x.x libraries to work with blobs, files, and queues:

| Library | Reference | Package | Source |
|----------------------------------------|-------------------------------------------------------------|-----------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|
|    Azure.Storage.Blobs.Batch    |         |    [NuGet](https://www.nuget.org/packages/Azure.Storage.Blobs.Batch/)    |    [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/main/sdk/storage/Azure.Storage.Blobs.Batch)    |
|    Azure.Storage.Blobs    |    [Reference](/dotnet/api/azure.storage.blobs)    |    [NuGet](https://www.nuget.org/packages/Azure.Storage.Blobs/)    |    [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/main/sdk/storage/Azure.Storage.Blobs)    |
|    Azure.Storage.Common    |         |    [NuGet](https://www.nuget.org/packages/Azure.Storage.Common/)    |    [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/main/sdk/storage/Azure.Storage.Common)    |
|    Azure.Storage.Files.DataLake    |    [Reference](/dotnet/api/azure.storage.files.datalake)    |    [NuGet](https://www.nuget.org/packages/Azure.Storage.Files.DataLake/)    |    [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/main/sdk/storage/Azure.Storage.Files.DataLake)    |
|    Azure.Storage.Files.Shares    |    [Reference](/dotnet/api/azure.storage.files.shares)    |    [NuGet](https://www.nuget.org/packages/Azure.Storage.Files.Shares/)    |    [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/main/sdk/storage/Azure.Storage.Files.Shares)    |
|    Azure.Storage.Queues    |    [Reference](/dotnet/api/azure.storage.queues)    |    [NuGet](https://www.nuget.org/packages/Azure.Storage.Queues/)    |    [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/main/sdk/storage/Azure.Storage.Queues)    |

### Version 11.x.x

The source code for the Azure Storage client libraries for .NET is available on [GitHub](https://github.com/Azure/azure-storage-net).

Use the following version 11.x.x libraries to work with blobs, files, and queues:

| Library | Reference | Package | Source |
|--------------------------------------|---------------------------------------------------------------|-------------------------------------------------------------------------------|-------------------------------------------------------------------------------|
|    Microsoft.Azure.Storage.Blob    |    [Reference](/dotnet/api/microsoft.azure.storage.blob)    |    [NuGet](https://www.nuget.org/packages/Microsoft.Azure.Storage.Blob/)    |    [GitHub](https://github.com/Azure/azure-storage-net/tree/master/Blob)    |
|    Microsoft.Azure.Storage.Common    |      |    [NuGet](https://www.nuget.org/packages/Microsoft.Azure.Storage.Common/)    |    [GitHub](https://github.com/Azure/azure-storage-net/tree/master/Common)    |
|    Microsoft.Azure.Storage.File    |    [Reference](/dotnet/api/microsoft.azure.storage.file)    |    [NuGet](https://www.nuget.org/packages/Microsoft.Azure.Storage.File/)    |    [GitHub](https://github.com/Azure/azure-storage-net/tree/master/File)    |
|    Microsoft.Azure.Storage.Queue    |    [Reference](/dotnet/api/microsoft.azure.storage.queue)    |    [NuGet](https://www.nuget.org/packages/Microsoft.Azure.Storage.Queue/)    |    [GitHub](https://github.com/Azure/azure-storage-net/tree/master/Queue)    |

## Libraries for resource management

The latest version of the Azure Storage client library for resource management is version 1.x.x. Microsoft recommends using version 1.x.x for new applications.

If you cannot update existing applications to version 1.x.x, then Microsoft recommends using version 25.x.x.

### Version 1.x.x

Use the following version 1.x.x library to work with the Azure Storage resource provider:

|    Library    |    Reference    |    Package    |    Source    |
|------------------------------------------|-------------------------------------------------------------------|-----------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|
|    Azure.ResourceManager.Storage    |    [Reference](/dotnet/api/azure.resourcemanager.storage)    |    [NuGet](https://www.nuget.org/packages/Azure.ResourceManager.Storage/)    |    [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/main/sdk/storage/Azure.ResourceManager.Storage)    |

### Version 25.x.x

Use the following version 25.x.x library to work with the Azure Storage resource provider:

|    Library    |    Reference    |    Package    |    Source    |
|------------------------------------------|-------------------------------------------------------------------|-----------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|
|    Microsoft.Azure.Management.Storage    |    [Reference](/dotnet/api/microsoft.azure.management.storage)    |    [NuGet](https://www.nuget.org/packages/Microsoft.Azure.Management.Storage/)    |    [GitHub](https://github.com/Azure/azure-sdk-for-net/tree/main/sdk/storage/Microsoft.Azure.Management.Storage)    |

## Known issues

This section details known issues for the Azure Storage client libraries for .NET.

### InvalidHeaderValue error message when using beta version of SDK

In rare scenarios, applications that have upgraded to the latest beta or generally available version of the SDK can receive an `InvalidHeaderValue` error message. This issue can occur when using any of the Storage libraries. The error message looks similar to the following sample:

```console
HTTP/1.1 400 The value for one of the HTTP headers is not in the correct format.
Content-Length: 328
Content-Type: application/xml
Server: Microsoft-HTTPAPI/2.0
x-ms-request-id: <REMOVED>
Date: Fri, 19 May 2023 17:10:33 GMT
 
<?xml version="1.0" encoding="utf-8"?><Error><Code>InvalidHeaderValue</Code><Message>The value for one of the HTTP headers is not in the correct format.
RequestId:<REMOVED>
Time:2023-05-19T17:10:34.2972651Z</Message><HeaderName>x-ms-version</HeaderName><HeaderValue>yyyy-mm-dd</HeaderValue></Error> 
```

If you've upgraded to the latest beta or generally available version of the SDK and you experience this error, it's recommended that you downgrade to the previous generally available version of the SDK to see if the issue resolves. If the issue persists, or if the recommendation is not feasible, [open a support ticket](https://ms.portal.azure.com/#create/Microsoft.Support) to explore further options.