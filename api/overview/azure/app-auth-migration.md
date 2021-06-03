---
title: App Authentication to Azure Identity Migration Guidance
description: App Authentication to Azure Identity Migration Guidance
keywords: Azure, .net, SDK, API, Azure.Identity, identity
author: jlichwa
ms.author: jalichwa
ms.date: 10/27/2020
ms.topic: article
ms.devlang: .net
ms.prod: azure
---

# AppAuthentication to Azure.Identity Migration Guidance

When the [Microsoft.Azure.Services.AppAuthentication](service-to-service-authentication.md) was first released in fall 2017, it was specifically designed to help mitigate the common and systemic issue of credentials in source code. It introduced a [new paradigm for app development](https://azure.microsoft.com/blog/the-green-team-solves-high-risk-systemic-security-issues-for-azure/) that allowed developers to write code once and let `AppAuthentication` client library determine how to authenticate based on the application environment - whether
on a developer workstation using a developer's account or deployed in Azure using a managed service identity. Developers could completely avoid directly handling credentials, both simplifying development and improving security by preventing credentials from being accidentally disclosed in source code. Given its simplicity and security benefits,
`AppAuthentication` has been well received by developers. The [NuGet](https://www.nuget.org/packages/Microsoft.Azure.Services.AppAuthentication) currently has over 27 million downloads and counting, and it is being used in other libraries and frameworks for Azure services, such as the [Azure Key Vault Configuration Provider in .NET
Core](https://docs.microsoft.com/aspnet/core/security/key-vault-configuration?view=aspnetcore-3.1&preserve-view=true)
and the [Microsoft.Azure.ServiceBus](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/servicebus/Microsoft.Azure.ServiceBus) SDK.

Released in fall 2019, the new [Azure.Identity client library](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/identity/Azure.Identity) can be considered the spiritual successor to the `AppAuthentication` library. Azure.Identity has a major advantage over `AppAuthentication` with its broader availability in multiple languages that provide consistent design and similar usage across these languages, whereas `AppAuthentication` is only available for .NET. In addition to its support of multiple languages, one key design feature of Azure.Identity is its various implementations of the abstract TokenCredential class, of which [newer Azure client SDKs
accept](https://azure.github.io/azure-sdk/releases/latest/dotnet.html). These newer Azure SDKs are easily distinguished by package names and namespaces that start with "Azure", i.e. "Azure.Identity", "Azure.Storage.Blobs". To authenticate, the desired type of TokenCredential object is instantiated and simply passed directly to the
Azure SDK client class. This design gives using Azure.Identity an additional security benefit over using AppAuthentication and older SDKs that require specifying the access token because access tokens do not
need to be directly handled by the application itself. This mitigates the additional risk of access tokens being accidentally disclosed through traces, logs, and other sources.

If you are starting development of a new application, it is strongly recommended to use `Azure.Identity` and the new Azure client SDKs. If you have an existing application that uses AppAuthentication and want to use Azure.Identity, the preferred path is to update your application to use the new Azure client SDKs that support accepting TokenCredentials. Over time, as developers' usage of Azure.Identity grows and as developers continue to migrate existing applications to Azure.Identity, further investment in AppAuthentication will be reduced. Eventually, the library will be deprecated. Using the `DefaultAzureCredential` in `Azure.Identity` will provide similar functionality to
`AzureServiceTokenProvider` in `AppAuthentication`, where the authentication provider used will change based on the current environment. If you are using an `AppAuthentication` connection string for a specific authentication provider using `AppAuthentication`, please see the below table to see how to use the same authentication provider by creating the appropriate TokenCredential in Azure.Identity.


|Auth Provider|AppAuthentication<br>Connection String|Azure.Identity<br>TokenCredential|
|---------|---------|---------|
|Default - environment-based | Default - no connection string used | new DefaultAzureCredential()*|
|Azure CLI| RunAs=Developer;<br>DeveloperTool=AzureCli|new AzureCliCredential()|
|Visual Studio|RunAs=Developer; DeveloperTool=VisualStudio|new VisualStudioCredential()|
|Windows Integrated Authentication|RunAs=CurrentUser| No support|
|System-assigned managed identity|RunAs=App|new ManagedIdentityCredential()|
|User-assigned managed identity|RunAs=App;AppId=appId|new ManagedIdentityCredential(appId)|
|Service principal client certificate|RunAs=App;AppId=appId;<br>KeyVaultCertificateSecretIdentifier=kvIdentifier|No support|
|Service principal client certificate|RunAs=App;AppId=appId;TenantId=tenantId;<br>CertificateThumbprint=thumbprint;<br>CertificateStoreLocation=location|new EnvironmentCredential()**<br> new ClientCertificateCredential(tenantId, appId, certObjOrFilePath)|
|Service principal client certificate|RunAs=App;AppId=appId;TenantId=tenantId;<br>CertificateSubjectName=subject;<br>CertificateStoreLocation=location|new EnvironmentCredential()**<br>new ClientCertificateCredential(tenantId, appId, certObjOrFilePath)|
|Service principal client secret|RunAs=App;AppId=appId;TenantId=tenantId;<br>AppKey=secret|new EnvironmentCredential()**<br>new ClientSecretCredential(tenantId, appId, secret)|

> [!NOTE]
> `*` Authentication providers and order is different between [AzureServiceTokenProvider](https://github.com/Azure/azure-sdk-for-net/blob/7d23a9d912da40baeebee1125eb5ebefa78449a2/sdk/mgmtcommon/AppAuthentication/Azure.Services.AppAuthentication/AzureServiceTokenProvider.cs#L104) and [DefaultAzureCredential](https://docs.microsoft.com/dotnet/api/overview/azure/identity-readme#defaultazurecredential)<br>
> `**` Need to set [environment variables](https://github.com/Azure/azure-sdk-for-net/tree/master/sdk/identity/Azure.Identity#environment-variables)

While Azure.Identity supports most authentication scenarios and providers that AppAuthentication has, there are some scenarios and features that are currently not supported:

-   Windows integrated authentication provider

-   System.Data.SqlClient.SqlAuthenticationProvider implementation
    (SqlAppAuthenticationProvider)

-   Directly use certificates in cert store as client credential (using subject name or thumbprint identifier)

-   Directly use certificates in Key Vault as client credential (using Key Vault certificate secret identifier)

-   Change authentication provider with environment config (i.e. connection strings in AppAuthentication)

    -   Limited support in Azure.Identity with EnvironmentCredential

-   Determine auth provider and identity used for environment-based authentication (i.e. AzureServiceTokenProvider.PrincipalUsed property)

Below are some examples of migrating from an older Azure client SDK using AppAuthentication to the newer version of the Azure client SDK using Azure.Identity. The code using Azure.Identity is more often than not going to be much more straightforward and simple than the AppAuthentication code

**Microsoft.Azure.KeyVault to Azure.Security.KeyVault:**

* Using `AppAuthentication` library
```csharp
AzureServiceTokenProvider tokenProvider = new AzureServiceTokenProvider();

var client = new KeyVaultClient(new KeyVaultClient.AuthenticationCallback(tokenProvider.KeyVaultTokenCallback));

var secretBundle = await client.GetSecretAsync("https://keyvaultname.vault.azure.net/secrets/secretname");

Console.WriteLine(secretBundle.Value);
```

* Using `Azure.Identity` library
```csharp
var client = new SecretClient(new Uri("https://keyvaultname.vault.azure.net"), new DefaultAzureCredential());

var secret = client.GetSecret("secretName").Value;

Console.WriteLine(secret.Value);
```

**Microsoft.Azure.Storage.Queues to Azure.Storage.Queues:**

* Using `AppAuthentication` library

```csharp
var tokenProvider = new AzureServiceTokenProvider();

var accessToken = await tokenProvider.GetAccessTokenAsync("https://storageaccountname.queue.core.windows.net");

var tokenCredential = new StorageTokenCredential(accessToken);

var storageCredentials = new StorageCredentials(tokenCredential);

var uri = new StorageUri(new Uri("https://storageaccountname.queue.core.windows.net"));

var client = new CloudQueueClient(uri, storageCredentials);

var queue = client.GetQueueReference("queuename");

queue.AddMessage(new CloudQueueMessage("Microsoft.Azure.Storage.Queues"));
```

* Using `Azure.Identity` library
```csharp
QueueClient queueClient = new QueueClient(new Uri("https://storageaccountname.queue.core.windows.net/queuename"),new DefaultAzureCredential());

queueClient.SendMessage("Azure.Storage.Queues");
```


**Access token retrival**

* Using `AppAuthentication` library

```csharp
var tokenProvider = new AzureServiceTokenProvider();

var accessToken = await tokenProvider.GetAccessTokenAsync(ResourceId);
```

* Using `Azure.Identity` library

```csharp
var tokenCredential = new DefaultAzureCredential();
var accessToken = await tokenCredential.GetTokenAsync(
    new TokenRequestContext(scopes: new string[] { ResourceId + "/.default" }) { }
);
```

Note: More information on the `.default` scope can be found [here](https://docs.microsoft.com/en-us/azure/active-directory/develop/v2-permissions-and-consent#the-default-scope).
