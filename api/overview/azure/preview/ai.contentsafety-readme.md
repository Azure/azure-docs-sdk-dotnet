---
title: Azure AI Content Safety client library for .NET
keywords: Azure, dotnet, SDK, API, Azure.AI.ContentSafety, contentsafety
ms.date: 06/06/2023
ms.topic: reference
ms.devlang: dotnet
ms.service: contentsafety
---
# Azure AI Content Safety client library for .NET - version 1.0.0-beta.1 


[Azure AI Content Safety][contentsafety_overview] detects harmful user-generated and AI-generated content in applications and services. Content Safety includes several APIs that allow you to detect material that is harmful:

* Text Analysis API: Scans text for sexual content, violence, hate, and self harm with multi-severity levels.
* Image Analysis API: Scans images for sexual content, violence, hate, and self harm with multi-severity levels.
* Text Blocklist Management APIs: The default AI classifiers are sufficient for most content safety needs; however, you might need to screen for terms that are specific to your use case. You can create blocklists of terms to use with the Text API.

[Source code](https://github.com/Azure/azure-sdk-for-net/blob/Azure.AI.ContentSafety_1.0.0-beta.1/sdk/contentsafety/Azure.AI.ContentSafety) | [Package (NuGet)](https://www.nuget.org/packages/Azure.AI.ContentSafety) | [API reference documentation](https://azure.github.io/azure-sdk-for-net) | [Product documentation](https://learn.microsoft.com/azure/cognitive-services/content-safety/)

## Getting started

### Install the package

Install the client library for .NET with [NuGet](https://www.nuget.org/ ):

```dotnetcli
dotnet add package Azure.AI.ContentSafety --prerelease
```

### Prerequisites

* You need an [Azure subscription][azure_sub] to use this package.
* An existing [Azure AI Content Safety][contentsafety_overview] instance.

### Authenticate the client

#### Get the endpoint

You can find the endpoint for your Azure AI Content Safety service resource using the [Azure Portal][azure_portal] or [Azure CLI][azure_cli_endpoint_lookup]:

```bash
# Get the endpoint for the Azure AI Content Safety service resource
az cognitiveservices account show --name "resource-name" --resource-group "resource-group-name" --query "properties.endpoint"
```

#### Get the API key

The API key can be found in the [Azure Portal][azure_portal] or by running the following [Azure CLI][azure_cli_key_lookup] command:

```bash
az cognitiveservices account keys list --name "<resource-name>" --resource-group "<resource-group-name>"
```

#### Create a ContentSafetyClient with AzureKeyCredential

Pass the API key as a string into an instance of `AzureKeyCredential`.

```csharp
string endpoint = "https://<my-custom-subdomain>.cognitiveservices.azure.com/";
string key = "<api_key>";

ContentSafetyClient client = new ContentSafetyClient(new Uri(endpoint), new AzureKeyCredential(key));
```

## Key concepts

### Harm categories

Content Safety recognizes four distinct categories of objectionable content.

|Category |Description  |
|---------|---------|
|Hate |Hate refers to any content that attacks or uses pejorative or discriminatory language in reference to a person or identity group based on certain differentiating attributes of that group. This includes but is not limited to race, ethnicity, nationality, gender identity and expression, sexual orientation, religion, immigration status, ability status, personal appearance, and body size.|
|Sexual |Sexual describes content related to anatomical organs and genitals, romantic relationships, acts portrayed in erotic or affectionate terms, pregnancy, physical sexual acts—including those acts portrayed as an assault or a forced sexual violent act against one’s will—, prostitution, pornography, and abuse.|
|Violence |Violence describes content related to physical actions intended to hurt, injure, damage, or kill someone or something. It also includes weapons, guns and related entities, such as manufacturers, associations, legislation, and similar.|
|Self-harm |Self-harm describes content related to physical actions intended to purposely hurt, injure, or damage one’s body or kill oneself.|

Classification can be multi-labeled. For example, when a text sample goes through the text moderation model, it could be classified as both Sexual content and Violence.

### Severity levels

Every harm category the service applies also comes with a severity level rating. The severity level is meant to indicate the severity of the consequences of showing the flagged content.

|Severity |Label |
|---------|---------|
|0 |Safe|
|2 |Low|
|4 |Medium|
|6 |High|

### Text blocklist management

Following operations are supported to manage your text blocklist:

* Create or modify a blocklist
* List all blocklists
* Get a blocklist by blocklistName
* Add blockItems to a blocklist
* Remove blockItems from a blocklist
* List all blockItems in a blocklist by blocklistName
* Get a blockItem in a blocklist by blockItemId and blocklistName
* Delete a blocklist and all of its blockItems

You can set the blocklists you want to use when analyze text, then you can get blocklist match result from returned response.

### Thread safety

We guarantee that all client instance methods are thread-safe and independent of each other ([guideline](https://azure.github.io/azure-sdk/dotnet_introduction.html#dotnet-service-methods-thread-safety)). This ensures that the recommendation of reusing client instances is always safe, even across threads.

### Additional concepts
<!-- CLIENT COMMON BAR -->
[Client options](https://github.com/Azure/azure-sdk-for-net/blob/Azure.AI.ContentSafety_1.0.0-beta.1/sdk/core/Azure.Core/README.md#configuring-service-clients-using-clientoptions) |
[Accessing the response](https://github.com/Azure/azure-sdk-for-net/blob/Azure.AI.ContentSafety_1.0.0-beta.1/sdk/core/Azure.Core/README.md#accessing-http-response-details-using-responset) |
[Long-running operations](https://github.com/Azure/azure-sdk-for-net/blob/Azure.AI.ContentSafety_1.0.0-beta.1/sdk/core/Azure.Core/README.md#consuming-long-running-operations-using-operationt) |
[Handling failures](https://github.com/Azure/azure-sdk-for-net/blob/Azure.AI.ContentSafety_1.0.0-beta.1/sdk/core/Azure.Core/README.md#reporting-errors-requestfailedexception) |
[Diagnostics](https://github.com/Azure/azure-sdk-for-net/blob/Azure.AI.ContentSafety_1.0.0-beta.1/sdk/core/Azure.Core/samples/Diagnostics.md) |
[Mocking](https://github.com/Azure/azure-sdk-for-net/blob/Azure.AI.ContentSafety_1.0.0-beta.1/sdk/core/Azure.Core/README.md#mocking) |
[Client lifetime](https://devblogs.microsoft.com/azure-sdk/lifetime-management-and-thread-safety-guarantees-of-azure-sdk-net-clients/)
<!-- CLIENT COMMON BAR -->

## Examples

The following section provides several code snippets covering some of the most common Content Safety service tasks, including:

* [Analyze text](#analyze-text)
* [Analyze image](#analyze-image)
* [Manage text blocklist](#manage-text-blocklist)

Please refer to [sample data](https://github.com/Azure/azure-sdk-for-net/blob/Azure.AI.ContentSafety_1.0.0-beta.1/sdk/contentsafety/Azure.AI.ContentSafety/tests/Samples/sample_data) for the data used here. For more samples, please refer to [Samples](https://github.com/Azure/azure-sdk-for-net/blob/Azure.AI.ContentSafety_1.0.0-beta.1/sdk/contentsafety/Azure.AI.ContentSafety/tests/Samples).

### Analyze text

#### Analyze text without blocklists

```C# Snippet:Azure_AI_ContentSafety_AnalyzeText
string datapath = Path.Combine(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location), "Samples", "sample_data", "text.txt");
string text = File.ReadAllText(datapath);

var request = new AnalyzeTextOptions(text);

Response<AnalyzeTextResult> response;
try
{
    response = client.AnalyzeText(request);
}
catch (RequestFailedException ex)
{
    Console.WriteLine("Analyze text failed.\nStatus code: {0}, Error code: {1}, Error message: {2}", ex.Status, ex.ErrorCode, ex.Message);
    throw;
}

Console.WriteLine("Hate severity: {0}", response.Value.HateResult?.Severity ?? 0);
Console.WriteLine("SelfHarm severity: {0}", response.Value.SelfHarmResult?.Severity ?? 0);
Console.WriteLine("Sexual severity: {0}", response.Value.SexualResult?.Severity ?? 0);
Console.WriteLine("Violence severity: {0}", response.Value.ViolenceResult?.Severity ?? 0);
```

#### Analyze text with blocklists

```C# Snippet:Azure_AI_ContentSafety_AnalyzeTextWithBlocklist
// After you edit your blocklist, it usually takes effect in 5 minutes, please wait some time before analyzing with blocklist after editing.
var request = new AnalyzeTextOptions("I h*te you and I want to k*ll you");
request.BlocklistNames.Add(blocklistName);
request.BreakByBlocklists = true;

Response<AnalyzeTextResult> response;
try
{
    response = client.AnalyzeText(request);
}
catch (RequestFailedException ex)
{
    Console.WriteLine("Analyze text failed.\nStatus code: {0}, Error code: {1}, Error message: {2}", ex.Status, ex.ErrorCode, ex.Message);
    throw;
}

if (response.Value.BlocklistsMatchResults != null)
{
    Console.WriteLine("\nBlocklist match result:");
    foreach (var matchResult in response.Value.BlocklistsMatchResults)
    {
        Console.WriteLine("Blockitem was hit in text: Offset: {0}, Length: {1}", matchResult.Offset, matchResult.Length);
        Console.WriteLine("BlocklistName: {0}, BlockItemId: {1}, BlockItemText: {2}, ", matchResult.BlocklistName, matchResult.BlockItemId, matchResult.BlockItemText);
    }
}
```

### Analyze image

```C# Snippet:Azure_AI_ContentSafety_AnalyzeImage
string datapath = Path.Combine(Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location), "Samples", "sample_data", "image.jpg");
ImageData image = new ImageData() { Content = BinaryData.FromBytes(File.ReadAllBytes(datapath)) };

var request = new AnalyzeImageOptions(image);

Response<AnalyzeImageResult> response;
try
{
    response = client.AnalyzeImage(request);
}
catch (RequestFailedException ex)
{
    Console.WriteLine("Analyze image failed.\nStatus code: {0}, Error code: {1}, Error message: {2}", ex.Status, ex.ErrorCode, ex.Message);
    throw;
}

Console.WriteLine("Hate severity: {0}", response.Value.HateResult?.Severity ?? 0);
Console.WriteLine("SelfHarm severity: {0}", response.Value.SelfHarmResult?.Severity ?? 0);
Console.WriteLine("Sexual severity: {0}", response.Value.SexualResult?.Severity ?? 0);
Console.WriteLine("Violence severity: {0}", response.Value.ViolenceResult?.Severity ?? 0);
```

### Manage text blocklist

#### Create or update text blocklist

```C# Snippet:Azure_AI_ContentSafety_CreateNewBlocklist
var blocklistName = "TestBlocklist";
var blocklistDescription = "Test blocklist management";

var data = new
{
    description = blocklistDescription,
};

var createResponse = client.CreateOrUpdateTextBlocklist(blocklistName, RequestContent.Create(data));
if (createResponse.Status == 201)
{
    Console.WriteLine("\nBlocklist {0} created.", blocklistName);
}
else if (createResponse.Status == 200)
{
    Console.WriteLine("\nBlocklist {0} updated.", blocklistName);
}
```

#### Add blockItems

```C# Snippet:Azure_AI_ContentSafety_AddBlockItems
string blockItemText1 = "k*ll";
string blockItemText2 = "h*te";

var blockItems = new TextBlockItemInfo[] { new TextBlockItemInfo(blockItemText1), new TextBlockItemInfo(blockItemText2) };
var addedBlockItems = client.AddBlockItems(blocklistName, new AddBlockItemsOptions(blockItems));

if (addedBlockItems != null && addedBlockItems.Value != null)
{
    Console.WriteLine("\nBlockItems added:");
    foreach (var addedBlockItem in addedBlockItems.Value.Value)
    {
        Console.WriteLine("BlockItemId: {0}, Text: {1}, Description: {2}", addedBlockItem.BlockItemId, addedBlockItem.Text, addedBlockItem.Description);
    }
}
```

#### List text blocklists

```C# Snippet:Azure_AI_ContentSafety_ListBlocklists
var blocklists = client.GetTextBlocklists();
Console.WriteLine("\nList blocklists:");
foreach (var blocklist in blocklists)
{
    Console.WriteLine("BlocklistName: {0}, Description: {1}", blocklist.BlocklistName, blocklist.Description);
}
```

#### Get text blocklist

```C# Snippet:Azure_AI_ContentSafety_GetBlocklist
var getBlocklist = client.GetTextBlocklist(blocklistName);
if (getBlocklist != null && getBlocklist.Value != null)
{
    Console.WriteLine("\nGet blocklist:");
    Console.WriteLine("BlocklistName: {0}, Description: {1}", getBlocklist.Value.BlocklistName, getBlocklist.Value.Description);
}
```

#### List blockItems

```C# Snippet:Azure_AI_ContentSafety_ListBlockItems
var allBlockitems = client.GetTextBlocklistItems(blocklistName);
Console.WriteLine("\nList BlockItems:");
foreach (var blocklistItem in allBlockitems)
{
    Console.WriteLine("BlockItemId: {0}, Text: {1}, Description: {2}", blocklistItem.BlockItemId, blocklistItem.Text, blocklistItem.Description);
}
```

#### Get blockItem

```C# Snippet:Azure_AI_ContentSafety_GetBlockItem
var getBlockItemId = addedBlockItems.Value.Value[0].BlockItemId;
var getBlockItem = client.GetTextBlocklistItem(blocklistName, getBlockItemId);
Console.WriteLine("\nGet BlockItem:");
Console.WriteLine("BlockItemId: {0}, Text: {1}, Description: {2}", getBlockItem.Value.BlockItemId, getBlockItem.Value.Text, getBlockItem.Value.Description);
```

#### Remove blockItems

```C# Snippet:Azure_AI_ContentSafety_RemoveBlockItems
var removeBlockItemId = addedBlockItems.Value.Value[0].BlockItemId;
var removeBlockItemIds = new List<string> { removeBlockItemId };
var removeResult = client.RemoveBlockItems(blocklistName, new RemoveBlockItemsOptions(removeBlockItemIds));

if (removeResult != null && removeResult.Status == 204)
{
    Console.WriteLine("\nBlockItem removed: {0}.", removeBlockItemId);
}
```

#### Delete text blocklist

```C# Snippet:Azure_AI_ContentSafety_DeleteBlocklist
var deleteResult = client.DeleteTextBlocklist(blocklistName);
if (deleteResult != null && deleteResult.Status == 204)
{
    Console.WriteLine("\nDeleted blocklist.");
}
```

## Troubleshooting

### General

When you interact with the Azure AI Content Safety client library using the .NET SDK, errors returned by the service will result in a `RequestFailedException` with the same HTTP status code returned by the REST API request and error code defined by our service. You can parse the `RequestFailedException` like below:

```csharp
try
{
    response = client.AnalyzeText(request);
}
catch (RequestFailedException ex)
{
    Console.WriteLine("Analyze text failed.\nStatus code: {0}, Error code: {1}, Error message: {2}", ex.Status, ex.ErrorCode, ex.Message);
    throw;
}
```

Example console output:

```
Analyze text failed.
Status code: 400, Error code: InvalidRequestBody, Error message: The length of given text 1158 exceeds the limit 1000. | Request Id: a04c7c32-ef27-4c23-8b18-07545b24765b, Timestamp: 2023-06-01T16:43:52Z.
```

Error codes are defined as below:

|Error Code |Possible reasons |Suggestions|
|-----------|-------------------|-----------|
|InvalidRequestBody |One or more fields in the request body do not match the API definition. |1. Check the API version you specified in the API call.<br>2. Check the corresponding API definition for the API version you selected.|
|InvalidResourceName |The resource name you specified in the URL does not meet the requirements, like the blocklist name, blocklist term ID, etc. |1. Check the API version you specified in the API call.<br>2. Check whether the given name has invalid characters according to the API definition.|
|ResourceNotFound |The resource you specified in the URL may not exist, like the blocklist name. |1. Check the API version you specified in the API call.<br>2. Double check the existence of the resource specified in the URL.|
|InternalError |Some unexpected situations on the server side have been triggered. |1. You may want to retry a few times after a small period and see it the issue happens again.<br>2. Contact Azure Support if this issue persists.|
|ServerBusy |The server side cannot process the request temporarily. |1. You may want to retry a few times after a small period and see it the issue happens again.<br>2.Contact Azure Support if this issue persists.|
|TooManyRequests |The current RPS has exceeded the quota for your current SKU. |1. Check the pricing table to understand the RPS quota.<br>2.Contact Azure Support if you need more QPS.|

### Setting up console logging

The simplest way to see the logs is to enable the console logging.
To create an Azure SDK log listener that outputs messages to console use the AzureEventSourceListener.CreateConsoleLogger method.

```C#
// Setup a listener to monitor logged events.
using AzureEventSourceListener listener = AzureEventSourceListener.CreateConsoleLogger();
```

To learn more about other logging mechanisms see [Diagnostics Samples][logging].

## Next steps

### Additional documentation

For more extensive documentation on Azure Content Safety, see the [Azure AI Content Safety][contentsafety_overview] on docs.microsoft.com.

## Contributing

This project welcomes contributions and suggestions. Most contributions require you to agree to a Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us the rights to use your contribution. For details, visit [cla.microsoft.com][cla].

When you submit a pull request, a CLA-bot will automatically determine whether you need to provide a CLA and decorate the PR appropriately (e.g., label, comment). Simply follow the instructions provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct][code_of_conduct]. For more information see the [Code of Conduct FAQ][coc_faq] or contact [opencode@microsoft.com][coc_contact] with any additional questions or comments.

<!-- LINKS -->
[azure_sub]: https://azure.microsoft.com/free/
[contentsafety_overview]: https://aka.ms/acs-doc
[azure_portal]: https://ms.portal.azure.com/
[azure_cli_endpoint_lookup]: /cli/azure/cognitiveservices/account?view=azure-cli-latest#az-cognitiveservices-account-show
[azure_cli_key_lookup]: /cli/azure/cognitiveservices/account/keys?view=azure-cli-latest#az-cognitiveservices-account-keys-list
[logging]: https://github.com/Azure/azure-sdk-for-net/tree/Azure.AI.ContentSafety_1.0.0-beta.1/sdk/core/Azure.Core/samples/Diagnostics.md

[cla]: https://cla.microsoft.com
[code_of_conduct]: https://opensource.microsoft.com/codeofconduct/
[coc_faq]: https://opensource.microsoft.com/codeofconduct/faq/
[coc_contact]: mailto:opencode@microsoft.com



