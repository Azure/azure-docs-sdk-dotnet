---
title: Get started with Azure Management Libraries for .NET
description: Get started with basic use of the Azure Management Libraries for .NET with your own Azure subscription.
keywords: Azure, .NET, SDK, API ,authenticate, get-started
author: camsoper
ms.author: casoper
manager: douge
ms.date: 04/16/2017
ms.topic: get-started-article
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.service: multiple
ms.assetid: 
---

# Get started with the Azure Management Libraries for .NET

## Prerequisites

- An Azure account. If you don't have one , [get a free trial](https://azure.microsoft.com/free/)
- [Azure CLI 2.0](https://docs.microsoft.com/en-us/cli/azure/install-az-cli2)

This guide uses Visual Studio.  See the [installation guide](dotnet-sdk-azure-install.md) to learn how to use Azure Management Libraries for .NET in your .NET Core applications without Visual Studio.

## Set up authentication

Your .NET application needs permissions to read and create resources in your Azure subscription in order to use the Azure Management Libraries for .NET. Create a service principal and configure your app to run with its credentials to grant this access. Service principals provide a way to create a non-interactive account associated with your identity to which you grant only the privileges your app needs to run.

[Create a service principal using the Azure CLI 2.0](/cli/azure/create-an-azure-service-principal-azure-cli#create-a-service-principal-for-your-application), like this:

```azurecli
az ad sp create-for-rbac --name AzureDotNetTest --password "password"
```

Make sure to capture the output seen below from the tool:

```json
{
  "appId": "8dc524be-7611-4996-81eb-279155696a54",
  "displayName": "AzureDotNetTest",
  "name": "http://AzureDotNetTest",
  "password": "password",
  "tenant": "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
}
```

Next, create a text file named `azureauth.properties` using the service principal credentials:

```text
# sample management library properties file
subscription=########-####-####-####-############
client=########-####-####-####-############
key=XXXXXXXXXXXXXXXX
tenant=########-####-####-####-############
managementURI=https://management.core.windows.net/
baseURL=https://management.azure.com/
authURL=https://login.windows.net/
graphURL=https://graph.windows.net/
```

- subscription: use the *id* value from `az account show` in the Azure CLI 2.0.
- client: use the *appId* value from the output taken from a service principal output.
- key: use the *password* value from the service principal output .
- tenant: use the *tenant* value from the service principal output.

Save this file in a secure location on your system where your code can read it. Set an environment variable named `AZURE_AUTH_LOCATION` with the full path to the file, for example:

![System environment variable dialog](media/dotnet-sdk-azure-get-started/environment-var.png)

## Create a new project 

Create a new console application project.  In Visual Studio, do this by clicking **File**, **New**, and then clicking **Project...**.  Under the Visual C# templates, select **Console App (.NET Core)**, name your project, and then click **OK**.

![New project dialog](media/dotnet-sdk-azure-get-started/new-project.png)

When the new console app is created, open the Package Manager Console by clicking **Tools**, **NuGet Package Manager**, and then click **Package Manager Console**.  In the console, install the latest version of the Fluent Azure Management Libraries for .NET by entering:

```powershell
Install-Package Microsoft.Azure.Management.Fluent -pre
```

## Create a virtual machine

Edit your application's `Program.cs` file.  Replace the `using` declarations at the top with the following:

```csharp
using System;
using Microsoft.Azure.Management.Compute.Fluent;
using Microsoft.Azure.Management.Compute.Fluent.Models;
using Microsoft.Azure.Management.Fluent;
using Microsoft.Azure.Management.ResourceManager.Fluent;
using Microsoft.Azure.Management.ResourceManager.Fluent.Core;
```

Replace the `Main` method with the following.  Be sure to provide an actual `username` and `password` for the virtual machine.

```csharp
static void Main(string[] args)
{
    // Set some variables...
    string username = "MY_USERNAME";
    string password = "MY_PASSWORD";
    string rgName = "sampleResourceGroup";
    string windowsVmName = "sampleWindowsVM";
    string publicIpDnsLabel = "samplePublicIP";

    // Authenticate
    var credentials = SdkContext.AzureCredentialsFactory
        .FromFile(Environment.GetEnvironmentVariable("AZURE_AUTH_LOCATION"));
    var azure = Azure
        .Configure()
        .WithLogLevel(HttpLoggingDelegatingHandler.Level.Basic)
        .Authenticate(credentials)
        .WithDefaultSubscription();

    // Create the VM
    Console.WriteLine("Creating VM...");
    var windowsVM = azure.VirtualMachines.Define(windowsVmName)
        .WithRegion(Region.USEast)
        .WithNewResourceGroup(rgName)
        .WithNewPrimaryNetwork("10.0.0.0/28")
        .WithPrimaryPrivateIPAddressDynamic()
        .WithNewPrimaryPublicIPAddress(publicIpDnsLabel)
        .WithPopularWindowsImage(KnownWindowsVirtualMachineImage.WindowsServer2012R2Datacenter)
        .WithAdminUsername(username)
        .WithAdminPassword(password)
        .WithSize(VirtualMachineSizeTypes.StandardD3V2)
        .Create();

    // Wait for the user
    Console.WriteLine("Press enter to continue...");
    Console.ReadLine();
}
```

Press **F5** to run the sample.

After several minutes, the program will finish, prompting you to press enter. After pressing enter, verify the virtual machine in your subscription with the Azure CLI 2.0:

```azurecli
az vm list --resource-group sampleResourceGroup
```

Once you've verified that the code worked, delete the resource group, which contains the VM, its NIC, the virtual network, and the public IP address.

```azurecli
az group delete --name sampleResourceGroup
```

## Deploy a web app from a GitHub repo

Now you'll modify your code to create a deploy a new web app from an existing GitHub repository. Replace the `Main` with the following code:

```csharp
static void Main(string[] args)
{
    // Set some variables...
    string rgName = "sampleResourceGroup";

    // The following generates a random web app name. You can
    // use your own, but ensure it is unique. Test uniqueness by browsing to:
    // http://<appName>.azurewebsites.net
    string appName = SdkContext.RandomResourceName("WebApp", 20);

    // Authenticate
    var credentials = SdkContext.AzureCredentialsFactory
        .FromFile(Environment.GetEnvironmentVariable("AZURE_AUTH_LOCATION"));
    var azure = Azure
        .Configure()
        .WithLogLevel(HttpLoggingDelegatingHandler.Level.Basic)
        .Authenticate(credentials)
        .WithDefaultSubscription();

    // Create the web app
    Console.WriteLine("Creating Web App...");
    var app = azure.WebApps.Define(appName)
        .WithRegion(Region.USEast)
        .WithNewResourceGroup(rgName)
        .WithNewFreeAppServicePlan()
        .DefineSourceControl()
        .WithPublicGitRepository("https://github.com/Azure-Samples/app-service-web-dotnet-get-started")
        .WithBranch("master")
        .Attach()
        .Create();

    // Wait for the user
    Console.WriteLine("Press enter to continue...");
    Console.ReadLine();

}
```

Run the code as before by pressing **F5**.

> [!IMPORTANT]
> Be sure to note the name of the web application in the console output.  You'll need it to verify the deployment.

This code will deploy a .NET app directly from a public GitHub repo into Azure App Service. Verify the deployment by opening a browser and navigating to `http://<appName>.azurewebsites.net`, where `<appName>` is the name of the web app.

After you've verified the deployment, cleanup your resource group as before.

```azurecli
az group delete --name sampleResourceGroup
```

## Explore sample code

TBD

## Reference and release notes

TBD

## Get help and give feedback

Post questions to the community on [Stack Overflow](http://stackoverflow.com/questions/tagged/azure-sdk-.net) and open issues against the SDK on the [project GitHub](https://github.com/Azure/azure-sdk-for-net).