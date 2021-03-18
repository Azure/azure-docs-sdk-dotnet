---
title: Azure Functions libraries for .NET
description: Reference for Azure Functions libraries for .NET
ms.date: 03/15/2021
ms.topic: reference
ms.service: azure-functions
---

# Azure Functions libraries for .NET

## Overview

[Azure Functions](/azure/azure-functions/functions-overview) is a solution for easily running small pieces of code, or _functions_, in Azure. Azure Functions supports a [serverless](https://azure.microsoft.com/solutions/serverless/) execution model.

## .NET isolated process

Azure Functions provides APIs that let you develop [.NET isolated process functions](/azure/azure-functions/dotnet-isolated-process-guide). These .NET functions run out-of-process in Azure Functions. Running out-of-process lets you decouple your function code from the Azure Functions runtime. It also provides a way for you to create and run functions that target the current .NET 5.0 release. 

Functions that run on .NET 5.0 in an isolated process require a set of NuGet packages that are different from the packages that are required by .NET class library functions, which running in-process with the Functions runtime. The core .NET isolated runtime packages are the following:

+ [Microsoft.Azure.Functions.Worker](https://www.nuget.org/packages/Microsoft.Azure.Functions.Worker/)
+ [Microsoft.Azure.Functions.Worker.Sdk](https://www.nuget.org/packages/Microsoft.Azure.Functions.Worker.Sdk/)

Because functions that run in a .NET isolated process use different binding types, they require a unique set of binding extension packages. You'll find these extension packages under [Microsoft.Azure.Functions.Worker.Extensions](https://www.nuget.org/packages?q=Microsoft.Azure.Functions.Worker.Extensions). 

The Azure API reference documentation currently supports only [.NET isolated process functions](/dotnet/api/overview/azure/functions/runtime). 

### Visual Studio package manager

```powershell
Install-Package Microsoft.Azure.Functions.Worker
Install-Package Microsoft.Azure.Functions.Worker.Sdk
```

### .NET Core CLI

```dotnetcli
dotnet add package Microsoft.Azure.Functions.Worker
dotnet add package Microsoft.Azure.Functions.Worker.Sdk
```

### Getting started

> [!div class="nextstepaction"]
> [Create .NET isolated process functions](/azure/azure-functions/dotnet-isolated-process-developer-howtos)

## Durable Functions extension

*Durable Functions* is an extension of [Azure Functions](/azure/azure-functions/functions-overview) that lets you write stateful functions in a serverless compute environment. The extension lets you define stateful workflows by writing [*orchestrator functions*](/azure/azure-functions/durable/durable-functions-orchestrations) and stateful entities by writing [*entity functions*](/azure/azure-functions/durable/durable-functions-entities) using the Azure Functions programming model. Behind the scenes, the extension manages state, checkpoints, and restarts for you, allowing you to focus on your business logic.

Install the extension [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.WebJobs.Extensions.DurableTask) directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].

The Azure API reference documentation supports [version 2.x of the Durable Functions extension](/dotnet/api/overview/azure/functions/runtime). 

### Visual Studio package manager

```powershell
Install-Package Microsoft.Azure.WebJobs.Extensions.DurableTask
```

### .NET Core CLI

```dotnetcli
dotnet add package Microsoft.Azure.WebJobs.Extensions.DurableTask
```

### Getting started

> [!div class="nextstepaction"]
> [Durable Functions quickstart](/azure/azure-functions/durable/durable-functions-create-first-csharp)

## Samples

View the [complete list](/samples/browse/?products=azure-functions&languages=csharp) of Azure Functions samples.

[PackageManager]: /nuget/tools/package-manager-console
[DotNetCLI]: /dotnet/core/tools/dotnet-add-package
