---
title: Azure Edge Hardware Center libraries for .NET
description: Reference for Azure Edge Hardware Center libraries for .NET
ms.date: 02/09/2021
ms.topic: reference
ms.service: edgeorder
---
# Azure Edge Hardware Center APIs for .NET

## Overview

[Azure Edge Hardware Center](https://docs.microsoft.com/azure/azure-edge-hardware-center/) is an Azure service that lets you order a variety of first party Azure hardware and discover third party hardware offered by our partners. Edge Hardware Center lets you see and track all your order related information at one place.

## Management APIs

Create and manage Azure Edge Hardware Center orders.

Install the [NuGet package](https://www.nuget.org/packages/Azure.ResourceManager.EdgeOrder) directly from the Visual Studio [Package Manager console](https://docs.microsoft.com/nuget/tools/package-manager-console) or with the [.NET CLI](https://docs.microsoft.com/dotnet/core/tools/dotnet-add-package).

**Visual Studio Package Manager**

```powershell
Install-Package Azure.ResourceManager.EdgeOrder -IncludePrerelease
```

**.NET CLI**

```dotnetcli
dotnet add package Azure.ResourceManager.EdgeOrder --prerelease
```

### Code example

The following example gets an order item.

```csharp
var armClient = new ArmClient(new DefaultAzureCredential());
Subscription subscription = armClient.GetDefaultSubscription();
ResourceGroup resourceGroup = subscription.GetResourceGroups().Get(resourceGroupName);

OrderItemResourceCollection orderItemResourceCollection = resourceGroup.GetOrderItemResources();
OrderItemResource orderItemResource = orderItemResourceCollection.Get(orderItemName);
```

> [!div class="nextstepaction"]
> [Explore the management APIs](https://docs.microsoft.com/dotnet/api/overview/azure/edgehardwarecenter/management)
