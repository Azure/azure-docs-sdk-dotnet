---
title: Azure Service Bus SDK for .NET
description: Reference for Azure Service Bus SDK for .NET
author: pallavit
ms.author: pallavit
ms.data: 03/10/2023
ms.topic: reference
ms.devlang: dotnet
ms.service: servicebus
ms.date: 02/08/2021
---
# Azure Service Bus libraries for .NET

## Overview

[Azure Service Bus](https://docs.microsoft.com/azure/service-bus-messaging/service-bus-messaging-overview) is a messaging infrastructure that sits between applications allowing them to exchange messages for improved scale and resiliency.

## Client library

Install the [NuGet package](https://www.nuget.org/packages/Azure.Messaging.ServiceBus) directly from the Visual Studio [Package Manager console][PackageManager].

#### Visual Studio Package Manager

```powershell
Install-Package Azure.Messaging.ServiceBus
```

### Code Example

This example demonstrates how to send and receive messages using a Service Bus queue.

```csharp
// using Azure.Messaging.ServiceBus;

string connectionString = "<connection_string>";
string queueName = "<queue_name>";

// Because ServiceBusClient implements IAsyncDisposable, we'll create it 
// with "await using" so that it is automatically disposed for us.
await using var client = new ServiceBusClient(connectionString);

// The sender is responsible for publishing messages to the queue.
ServiceBusSender sender = client.CreateSender(queueName);
ServiceBusMessage message = new ServiceBusMessage("Hello world!");

await sender.SendMessageAsync(message);

// The receiver is responsible for reading messages from the queue.
ServiceBusReceiver receiver = client.CreateReceiver(queueName);
ServiceBusReceivedMessage receivedMessage = await receiver.ReceiveMessageAsync();

string body = receivedMessage.Body.ToString();
Console.WriteLine(body);
```

> [!div class="nextstepaction"]
> [Explore the client APIs](/dotnet/api/azure.messaging.servicebus)

## Management library

Install the [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.Management.ServiceBus.Fluent) directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].

#### Visual Studio Package Manager

```powershell
Install-Package Microsoft.Azure.Management.ServiceBus.Fluent
```

#### .NET Core CLI

```dotnetcli
dotnet add package Microsoft.Azure.Management.ServiceBus.Fluent
```

### Code Example

This example creates a Service Bus queue with a maximum size of 1024 MB.

```csharp
// using Microsoft.Azure.Management.ServiceBus.Fluent;
// using Microsoft.Azure.Management.ServiceBus.Fluent.Models;

using (ServiceBusManagementClient client = new ServiceBusManagementClient(credentials))
{
    client.SubscriptionId = subscriptionId;
    QueueInner parameters = new QueueInner
    {
        MaxSizeInMegabytes = 1024
    };
    await client.Queues.CreateOrUpdateAsync(resourceGroupName, namespaceName, queueName, parameters);
}
```

> [!div class="nextstepaction"]
> [Explore the management APIs](/dotnet/api/overview/azure/servicebus/management)

## Samples

- [Sending and Receiving Messages](https://github.com/Azure/azure-sdk-for-net/blob/master/sdk/servicebus/Azure.Messaging.ServiceBus/samples/Sample01_HelloWorld.md)
- [Settling Messages](https://github.com/Azure/azure-sdk-for-net/blob/master/sdk/servicebus/Azure.Messaging.ServiceBus/samples/Sample02_MessageSettlement.md)
- [Sending and Receiving Session Messages](https://github.com/Azure/azure-sdk-for-net/blob/master/sdk/servicebus/Azure.Messaging.ServiceBus/samples/Sample03_SendReceiveSessions.md)
- [Using the Service Bus Processor to Receive Messages](https://github.com/Azure/azure-sdk-for-net/blob/master/sdk/servicebus/Azure.Messaging.ServiceBus/samples/Sample04_Processor.md)
- [Using the Service Bus Session Processor to Receive Messages](https://github.com/Azure/azure-sdk-for-net/blob/master/sdk/servicebus/Azure.Messaging.ServiceBus/samples/Sample05_SessionProcessor.md)
- [Working with Service Bus Transactions](https://github.com/Azure/azure-sdk-for-net/blob/master/sdk/servicebus/Azure.Messaging.ServiceBus/samples/Sample06_Transactions.md)
- [Basic Management Operations with the Service Bus Administration Client](https://github.com/Azure/azure-sdk-for-net/blob/master/sdk/servicebus/Azure.Messaging.ServiceBus/samples/Sample07_CrudOperations.md)

View the [complete list](https://azure.microsoft.com/resources/samples/?term=service+bus) of Azure Service Bus samples.


[PackageManager]: https://docs.microsoft.com/nuget/tools/package-manager-console
[DotNetCLI]: https://docs.microsoft.com/dotnet/core/tools/dotnet-add-package