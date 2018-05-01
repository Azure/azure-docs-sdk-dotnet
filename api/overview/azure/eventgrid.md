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

[Learn more](/azure/event-grid/overview) about Azure Event Grid and get started with the [Azure Blob storage event tutorial](/azure/storage/blobs/storage-blob-event-quickstart-powershell). 

## Publish SDK

Create events, authenticate, and post to topics using the Azure Event Grid publish SDK.

Install the [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.Management.Network.Fluent) directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].

#### Visual Studio Package Manager

```powershell
Install-Package Microsoft.Azure.EventGrid
```

#### .NET Core CLI

```bash
dotnet add package Microsoft.Azure.EventGrid 
```

### Sample usage

The following code authenticates with Azure and publishes an event from a simple JSON object to the `example` topic:

```csharp
// create a list object for the events that will be send
List<EventGridEvent> eventList = new List<EventGridEvent>();

// loop through adding events to the list
foreach (var message in eventHubMessages)
{
    EventGridEvent myEvent = new EventGridEvent()
    {
        Id = Guid.NewGuid().ToString(),
        EventTime = DateTime.UtcNow,
        EventType = $"{eventType}",
        Subject = $"{eventMessage}",
        Data = $"{eventData}",
        DataVersion = "1.0"
    };
    eventList.Add(myEvent);
}

// create the topic credential 
TopicCredentials topicCredentials = new TopicCredentials(topicKey);

// Create the client object and publish/send to topic
EventGridClient client = new EventGridClient(topicCredentials);
client.PublishEventsAsync($"{gridname}.{regionprefix}.eventgrid.azure.net", eventList).Wait();
```

> [!div class="nextstepaction"]
> [Explore the client APIs](/dotnet/api/overview/azure/eventgrid/client)

## Management SDK

Create, update, or delete Event Grid instances, topics, and subscriptions with the management SDK.

Install the [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.Management.Network.Fluent) directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].


#### Visual Studio Package Manager

```powershell
Install-Package Microsoft.Azure.Management.EventGrid
```

#### .NET Core CLI

```bash
dotnet add package Microsoft.Azure.Management.EventGrid
```

> [!div class="nextstepaction"]
> [Explore the management APIs](/dotnet/api/overview/azure/eventgrid/management)

## Learn more

- [Receive events using the Event Grid SDK](/azure/event-grid/receive-events)
