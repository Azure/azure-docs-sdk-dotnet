---
title: Azure Easm client library for .NET
keywords: Azure, dotnet, SDK, API, Azure.Analytics.Defender.Easm, easm
ms.date: 03/04/2024
ms.topic: reference
ms.devlang: dotnet
ms.service: easm
---
# Azure Easm client library for .NET - version 1.0.0-beta.1 


Microsoft Defender External Attack Surface Management (Defender EASM)\* continuously discovers and maps your digital attack surface to provide an external view of your online infrastructure. This visibility enables security and IT teams to identify unknowns, prioritize risk, eliminate threats, and extend vulnerability and exposure control beyond the firewall. Defender EASM leverages Microsoft's crawling technology to discover assets that are related to your known online infrastructure, and actively scans these assets to discover new connections over time. Attack Surface Insights are generated by leveraging vulnerability and infrastructure data to showcase the key areas of concern for your organization.

## Getting started

### Install the package

Install the client library for .NET with [NuGet](https://www.nuget.org/ ):

```dotnetcli
dotnet add package Azure.Analytics.Defender.Easm --prerelease
```

### Prerequisites
> You must have an [Azure subscription](https://azure.microsoft.com/free/dotnet/) and [EASM workspace](https://learn.microsoft.com/azure/external-attack-surface-management/deploying-the-defender-easm-azure-resource).

### Authenticate the client

The examples shown below use a [`DefaultAzureCredential`][DefaultAzureCredential], which is appropriate for most scenarios including local development and production environments utilizing managed identity authentication.

You can find more information on different ways of authenticating and their corresponding credential types in the [Azure Identity][azure_identity] documentation.

To use the `DefaultAzureCredential` provider shown below,
or other credential providers provided with the Azure SDK, you must first install the Azure.Identity package:

```dotnetcli
dotnet add package Azure.Identity
```

To create an EasmClient, you need your subscription ID, region, and some sort of credential. Below is an example using the DefaultAzureCredential.

```C# Snippet:Sample1_AssetResources_Create_Client
            string endpoint = "https://<region>.easm.defender.microsoft.com/subscriptions/<Your_Subscription_Id>/resourceGroups/<Your_Resource_Group_Name>/workspaces/<Your_Workspace_Name>";
EasmClient client = new EasmClient(new System.Uri(endpoint),
                new DefaultAzureCredential());
```

## Key concepts

### [Assets][assets_documentation]

Defender EASM includes the discovery of the following kinds of assets:
-   Domains
-   Hosts
-   Pages
-   IP Blocks
-   IP Addresses
-   Autonomous System Numbers (ASNs)
-   SSL Certificates
-   WHOIS Contacts

These asset types comprise your attack surface inventory in Defender EASM. This solution discovers externally facing assets that are exposed to the open internet outside of traditional firewall protection; they need to be monitored and maintained to minimize risk and improve an organization’s security posture. Microsoft Defender External Attack Surface Management (Defender EASM) actively discovers and monitors these assets, then surfacing key insights that help customers efficiently address any vulnerabilities in their organization.

### [Discovery][discovery_documentation]

Microsoft Defender External Attack Surface Management (Defender EASM) relies on our proprietary discovery technology to continuously define your organization’s unique Internet-exposed attack surface. Discovery scans known assets owned by your organization to uncover previously unknown and unmonitored properties. Discovered assets are indexed in a customer’s inventory, providing a dynamic system of record of web applications, third party dependencies, and web infrastructure under the organization’s management through a single pane of glass.

#### [Discovery groups][discovery_groups_documentation]

Custom discoveries are organized into Discovery Groups. They are independent seed clusters that comprise a single discovery run and operate on their own recurrence schedules. Users can elect to organize their Discovery Groups to delineate assets in whatever way best benefits their company and workflows. Common options include organizing by responsible team/business unit, brands or subsidiaries.

### Thread safety

We guarantee that all client instance methods are thread-safe and independent of each other ([guideline](https://azure.github.io/azure-sdk/dotnet_introduction.html#dotnet-service-methods-thread-safety)). This ensures that the recommendation of reusing client instances is always safe, even across threads.

### Additional concepts

<!-- CLIENT COMMON BAR -->
[Client options](https://github.com/Azure/azure-sdk-for-net/blob/Azure.Analytics.Defender.Easm_1.0.0-beta.1/sdk/core/Azure.Core/README.md#configuring-service-clients-using-clientoptions) |
[Accessing the response](https://github.com/Azure/azure-sdk-for-net/blob/Azure.Analytics.Defender.Easm_1.0.0-beta.1/sdk/core/Azure.Core/README.md#accessing-http-response-details-using-responset) |
[Long-running operations](https://github.com/Azure/azure-sdk-for-net/blob/Azure.Analytics.Defender.Easm_1.0.0-beta.1/sdk/core/Azure.Core/README.md#consuming-long-running-operations-using-operationt) |
[Handling failures](https://github.com/Azure/azure-sdk-for-net/blob/Azure.Analytics.Defender.Easm_1.0.0-beta.1/sdk/core/Azure.Core/README.md#reporting-errors-requestfailedexception) |
[Diagnostics](https://github.com/Azure/azure-sdk-for-net/blob/Azure.Analytics.Defender.Easm_1.0.0-beta.1/sdk/core/Azure.Core/samples/Diagnostics.md) |
[Mocking](https://learn.microsoft.com/dotnet/azure/sdk/unit-testing-mocking) |
[Client lifetime](https://devblogs.microsoft.com/azure-sdk/lifetime-management-and-thread-safety-guarantees-of-azure-sdk-net-clients/)
<!-- CLIENT COMMON BAR -->

## Examples

You can familiarize yourself with different APIs using [Samples](https://github.com/Azure/azure-sdk-for-net/tree/Azure.Analytics.Defender.Easm_1.0.0-beta.1/sdk/easm/Azure.Analytics.Defender.Easm/samples).

### View assets

You can call the client's `AssetsList` method to view your assets.

```C# Snippet:Sample1_AssetResources_Get_Assets
var response = client.GetAssetResources();
int index = 0;
foreach (AssetResource asset in response)
{
    Console.WriteLine($"Asset Name: {asset.Name}, Kind: {asset.GetType()}");
    if (index++ > 5)
    {
        break;
    }
}
```

### Create discovery group
 
You can call the client's `DiscoGroupCreateOrReplace` method to create or replace your disco group

```C# Snippet:Sample2_DiscoveryGroups_Create_Discovery_Group
string discoveryGroupName = "Sample Disco From C#";
string discoveryGroupDescription = "This is a sample discovery group generated from C#";
            string[] hosts = new string[2];
hosts[0] = "<host1>.com";
hosts[1] = "<host2>.com";
string[] domains = new string[2];
domains[0] = "<domain1>.com";
domains[1] = "<domain2>.com";
                        DiscoveryGroupPayload request = new DiscoveryGroupPayload();
foreach (var host in hosts)
{
    DiscoverySource seed = new DiscoverySource();
    seed.Kind = DiscoverySourceKind.Host;
    seed.Name = host;
    request.Seeds.Add(seed);
}
foreach (var domain in domains)
{
    DiscoverySource seed = new DiscoverySource();
    seed.Kind = DiscoverySourceKind.Domain;
    seed.Name = domain;
    request.Seeds.Add(seed);
}

request.Description = discoveryGroupDescription;
client.CreateOrReplaceDiscoveryGroup(discoveryGroupName, request);
```

### Run the discovery group

You can call client's `DiscoGroupRun` method to run a disco group

```C# Snippet:Sample2_DiscoveryGroups_Run
client.RunDiscoveryGroup(discoveryGroupName);
Pageable<DiscoveryGroup> response = client.GetDiscoveryGroups();
foreach (DiscoveryGroup discoGroup in response)
{
    Console.WriteLine(discoGroup.Name);
    Pageable<DiscoveryRunResult> discoRunPageResponse = client.GetDiscoveryGroupRuns(discoGroup.Name);
    int index = 0;
    foreach (DiscoveryRunResult discoRun in discoRunPageResponse)
    {
        Console.WriteLine($" - started: {discoRun.StartedDate}, finished: {discoRun.CompletedDate}, assets found: {discoRun.TotalAssetsFoundCount}, status: {discoRun.State}");
        if (++index == 5){
            break;
        }
    }
}
```


## Troubleshooting

### Enabling logging
Azure SDKs for .NET offer a consistent logging story to help aid in troubleshooting application errors and expedite
their resolution. The logs produced will capture the flow of an application before reaching the terminal state to help
locate the root issue. View the [logging][logging] wiki for guidance about enabling logging.

## Next steps

For more information about Microsoft Azure SDK, see [this website](https://azure.github.io/azure-sdk/).

## Contributing

This project welcomes contributions and suggestions. Most contributions require you to agree to a Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us the rights to use your contribution. For details, visit <https://cla.microsoft.com>.

When you submit a pull request, a CLA-bot will automatically determine whether you need to provide a CLA and decorate the PR appropriately (e.g., label, comment). Simply follow the instructions provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct][code_of_conduct]. For more information see the [Code of Conduct FAQ][code_of_conduct_faq] or contact opencode@microsoft.com with any additional questions or comments.

<!-- LINKS -->
[code_of_conduct_faq]: https://opensource.microsoft.com/codeofconduct/faq/
[style-guide-msft]: /style-guide/capitalization
[style-guide-cloud]: https://aka.ms/azsdk/cloud-style-guide



