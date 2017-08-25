---
title: Azure Event Hubs libraries for .NET
description: Reference for Azure Event Hubs libraries for .NET
keywords: Azure, .NET, SDK, API, Event Hubs
author: camsoper
ms.author: casoper
manager: douge
ms.date: 07/19/2017
ms.topic: reference
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.service: multiple
---

# Azure Event Hubs libraries for .NET

## Overview

Azure Event Hubs is a highly scalable data streaming platform and event ingestion service.

To learn more about Azure Event Hubs, read the article [What is Event Hubs?](/azure/event-hubs/event-hubs-what-is-event-hubs).  To get started, check out the [Event Hubs Programming Guide](/azure/event-hubs/event-hubs-programming-guide).

## Client library

Use the Event Hubs client to send and receive messages to and from Event Hubs.

Install the [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.EventHubs) directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].

#### Visual Studio Package Manager

```powershell
Install-Package Microsoft.Azure.EventHubs
```

```bash
dotnet add package Microsoft.Azure.EventHubs
```

### Code Example

The following code creates an Event Hubs client and sends a message to the hub.

```csharp
EventHubsConnectionStringBuilder connectionStringBuilder = new EventHubsConnectionStringBuilder(eventHubConnectionString)
{
    EntityPath = eventHubEntityPath
};

EventHubClient eventHubClient = EventHubClient.CreateFromConnectionString(connectionStringBuilder.ToString());
string message = $"Message {i}";
Console.WriteLine($"Sending message: {message}");
await eventHubClient.SendAsync(new EventData(Encoding.UTF8.GetBytes(message)));
```

> [!div class="nextstepaction"]
> [Explore the client APIs](/dotnet/api/overview/azure/eventhub/client)

## Management library

Use the Event Hubs management library to create, update, and remove hubs and consumer groups.

Install the [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.Management.EventHub) directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].

#### Visual Studio Package Manager

```powershell
Install-Package Microsoft.Azure.Management.EventHub
```

```bash
dotnet add package Microsoft.Azure.Management.EventHub
```

### Code Example

The following code creates a new event hub.

```csharp
TokenCredentials creds = new TokenCredentials(token);
EventHubManagementClient ehClient = new EventHubManagementClient(creds)
{
    SubscriptionId = subscriptionId
};

EventHubCreateOrUpdateParameters ehParams = new EventHubCreateOrUpdateParameters()
{
    Location = location
};

Console.WriteLine("Creating Event Hub...");
await ehClient.EventHubs.CreateOrUpdateAsync(resourceGroupName, namespaceName, EventHubName, ehParams);
Console.WriteLine("Created Event Hub successfully.");
```

> [!div class="nextstepaction"]
> [Explore the management APIs](/dotnet/api/overview/azure/eventhub/management)

## Tutorials

* [Send events to Azure Event Hubs using the .NET Framework](/azure/event-hubs/event-hubs-dotnet-framework-getstarted-send)

* [Receive events from Azure Event Hubs using the .NET Framework](/azure/event-hubs/event-hubs-dotnet-framework-getstarted-receive-eph)

## Samples

* [Azure Event Hubs Samples](https://github.com/Azure/azure-event-hubs/tree/master/samples)

Explore more [sample .NET code](https://azure.microsoft.com/resources/samples/?platform=dotnet) you can use in your apps.

[PackageManager]: https://docs.microsoft.com/nuget/tools/package-manager-console
[DotNetCLI]: https://docs.microsoft.com/dotnet/core/tools/dotnet-add-package
