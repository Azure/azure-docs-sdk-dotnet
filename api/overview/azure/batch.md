---
title: Azure Batch libraries for .NET
description: Reference for Azure Batch libraries for .NET
keywords: Azure, .NET, SDK, API, Batch
author: camsoper
ms.author: casoper
manager: douge
ms.date: 08/01/2017
ms.topic: reference
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.service: multiple
---

# Azure Batch libraries for .NET

Azure Batch is a platform service for running large-scale parallel and high-performance computing (HPC) applications efficiently in the cloud. Azure Batch schedules compute-intensive work to run on a managed collection of virtual machines, and can automatically scale compute resources to meet the needs of your jobs.

With Azure Batch, you can easily define Azure compute resources to execute your applications in parallel, and at scale. There's no need to manually create, configure, and manage an HPC cluster, individual virtual machines, virtual networks, or a complex job and task scheduling infrastructure. Azure Batch automates or simplifies these tasks for you.

Read more about how to [run intrinsically parallel workloads with Batch](/azure/batch/batch-technical-overview). You can also learn how to [get started building solutions with the Batch client library for .NET](/azure/batch/batch-dotnet-get-started). Discover how to [manage Batch accounts and quotas with the Batch Management library for .NET](/azure/batch/batch-management-dotnet).

## Client library

Use the client library to run parallel workloads with Batch.

Install the [NuGet package](https://www.nuget.org/packages/Azure.Batch) directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].

#### Visual Studio Package Manager

```powershell
Install-Package Azure.Batch
```

#### .NET Core CLI

```bash
dotnet add package Azure.Batch
```

### Example

The following example uses the client SDK to create a job to run in Azure Batch.

```csharp
/*
using Microsoft.Azure.Batch.Auth;
using Microsoft.Azure.Batch;
*/
BatchSharedKeyCredentials credentials = new BatchSharedKeyCredentials(batchUrl, accountName, accountKey);
using (BatchClient batchClient = await BatchClient.OpenAsync(credentials))
{
    //set up pool specification and information along with resource files here
    JobManagerTask jobManagerTask = new JobManagerTask()
    {
        ResourceFiles = jobManagerResourceFiles,
        CommandLine = Constants.JobManagerExecutable,

        //Determines if the job should terminate when the job manager process exits.
        KillJobOnCompletion = true,
        Id = jobManagerTaskId
    };

    string jobId = Environment.GetEnvironmentVariable("USERNAME") + DateTime.UtcNow.ToString("yyyyMMdd-HHmmss");

    CloudJob unboundJob = batchClient.JobOperations.CreateJob(jobId, poolInformation);
    unboundJob.JobManagerTask = jobManagerTask;

    // now interact with the job ...
}
```

> [!div class="nextstepaction"]
> [Explore the client APIs](/dotnet/api/overview/azure/batch/client)

## Management library

Use the management library to programmatically manage Batch accounts, quotas, and application packages.

Install the [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.Management.Batch) directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].

#### Visual Studio Package Manager

```powershell
Install-Package Microsoft.Azure.Management.Batch
```

#### .NET Core CLI

```bash
dotnet add package Microsoft.Azure.Management.Batch
```

### Example

The following example retrieves the quota for the subscription, creates an account, and regenerates the primary account key.

```csharp
/*
using Microsoft.Azure.Management.Batch;
using Microsoft.Azure.Management.Batch.Models;
using Microsoft.Rest;
*/
using (BatchManagementClient batchManagementClient = new BatchManagementClient(new TokenCredentials(accessToken)))
{
    batchManagementClient.SubscriptionId = subscriptionId;

    // Get the account quota for the subscription
    BatchLocationQuota quotaResponse = await batchManagementClient.Location.GetQuotasAsync(location);
    Console.WriteLine("Your subscription can create {0} account(s) in the {1} region.", quotaResponse.AccountQuota, location);

    // Create account
    await batchManagementClient.BatchAccount.CreateAsync(ResourceGroupName, accountName, 
        new BatchAccountCreateParameters() { Location = location });

    // Regenerate primary account key
    BatchAccountKeys newKeys = await batchManagementClient.BatchAccount.RegenerateKeyAsync(
        ResourceGroupName, account.Name, AccountKeyType.Primary);
}
```

> [!div class="nextstepaction"]
> [Explore the management APIs](/dotnet/api/overview/azure/batch/management)

## Samples

* [Azure Batch Client and Management SDK for .NET Samples](https://github.com/Azure/azure-batch-samples/tree/master/CSharp)

Explore more [sample .NET code](https://azure.microsoft.com/resources/samples/?platform=dotnet) you can use in your apps.

[PackageManager]: https://docs.microsoft.com/nuget/tools/package-manager-console
[DotNetCLI]: https://docs.microsoft.com/dotnet/core/tools/dotnet-add-package
