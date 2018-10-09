---
title: Azure Event Grid libraries for .NET
description: Reference for Azure Event Grid libraries for .NET
ms.date: 04/16/2018
ms.topic: reference
ms.service: event-grid
---

# Azure Event Grid libraries for .NET

Build event-driven applications that listen and react to events from Azure services and custom sources using simple HTTP-based event handling with Azure Event Grid.

[Learn more](/azure/event-grid/overview) about Azure Event Grid and get started with the [Azure Blob storage event tutorial](/azure/storage/blobs/storage-blob-event-quickstart-powershell). 

## Client SDK

Create events, authenticate, and post to topics using the Azure Event Grid Client SDK.

Install the [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.Management.Network.Fluent) directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].

#### Visual Studio Package Manager

```powershell
Install-Package Microsoft.Azure.EventGrid
```

#### .NET Core CLI

```bash
dotnet add package Microsoft.Azure.EventGrid 
```

### Publish events

The following code authenticates with Azure and publishes a `List` of  `EventGridEvent` events of a custom type (in this example, `Contoso.Items.ItemsReceivedEvent` ) to a topic. The topic key and endpoint address used in the sample can be retrieved from Azure PowerShell:

```powershell
$endpoint = (Get-AzureRmEventGridTopic -ResourceGroupName gridResourceGroup -Name <topic-name>).Endpoint
$keys = Get-AzureRmEventGridTopicKey -ResourceGroupName gridResourceGroup -Name <topic-name>
```

```csharp
string topicEndpoint = "https://<topic-name>.<region>-1.eventgrid.azure.net/api/events";
string topicKey = "<topic-key>";
string topicHostname = new Uri(topicEndpoint).Host;

TopicCredentials topicCredentials = new TopicCredentials(topicKey);
EventGridClient client = new EventGridClient(topicCredentials);

client.PublishEventsAsync(topicHostname, GetEventsList()).GetAwaiter().GetResult();
Console.Write("Published events to Event Grid.");

static IList<EventGridEvent> GetEventsList()
{
    List<EventGridEvent> eventsList = new List<EventGridEvent>();
    for (int i = 0; i < 1; i++)
    {
        eventsList.Add(new EventGridEvent()
        {
            Id = Guid.NewGuid().ToString(),
            EventType = "Contoso.Items.ItemReceivedEvent",
            Data = new ContosoItemReceivedEventData()
            {
                ItemUri = "ContosoSuperItemUri"
            },

            EventTime = DateTime.Now,
            Subject = "Door1",
            DataVersion = "2.0"
        });
    }
    return eventsList;
}
```

### Consume events

This snippet consumes events, including a custom event `Contoso.Items.ItemsReceived` as well as events triggered from other Azure services, such as Blob Storage.

```csharp
string response = string.Empty;
string requestContent = await req.Content.ReadAsStringAsync();

EventGridSubscriber eventGridSubscriber = new EventGridSubscriber();

// Optionally add one or more custom event type mappings
eventGridSubscriber.AddOrUpdateCustomEventMapping("Contoso.Items.ItemReceived", typeof(ContosoItemReceivedEventData));

var events = eventGridSubscriber.DeserializeEventGridEvents(requestContent);            
 
foreach (EventGridEvent receivedEvent in events)
{
    if (receivedEvent.Data is SubscriptionValidationEventData)
    {
        SubscriptionValidationEventData eventData = (SubscriptionValidationEventData)receivedEvent.Data;
        log.Info($"Got SubscriptionValidation event data, validationCode: {eventData.ValidationCode},  validationUrl: {eventData.ValidationUrl}, topic: {eventGridEvent.Topic}");
        // Handle subscription validation
    }
    else if (receivedEvent.Data is StorageBlobCreatedEventData)
    {
        StorageBlobCreatedEventData eventData = (StorageBlobCreatedEventData)receivedEvent.Data;
        log.Info($"Got BlobCreated event data, blob URI {eventData.Url}");
        // Handle StorageBlobCreatedEventData
    }
    else if (receivedEvent.Data is ContosoItemReceivedEventData)
    {
        ContosoItemReceivedEventData eventData = (ContosoItemReceivedEventData)receivedEvent.Data;
    }
}
```

> [!div class="nextstepaction"]
> [Explore the publishing APIs](/dotnet/api/overview/azure/eventgrid/publish)

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

[PackageManager]: https://docs.microsoft.com/nuget/tools/package-manager-console
[DotNetCLI]: https://docs.microsoft.com/dotnet/core/tools/dotnet-add-package
