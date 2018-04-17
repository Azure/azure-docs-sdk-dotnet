---
title: Azure Event Grid libraries for .NET
description: Reference for Azure Event Grid libraries for .NET
author: rloutlaw 
ms.author: routlaw    
manager: angerobe
ms.date: 04/16/2018
ms.topic: reference
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.service: event-grid
ms.custom: devcenter
---

# Azure Event Grid libraries for .NET

Build event-driven applications that listen and react to events from Azure services and custom sources using simple HTTP-based event handling with Azure Event Grid.

[Learn more](/azure/event-grid/overview) about Azure Event Grid and get started with the [Azure Blob storage event tutorial](/azure/storage/blobs/storage-blob-event-quickstart-powershell)

## Publish SDK

Install the [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.Management.Network.Fluent) directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].

#### Visual Studio Package Manager

```powershell
Install-Package Microsoft.Azure.EventGrid
```

#### .NET Core CLI

```bash
dotnet add package Microsoft.Azure.EventGrid 
```

Create events, authenticate, and post to topics using the Azure Event Grid publish SDK.

### Example code

The following code authenticates with Azure and publishes an event from a simple JSON object to the `example` topic:

```chsarp
```

## Management SDK

Create, update, or delete Event Grid service instances, topics, and subscriptions with the management SDK.

#### Visual Studio Package Manager

```powershell
Install-Package Microsoft.Azure.Management.EventGrid
```

#### .NET Core CLI

```bash
dotnet add package Microsoft.Azure.Management.EventGrid
```



