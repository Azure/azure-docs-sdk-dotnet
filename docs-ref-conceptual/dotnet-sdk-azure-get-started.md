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
- [Azure PowerShell](https://docs.microsoft.com/en-us/powershell/azure/install-azurerm-ps)

This guide uses Visual Studio.  See the [installation guide](dotnet-sdk-azure-install.md) to learn how to use Azure Management Libraries for .NET in your .NET Core applications without Visual Studio.

## Set up authentication

Your .NET application needs permissions to read and create resources in your Azure subscription in order to use the Azure Management Libraries for .NET. Create a service principal and configure your app to run with its credentials to grant this access. Service principals provide a way to create a non-interactive account associated with your identity to which you grant only the privileges your app needs to run.

First, login to Azure PowerShell:

```powershell
Login-AzureRmAccount
```

Note the information displayed about your tenant and subscription:

```text
Environment           : AzureCloud
Account               : joeuser@contoso.com
TenantId              : 43413cc1-5886-4711-9804-8cfea3d1c3ee
SubscriptionId        : 15dbcfa8-4b93-4c9a-881c-6189d39f04d4
SubscriptionName      : my-subscription
CurrentStorageAccount : 
```

[Create a service principal using PowerShell](/powershell/azure/create-azure-service-principal-azureps), like this:

```powershell
# Create the service principal (use a strong password)
New-AzureRmADServicePrincipal -DisplayName "AzureDotNetTest" -Password "password" | `
    Select DisplayName, ApplicationID
```

Make sure to note the ApplicationID:

```plaintext
DisplayName     ApplicationId
-----------     -------------
AzureDotNetTest a2ab11af-01aa-4759-8345-7803287dbd39
```

Next, create a text file named `azureauth.properties` using the service principal credentials:

```text
# sample management library properties file
subscription=15dbcfa8-4b93-4c9a-881c-6189d39f04d4
client=a2ab11af-01aa-4759-8345-7803287dbd39
key=password
tenant=43413cc1-5886-4711-9804-8cfea3d1c3ee
managementURI=https://management.core.windows.net/
baseURL=https://management.azure.com/
authURL=https://login.windows.net/
graphURL=https://graph.windows.net/
```

- subscription: use the *SubscriptionId* value from when you ran `Login-AzureRmAccount`.
- client: use the *ApplicationId* value from the output taken from a service principal output.
- key: use the *-Password* parameter you assigned when you ran `New-AzureRmADServicePrincipal` (without quotes).
- tenant: use the *TenantId* value from when you ran `Login-AzureRmAccount`.

Save this file in a secure location on your system where your code can read it. Use PowerShell to set an environment variable named `AZURE_AUTH_LOCATION` with the full path to the file, for example:

```powershell
[Environment]::SetEnvironmentVariable("AZURE_AUTH_LOCATION", "C:\src\azureauth.properties", "User")
```

## Create a new project 

Create a new console application project.  In Visual Studio, do this by clicking **File**, **New**, and then clicking **Project...**.  Under the Visual C# templates, select **Console App (.NET Core)**, name your project, and then click **OK**.

![New project dialog](media/dotnet-sdk-azure-get-started/new-project.png)

When the new console app is created, open the Package Manager Console by clicking **Tools**, **NuGet Package Manager**, and then click **Package Manager Console**.  In the console, install the latest version of the Fluent Azure Management Libraries for .NET by entering:

```powershell
Install-Package Microsoft.Azure.Management.Fluent
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

```powershell
Get-AzureRmVm -ResourceGroupName sampleResourceGroup
```

Once you've verified that the code worked, delete the resource group, which contains the VM, its NIC, the virtual network, and the public IP address.

```powershell
Remove-AzureRmResourceGroup -ResourceGroupName sampleResourceGroup
```

## Deploy a web app from a GitHub repo

Now you'll modify your code to create a deploy a new web app from an existing GitHub repository. Replace the `Main` method with the following code:

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

```powershell
Remove-AzureRmResourceGroup -ResourceGroupName sampleResourceGroup
```

## Explore sample code

TBD

## Reference and release notes

TBD

## Get help and give feedback

Post questions to the community on [Stack Overflow](http://stackoverflow.com/questions/tagged/azure-sdk-.net) and open issues against the SDK on the [project GitHub](https://github.com/Azure/azure-sdk-for-net).