---
title: Azure HDInsight .NET SDK
description: Reference for Azure HDInsight SDK
keywords: Azure, .NET, SDK, API, HDInsight
author: tyfox
ms.author: tyfox
manager: arindamc
ms.date: 9/14/2018
ms.topic: reference
ms.devlang: dotnet
ms.service: hd-insight
ms.custom: devcenter, svc-overview
---

# Azure HDInsight .NET SDK
## Overview
The HDInsight .NET SDK provides classes and methods that allow you to manage your HDInsight clusters. It includes operations to create, delete, update, list, scale, execute script actions, monitor, get properties of HDInsight clusters, and more.

## Prerequisites
* An Azure account. If you don't have one, [get a free trial](https://azure.microsoft.com/free/).
* [Visual Studio](https://visualstudio.microsoft.com/downloads/)

## SDK Installation
From your Visual Studio project, open the Package Manager Console by clicking **Tools**, **NuGet Package Manager**, and then click **Package Manager Console**.

In the Package Manager Console, execute the following commands:

```
  Install-Package Microsoft.Azure.Management.HDInsight -Version 3.1.0-preview
  Install-Package Microsoft.Azure.Management.Fluent
  Install-Package Microsoft.Azure.Management.ResourceManager.Fluent
```

## Authentication
The SDK first needs to be authenticated with your Azure subscription.  Follow the example below to create a service principal and use it to authenticate. After this is done, you will have an instance of an `HDInsightManagementClient`, which contains many methods (outlined in below sections) that can be used to perform management operations.

> [!NOTE]
> There are other ways to authenticate besides the above example that could potentially be better suited for your needs. All methods are outlined here: [Authenticate with the Azure Libraries for .NET](https://docs.microsoft.com/en-us/dotnet/azure/dotnet-sdk-azure-authenticate?view=azure-dotnet)

### Authentication Example Using a Service Principal
First, login to [Azure Cloud Shell](https://shell.azure.com/bash). Verify you are currently using the subscription in which you want the service principal created. 

```azurecli-interactive
az account show
```

Your subscription information is displayed as JSON.

```json
{
  "environmentName": "AzureCloud",
  "id": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
  "isDefault": true,
  "name": "XXXXXXX",
  "state": "Enabled",
  "tenantId": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
  "user": {
    "cloudShellID": true,
    "name": "XXX@XXX.XXX",
    "type": "user"
  }
}
```

If you're not logged into the correct subscription, select the correct one by running: 
```azurecli-interactive
az account set -s <name or ID of subscription>
```

> [!IMPORTANT]
> If you have not already registered the HDInsight Resource Provider by another method (such as by creating an HDInsight Cluster through the Azure Portal), you need to do this once before you can authenticate. This can be done from the [Azure Cloud Shell](https://shell.azure.com/bash) by running the following command:
>```azurecli-interactive
>az provider register --namespace Microsoft.HDInsight
>```

Next, create the service principal with the following command:

```azurecli-interactive
az ad sp create-for-rbac --sdk-auth
```

The service principal information is displayed as JSON.

```json
{
  "clientId": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
  "clientSecret": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
  "subscriptionId": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
  "tenantId": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX",
  "activeDirectoryEndpointUrl": "https://login.microsoftonline.com",
  "resourceManagerEndpointUrl": "https://management.azure.com/",
  "activeDirectoryGraphResourceId": "https://graph.windows.net/",
  "sqlManagementEndpointUrl": "https://management.core.windows.net:8443/",
  "galleryEndpointUrl": "https://gallery.azure.com/",
  "managementEndpointUrl": "https://management.core.windows.net/"
}
```
Copy the below snippet and fill in `TENANT_ID`, `CLIENT_ID`, `CLIENT_SECRET`, and `SUBSCRIPTION_ID` with the strings from the JSON that was returned after running the command to create the service principal.

```csharp
using Microsoft.Azure.Management.HDInsight;
using Microsoft.Azure.Management.HDInsight.Models;
using Microsoft.Azure.Management.ResourceManager.Fluent;

namespace HDI_SDK_Test
{
    class Program
    {
        static void Main(string[] args)
        {
            // Tenant ID for your Azure Subscription
            var TENANT_ID = "";
            // Your Service Principal App Client ID
            var CLIENT_ID = "";
            // Your Service Principal Client Secret
            var CLIENT_SECRET = "";
            // Azure Subscription ID
            var SUBSCRIPTION_ID = "";

            var credentials = SdkContext.AzureCredentialsFactory
                .FromServicePrincipal(
                CLIENT_ID,
                CLIENT_SECRET,
                TENANT_ID,
                AzureEnvironment.AzureGlobalCloud);

            var client = new HDInsightManagementClient(credentials);
            client.SubscriptionId = SUBSCRIPTION_ID;
        }
    }
}
```


## Cluster Management
> [!NOTE]
> This section assumes you have already authenticated and constructed an `HDInsightManagementClient` instance and store it in a variable called `client`.

### Create a Cluster
A new cluster can be created by calling `client.Clusters.Create()`. 

#### Example
This example demonstrates how to create a Spark cluster with 2 head nodes and 1 worker node.

> [!NOTE]
> You first need to create a Resource Group and Storage Account, as explained below. If you have already created these, you can skip these steps.

##### Creating a Resource Group
You can create a resource group using the [Azure Cloud Shell](https://shell.azure.com/bash) by running
```azurecli-interactive
az group create -l <Region Name (i.e. eastus)> --n <Resource Group Name>
```
##### Creating a Storage Account
You can create a storage account using the [Azure Cloud Shell](https://shell.azure.com/bash) by running:
```azurecli-interactive
az storage account create -n <Storage Account Name> -g <Existing Resource Group Name> -l <Region Name (i.e. eastus)> --sku <SKU i.e. Standard_LRS>
```
Now run the following command to get the key for your storage account (you will need this to create a cluster):
```azurecli-interactive
az storage account keys list -n <Storage Account Name>
```
---
The below .NET snippet creates a Spark cluster with 2 head nodes and 1 worker node. Fill in the blank variables as explained in the comments and feel free to change other parameters to suit your specific needs.

```csharp
// The name for the cluster you are creating
var clusterName = "";
// The name of your existing Resource Group
var resourceGroupName = "";
// Choose a username
var username = "";
// Choose a password
var password = "";
// Replace <> with the name of your storage account
var storageAccount = "<>.blob.core.windows.net";
// Storage account key you obtained above
var storageAccountKey = "";
// Choose a region
var location = "";
var container = "default";

var parameters = new ClusterCreateParametersExtended
{
    Location = location,
    Tags = new Dictionary<string, string>(),
    Properties = new ClusterCreateProperties
    {
        ClusterVersion = "3.6",
        OsType = OSType.Linux,
        ClusterDefinition = new ClusterDefinition
        {
            Kind = "Hadoop",            
            Configurations = new Dictionary<string, Dictionary<string, string>>()
            {                
                { "gateway", new Dictionary<string, string>
                    {
                        { "restAuthCredential.isEnabled", "true" },
                        { "restAuthCredential.username", username},
                        { "restAuthCredential.password", password}
                    }
                }
            }
        },
        Tier = Tier.Standard,
        ComputeProfile = new ComputeProfile
        {
            Roles = new List<Role>{
                new Role
                {
                    Name = "headnode",
                    TargetInstanceCount = 2,
                    HardwareProfile = new HardwareProfile
                    {
                        VmSize = "Large"
                    },
                    OsProfile = new OsProfile
                    {
                        LinuxOperatingSystemProfile = new LinuxOperatingSystemProfile
                        {
                            Username = username,
                            Password = password
                        }
                    }
                },
                new Role
                {
                    Name = "workernode",
                    TargetInstanceCount = 1,
                    HardwareProfile = new HardwareProfile
                    {
                        VmSize = "Large"
                    },
                    OsProfile = new OsProfile
                    {
                        LinuxOperatingSystemProfile = new LinuxOperatingSystemProfile
                        {
                            Username = username,
                            Password = password
                        }
                    }
                },
            }
        },
        StorageProfile = new StorageProfile
        {
            Storageaccounts = new[]
            {
                new StorageAccount
                {
                    Name = storageAccount,
                    Key = storageAccountKey,
                    Container = container,
                    IsDefault = true
                }
            }
        }
    }
};
client.Clusters.Create(
    resourceGroupName,
    clusterName,
    parameters
);
```
### List Clusters

#### List Clusters Under The Subscription
```csharp
client.Clusters.List();
```
#### List Clusters By Resource Group
```csharp
client.Clusters.ListByResourceGroup("<Resource Group Name>");
```
> [!NOTE]
> Both `List()` and `ListByResourceGroup()` return an `IPage<Cluster>` object. To get the next page, you can call `client.Clusters.ListNext("Next Page Link")`. This can be repeated until `NextPageLink` is `null`, as shown in the example below.

#### Example
The following example prints the properties of all clusters for the current subscription:

```csharp
var clustersPaged = client.Clusters.List();
while (true)
{
  foreach (var cluster in clustersPaged)
  {
    Debug.WriteLine(cluster.Name);
  
}  if (clustersPaged.NextPageLink == null)
  {
    break;
  }
  clustersPaged = client.Clusters.ListNext(clustersPaged.NextPageLink);
}
```

### Get Cluster Details
To get properties for a given cluster:

```csharp
client.Clusters.Get("<Resource Group Name>", "<Cluster Name>");
```

### Delete a Cluster
To delete a cluster:

```csharp
client.Clusters.Delete("<Resource Group Name>", "<Cluster Name>");
```

### Update Cluster Tags
You can update the tags of a given cluster like so:

```csharp
client.Clusters.Update("<Resource Group Name>", "<Cluster Name>", new ClusterPatchParameters(<Dictionary of Tags>));
```
#### Example

```csharp
client.Clusters.Update("<Resource Group Name>", "<Cluster Name>", new ClusterPatchParameters(new Dictionary<string, string> { { "tag1Name", "tag1Value" }, { "tag2Name", "tag2Value" } }));
```

### Scale Cluster
You can scale a given cluster's number of worker nodes by specifying a new size like so:

```csharp
client.Clusters.Resize("<Resource Group Name>", "<Cluster Name>", <Num of Worker Nodes (int)>)
```

### Execute Script Actions
You can execute script actions on a given cluster like so:

```csharp
var scriptAction1 = new RuntimeScriptAction("<Script Name>", "<URL To Script>", <List<string> of roles>); //valid roles are "headnode", "workernode", "zookeepernode", and "edgenode"

client.Clusters.ExecuteScriptActions("<Resource Group Name>", "<Cluster Name>", new List<RuntimeScriptAction> { scriptAction1 }, <persistOnSuccess (bool)>); //add more RuntimeScriptActions to the list to execute multiple scripts
```

> [!NOTE]
> More information on how to use script actions can be found here: [Customize Linux-based HDInsight clusters using script actions](https://docs.microsoft.com/en-us/azure/hdinsight/hdinsight-hadoop-customize-cluster-linux)

## Cluster Monitoring
The HDInsight Management SDK can also be used to manage monitoring on your clusters via the Operations Management Suite (OMS).

### Enable OMS Monitoring

> [!NOTE]
> To enable OMS Monitoring, you must have an existing Log Analytics workspace. If you have not already created one, you can learn how to do that here: [Create a Log Analytics workspace in the Azure portal](https://docs.microsoft.com/en-us/azure/log-analytics/log-analytics-quick-create-workspace).

To enable OMS Monitoring on your cluster:

```csharp
client.Extension.EnableMonitoring("<Resource Group Name", "Cluster Name", new ClusterMonitoringRequest(workspaceId: "<Workspace Id>"));
```

### View Status Of OMS Monitoring
To get the status of OMS on your cluster:

```csharp
client.Extension.GetMonitoringStatus("<Resource Group Name", "Cluster Name");
```

### Disable OMS Monitoring
To disable OMS on your cluster:

```csharp
client.Extension.DisableMonitoring("<Resource Group Name>", "<Cluster Name>");
```