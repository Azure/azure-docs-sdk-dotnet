---
title: Azure Communication Phone Numbers client library for .NET
keywords: Azure, dotnet, SDK, API, Azure.Communication.PhoneNumbers, communication
description: Purchase Numbers for direct offer or direct routing. Configure number calling capabilities. Configure direct routing in order to connect customer-provided telephony infrastructure to Azure Communication Resources
author: ramya-rao-a
ms.author: nostojic
ms.date: 03/16/2023
ms.topic: reference
ms.prod: azure
ms.devlang: dotnet
ms.service:
---

# Azure Communication Phone Numbers client library for .NET - version 1.2.0


The phone numbers library provides capabilities for phone number administration.

Purchased phone numbers can come with many capabilities, depending on the country, number type and assignment type. Examples of capabilities are SMS inbound and outbound usage, PSTN inbound and outbound usage. Phone numbers can also be assigned to a bot via a webhook URL.

[Source code][source] <!--| [Package (NuGet)][package]--> | [Product documentation][product_docs] | [Samples][source_samples]

## Getting started

### Prerequisites

You need an [Azure subscription][azure_sub] and a [Communication Service Resource][communication_resource_docs] to use this package.

To create a new Communication Service, you can use the [Azure portal][communication_resource_create_portal], the [Azure PowerShell][communication_resource_create_power_shell], or the [.NET management client library][communication_resource_create_net].

### Install the package

Install the Azure Communication Phone Numbers client library for .NET with [NuGet][nuget]:

```Powershell
dotnet add package Azure.Communication.PhoneNumbers --version 1.0.0
```

## Key concepts

This SDK provides functionality to easily manage `direct offer` and `direct routing` numbers.

The `direct offer` numbers come in two types: Geographic and Toll-Free. Geographic phone plans are phone plans associated with a location, whose phone numbers' area codes are associated with the area code of a geographic location. Toll-Free phone plans are phone plans not associated location. For example, in the US, toll-free numbers can come with area codes such as 800 or 888. They are managed using the PhoneNumbersClient

The `direct routing` feature enables connecting your existing telephony infrastructure to ACS. The configuration is managed using the SipRoutingClient. Client provides methods for setting up SIP trunks and voice routing rules, in order to properly handle calls for your telephony subnet.

## Phone number client

### Phone number types

Phone numbers come in two types; Geographic and Toll-Free. Geographic phone numbers are phone numbers associated with a location, whose area codes are associated with the area code of a geographic location. Toll-Free phone numbers are not associated with a location. For example, in the US, toll-free numbers can come with area codes such as 800 or 888.

All geographic phone numbers within the same country are grouped into a phone plan group with a Geographic phone number type. All Toll-Free phone numbers within the same country are grouped into a phone plan group.

### Searching and acquiring numbers

Phone numbers can be searched through the search creation API by providing a phone number type (geographic or toll-free), assignment type (person or application), calling and sms capabilities, an area code and quantity of phone numbers. The provided quantity of phone numbers will be reserved for 15 minutes. This search of phone numbers can either be canceled or purchased. If the search is canceled, then the phone numbers become available to others. If the search is purchased, then the phone numbers are acquired for the Azure resource.

### Configuring phone numbers

Phone numbers can have a combination of capabilities. They can be configured to support inbound and/or outbound calling, or neither if you won't use the phone number for calling. The same applies to sms capabilities.

It is important to consider the assignment type of your phone number. Some capabilities are restricted to a particular assignment type.

## Sip routing client

Direct routing feature allows connecting customer-provided telephony infrastructure to Azure Communication Resources. In order to set up routing configuration properly, customer needs to supply the SIP trunk configuration and SIP routing rules for calls. SIP routing client provides the necessary interface for setting this configuration.

When call is made, system tries to match the destination number with regex number patterns of defined routes. The first route to match the number will be selected. The order of regex matching is the same as the order of routes in configuration, therefore the order of routes matters. Once a route is matched, the call is routed to the first trunk in the route's trunks list. If the trunk is not available, next trunk in the list is selected.

## Examples

### Authenticate the client

Phone Number client and Sip Routing client can be authenticated using connection string acquired from an Azure Communication Resources in the [Azure portal][azure_portal].

```C# Snippet:CreatePhoneNumbersClient
// Get a connection string to our Azure Communication resource.
var connectionString = "<connection_string>";
var client = new PhoneNumbersClient(connectionString);
```

```C# Snippet:CreateSipRoutingClient
// Get a connection string to our Azure Communication resource.
var connectionString = "<connection_string>";
var client = new SipRouting(connectionString);
```

Clients also have the option to authenticate with Azure Active Directory Authentication. With this option,
`AZURE_CLIENT_SECRET`, `AZURE_CLIENT_ID` and `AZURE_TENANT_ID` environment variables need to be set up for authentication.

```C# Snippet:CreatePhoneNumbersClientWithTokenCredential
// Get an endpoint to our Azure Communication resource.
var endpoint = new Uri("<endpoint_url>");
TokenCredential tokenCredential = new DefaultAzureCredential();
client = new PhoneNumbersClient(endpoint, tokenCredential);
```

```C# Snippet:CreateSipRoutingClientWithTokenCredential
// Get an endpoint to our Azure Communication resource.
var endpoint = new Uri("<endpoint_url>");
TokenCredential tokenCredential = new DefaultAzureCredential();
client = new SipRouting(endpoint, tokenCredential);
```

### Thread safety

We guarantee that all client instance methods are thread-safe and independent of each other ([guideline](https://azure.github.io/azure-sdk/dotnet_introduction.html#dotnet-service-methods-thread-safety)). This ensures that the recommendation of reusing client instances is always safe, even across threads.

### Additional concepts

<!-- CLIENT COMMON BAR -->
[Client options](https://github.com/Azure/azure-sdk-for-net/blob/Azure.Communication.PhoneNumbers_1.0.1/sdk/core/Azure.Core/README.md#configuring-service-clients-using-clientoptions) |
[Accessing the response](https://github.com/Azure/azure-sdk-for-net/blob/Azure.Communication.PhoneNumbers_1.0.1/sdk/core/Azure.Core/README.md#accessing-http-response-details-using-responset) |
[Long-running operations](https://github.com/Azure/azure-sdk-for-net/blob/Azure.Communication.PhoneNumbers_1.0.1/sdk/core/Azure.Core/README.md#consuming-long-running-operations-using-operationt) |
[Handling failures](https://github.com/Azure/azure-sdk-for-net/blob/Azure.Communication.PhoneNumbers_1.0.1/sdk/core/Azure.Core/README.md#reporting-errors-requestfailedexception) |
[Diagnostics](https://github.com/Azure/azure-sdk-for-net/blob/Azure.Communication.PhoneNumbers_1.0.1/sdk/core/Azure.Core/samples/Diagnostics.md) |
[Mocking](https://github.com/Azure/azure-sdk-for-net/blob/Azure.Communication.PhoneNumbers_1.0.1/sdk/core/Azure.Core/README.md#mocking) |
[Client lifetime](https://devblogs.microsoft.com/azure-sdk/lifetime-management-and-thread-safety-guarantees-of-azure-sdk-net-clients/)
<!-- CLIENT COMMON BAR -->

## Usage

The following sections provide code snippets that cover some of the common tasks using the Azure Communication Services Phone Numbers client. The scenarios that are covered here consist of:

PhoneNumbersClient

- [Search for available phone numbers](#search-for-available-phone-numbers)
- [Purchase phone numbers from a search](#purchase-phone-numbers-from-a-search)
- [Release a purchased phone number](#release-a-purchased-phone-number)
- [List purchased phone numbers](#list-purchased-phone-numbers)

SipRoutingClient

- [Retrieve SIP trunks and routes](#retrieve-sip-trunks-and-routes)
- [Replace SIP trunks and routes](#replace-sip-trunks-and-routes)
- [Retrieve single trunk](#retrieve-single-trunk)
- [Set single trunk](#set-single-trunk)
- [Delete single trunk](#delete-single-trunk)

## PhoneNumberClient

## Search for available phone numbers

Phone numbers need to be searched before they can be purchased. Search is a long running operation that can be started by `StartSearchAvailablePhoneNumbers` function that returns an `SearchAvailablePhoneNumbersOperation` object. `SearchAvailablePhoneNumbersOperation` can be used to update status of the operation and to check for completeness.

```C# Snippet:SearchPhoneNumbersAsync
var capabilities = new PhoneNumberCapabilities(calling:PhoneNumberCapabilityType.None, sms:PhoneNumberCapabilityType.Outbound);

var searchOperation = await client.StartSearchAvailablePhoneNumbersAsync(countryCode, PhoneNumberType.TollFree, PhoneNumberAssignmentType.Application, capabilities);
await searchOperation.WaitForCompletionAsync();
```

## Purchase phone numbers from a search

Phone numbers can be acquired through purchasing a search.

```C# Snippet:StartPurchaseSearchAsync
var purchaseOperation = await client.StartPurchasePhoneNumbersAsync(searchOperation.Value.SearchId);
await purchaseOperation.WaitForCompletionResponseAsync();
```

## List purchased phone numbers

You can list all phone numbers that have been purchased for your resource.

```C# Snippet:GetPurchasedPhoneNumbersAsync
var purchasedPhoneNumbers = client.GetPurchasedPhoneNumbersAsync();

await foreach (var phoneNumber in purchasedPhoneNumbers)
{
    Console.WriteLine($"Phone number: {phoneNumber.PhoneNumber}, monthly cost: {phoneNumber.Cost}");
}
```

## Release a purchased phone number

If you no longer need a phone number, you can release it.

```C# Snippet:ReleasePhoneNumbersAsync
var purchasedPhoneNumber = "<purchased_phone_number>";
var releaseOperation = await client.StartReleasePhoneNumberAsync(purchasedPhoneNumber);
await releaseOperation.WaitForCompletionResponseAsync();
```

## SipRoutingClient

### Retrieve SIP trunks and routes

Get the list of currently configured trunks or routes.

```C# Snippet:RetrieveListAsync
var trunksResponse = await client.GetTrunksAsync();
var routesResponse = await client.GetRoutesAsync();
```

### Replace SIP trunks and routes

Replace the list of currently configured trunks or routes.

```C# Snippet:ReplaceAsync
// The service will not allow trunks that are used in any of the routes to be deleted, therefore first set the routes as empty list, and then update the routes.
var newTrunks = "<new_trunks_list>";
var newRoutes = "<new_routes_list>";
await client.SetRoutesAsync(new List<SipTrunkRoute>());
await client.SetTrunksAsync(newTrunks);
await client.SetRoutesAsync(newRoutes);
```

### Manage single trunk

SIP trunks can be managed separately by using the `SipRoutingClient` to retrieve, set or delete a single trunk.

### Retrieve single trunk

```C# Snippet:RetrieveTrunkAsync
// Get trunk object, based on it's FQDN.
var fqdnToRetrieve = "<fqdn>";
var trunkResponse = await client.GetTrunkAsync(fqdnToRetrieve);
```

### Set single trunk

```C# Snippet:SetTrunkAsync
// Set function will either modify existing item or add new item to the collection.
// The trunk is matched based on it's FQDN.
var trunkToSet = "<trunk_to_set>";
await client.SetTrunkAsync(trunkToSet);
```

### Delete single trunk

```C# Snippet:DeleteTrunkAsync
// Deletes trunk with supplied FQDN.
var fqdnToDelete = "<fqdn>";
await client.DeleteTrunkAsync(fqdnToDelete);
```

## Troubleshooting

## Next steps

[Read more about managing phone numbers][phone_numbers]

## Contributing

This project welcomes contributions and suggestions. Most contributions require you to agree to a Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us the rights to use your contribution. For details, visit [cla.microsoft.com][cla].

This project has adopted the [Microsoft Open Source Code of Conduct][coc]. For more information, see the [Code of Conduct FAQ][coc_faq] or contact [opencode@microsoft.com][coc_contact] with any additional questions or comments.

## Related projects

- [Microsoft Azure SDK for DotNet](https://github.com/Azure/azure-sdk-for-net)

<!-- LINKS -->

[azure_sub]: https://azure.microsoft.com/free/
[azure_portal]: https://portal.azure.com
[source]: https://github.com/Azure/azure-sdk-for-net/tree/Azure.Communication.PhoneNumbers_1.0.1/sdk/communication/Azure.Communication.PhoneNumbers/src
[source_samples]: https://github.com/Azure/azure-sdk-for-net/blob/Azure.Communication.PhoneNumbers_1.0.1/sdk/communication/Azure.Communication.PhoneNumbers/samples
[cla]: https://cla.microsoft.com
[coc]: https://opensource.microsoft.com/codeofconduct/
[coc_faq]: https://opensource.microsoft.com/codeofconduct/faq/
[coc_contact]: mailto:opencode@microsoft.com
<!--[package]: https://www.nuget.org/packages/Azure.Communication.PhoneNumbers-->
[phone_numbers]: https://docs.microsoft.com/azure/communication-services/quickstarts/telephony-sms/get-phone-number?pivots=programming-language-csharp
[product_docs]: https://docs.microsoft.com/azure/communication-services/overview
[nuget]: https://www.nuget.org/
[communication_resource_docs]: https://docs.microsoft.com/azure/communication-services/quickstarts/create-communication-resource?tabs=windows&pivots=platform-azp
[communication_resource_create_portal]: https://docs.microsoft.com/azure/communication-services/quickstarts/create-communication-resource?tabs=windows&pivots=platform-azp
[communication_resource_create_power_shell]: https://docs.microsoft.com/powershell/module/az.communication/new-azcommunicationservice
[communication_resource_create_net]: https://docs.microsoft.com/azure/communication-services/quickstarts/create-communication-resource?tabs=windows&pivots=platform-net

