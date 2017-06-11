---
title: Azure storage management libraries
description: 
keywords: Azure, .NET, SDK, API, patterns, concepts, fluent, logging
author: camsoper
ms.author: casoper
manager: douge
ms.date: 05/08/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.service: multiple
ms.assetid: 
---

# Azure storage management library concepts

This is a sample article to demostrate service conceptual page.

## subtitle 1

Here's some code example:

```csharp
var azure = Azure
    .Configure()
    .Authenticate(credentials)
    .WithDefaultSubscription();
```