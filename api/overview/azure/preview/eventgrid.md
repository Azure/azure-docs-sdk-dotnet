---
title: Azure Eventgrid SDK for .NET
description: Reference for Azure Eventgrid SDK for .NET
ms.date: 10/09/2024
ms.topic: reference
ms.devlang: dotnet
ms.service: eventgrid
---
# Azure Event Grid libraries for .NET
Build event-driven applications that listen and react to events from Azure services and custom sources using simple HTTP-based event handling with Azure Event Grid.

[Learn more](/azure/event-grid/overview) about Azure Event Grid and get started with the [Azure Blob storage event tutorial](/azure/event-grid/blob-event-quickstart-portal). 

## Client SDK

Create events, authenticate, and post to topics using the Azure Event Grid client SDK.

Install the [NuGet package](https://www.nuget.org/packages/Azure.Messaging.EventGrid/) directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].

#### Visual Studio Package Manager

```powershell
Install-Package Azure.Messaging.EventGrid
```

#### .NET Core CLI

```dotnetcli
dotnet add package Azure.Messaging.EventGrid
```

For an overview of the latest client SDK, samples, see the [Azure Event Grid client library for .NET](https://github.com/Azure/azure-sdk-for-net/tree/main/sdk/eventgrid/Azure.Messaging.EventGrid) page. This page also has a link to the migration guide that helps you migrate applications that use the old .NET library (**Microsoft.Azure.EventGrid**) to use the latest one (**Azure.Messaging.EventGrid**).

Under the **Client** section of the table of contents, you will also see documentation for the old [Microsoft.Azure.EventGrid](/dotnet/api/microsoft.azure.eventgrid) library. 


## Management SDK

Create, update, or delete Event Grid instances, topics, and subscriptions with the management SDK.

Install the [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.Management.EventGrid) directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].


#### Visual Studio Package Manager

```powershell
Install-Package Microsoft.Azure.Management.EventGrid
```

#### .NET Core CLI

```dotnetcli
dotnet add package Microsoft.Azure.Management.EventGrid
```

> [!div class="nextstepaction"]
> [Explore the management APIs](/dotnet/api/overview/azure/eventgrid/management)

## Learn more

- [Receive events using the Event Grid SDK](/azure/event-grid/receive-events)

[PackageManager]: /nuget/tools/package-manager-console
[DotNetCLI]: /dotnet/core/tools/dotnet-add-package