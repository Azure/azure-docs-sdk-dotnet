---
title: Azure.ResourceManager.Search overview
description: API reference for Azure.ResourceManager.Search, a client library for managing an Azure Cognitive Search resource using the Azure SDK for .NET.
keywords: Azure, dotnet, SDK, API, Azure.ResourceManager.Search, cognitive-search
author: ShivangiReja
ms.author: shreja
ms.date: 07/21/2023
ms.topic: reference
ms.devlang: dotnet
ms.service: cognitive-search
---

# Azure.ResourceManager.Search client library for .NET

This library provides resource management APIs for Azure Cognitive Search. Use this library for control plane operations, such as creating, configuring, and managing a search service. 

`Azure.ResourceManager.Search` replaces the previous management libraries for the (`Microsoft.Azure.Management.Search`) namespace, which are now deprecated. For descriptions of all Azure Cognitive Search client libraries in this SDK, see the [Azure Cognitive Search libraries for .NET](/dotnet/api/overview/azure/search).

This library follows the [new Azure SDK guidelines](https://azure.github.io/azure-sdk/general_introduction.html).

## Getting started

### Install the package

Install the Microsoft Azure Cognitive Search management library for .NET with [NuGet](https://www.nuget.org/):

```dotnetcli
dotnet add package Azure.ResourceManager.Search
```

### Prerequisites

* You must have an [Microsoft Azure subscription](https://azure.microsoft.com/free/dotnet/).

* You must be an **Owner** or **Contributor** on the subscription to call these APIs.

### Authenticate the client

Control plane operations are authenticated using Azure Active Directory. To create an authenticated client and start interacting with Microsoft Azure resources, see the [quickstart guide here](https://github.com/Azure/azure-sdk-for-net/blob/Azure.ResourceManager.Search_1.1.0/doc/dev/mgmt_quickstart.md).

## Key concepts

* Key concepts of the Microsoft Azure SDK for .NET can be found [here](https://azure.github.io/azure-sdk/dotnet_introduction.html).
* Key concepts for Cognitive Search can be found in the [Azure Cognitive Search documentation](/azure/search/).

## Documentation

Azure SDK documentation is available to help you learn how to use this package:

* [Quickstart](https://github.com/Azure/azure-sdk-for-net/blob/Azure.ResourceManager.Search_1.1.0/doc/dev/mgmt_quickstart.md).
* [API References](/dotnet/api/).
* [Authentication](https://github.com/Azure/azure-sdk-for-net/blob/Azure.ResourceManager.Search_1.1.0/sdk/identity/Azure.Identity/README.md).

## Examples

Code samples for using the management library for .NET can be found in the following locations:

* [.NET Management Library Code Samples](https://aka.ms/azuresdk-net-mgmt-samples)

## Troubleshooting

* File an issue via [GitHub Issues](https://github.com/Azure/azure-sdk-for-net/issues).
* Check [previous questions](https://stackoverflow.com/questions/tagged/azure+.net) or ask new ones on Stack Overflow using Azure and .NET tags.

## Next steps

For more information about Microsoft Azure SDK, see [this website](https://azure.github.io/azure-sdk/).

## Contributing

For details on contributing to this repository, see the [contributing
guide][cg].

This project welcomes contributions and suggestions. Most contributions
require you to agree to a Contributor License Agreement (CLA) declaring
that you have the right to, and actually do, grant us the rights to use
your contribution. For details, visit <https://cla.microsoft.com>.

When you submit a pull request, a CLA-bot automatically determines
whether you need to provide a CLA and decorate the PR appropriately
(for example, label, comment). Follow the instructions provided by the
bot. You only need to do this action once across all repositories
using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct][coc]. For
more information, see the [Code of Conduct FAQ][coc_faq] or contact
<opencode@microsoft.com> with any other questions or comments.

<!-- LINKS -->
[cg]: https://github.com/Azure/azure-sdk-for-net/blob/Azure.ResourceManager.Search_1.1.0/sdk/resourcemanager/Azure.ResourceManager/docs/CONTRIBUTING.md
[coc]: https://opensource.microsoft.com/codeofconduct/
[coc_faq]: https://opensource.microsoft.com/codeofconduct/faq/
