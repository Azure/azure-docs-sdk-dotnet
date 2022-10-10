---
title: Azure compute libraries for .NET
description: Reference for Azure compute libraries for .NET
ms.date: 10/19/2017
ms.topic: reference
ms.service: virtual-machines
---

# Azure virtual machine libraries for .NET

## Overview

On-demand, scalable computing resources running Linux or Windows.

To get started with Azure virtual machines, see [Create a Linux virtual machine with the Azure portal](https://review.docs.microsoft.com/azure/virtual-machines/linux/quick-create-portal).

## Management APIs

Create, configure, and scale out Windows and Linux virtual machines in Azure from your code with the management API.

Install the [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.Management.Compute.Fluent) directly from the Visual Studio [Package Manager Console][PackageManager] or with the [.NET CLI][DotNetCLI].

> [!NOTE]
> Microsoft is deprecating the Azure SDK client libraries which don't adhere to the [latest Azure SDK guidelines](https://azure.github.io/azure-sdk/general_introduction.html). You'll notice the new and old library code samples on this page. We strongly recommend you start with the new library to remain supported and to take advantage of the new capabilities and critical security updates. 

#### Visual Studio Package Manager Console

# [New SDK](#tab/newsdkpsinstall)

```powershell
Install-Package Azure.Core
Install-Package Azure.ResourceManager
Install-Package Azure.ResourceManager.Resources
Install-Package Azure.ResourceManager.Compute
Install-Package Azure.ResourceManager.Network
```

# [Old SDK](#tab/oldsdkpsinstall)

```powershell
Install-Package Microsoft.Azure.Management.Fluent
Install-Package Microsoft.Azure.Management.ResourceManager.Fluent
Install-Package Microsoft.Azure.Management.Compute.Fluent
```

---

#### .NET CLI

# [New SDK](#tab/newsdkcliinstall)

```dotnetcli
dotnet add package Azure.Core
dotnet add package Azure.ResourceManager
dotnet add package Azure.ResourceManager.Resources
dotnet add package Azure.ResourceManager.Compute
dotnet add package Azure.ResourceManager.Network
```

# [Old SDK](#tab/oldsdkcliinstall)

```dotnetcli
dotnet add package Microsoft.Azure.Management.Fluent
dotnet add package Microsoft.Azure.Management.ResourceManager.Fluent
dotnet add package Microsoft.Azure.Management.Compute.Fluent
```
---

### Code Example

Create a Windows VM.

# [New SDK](#tab/newsdksample)

```csharp
/* Include these "using" directives...
using Azure;
using Azure.Core;
using Azure.Identity;
using Azure.ResourceManager;
using Azure.ResourceManager.Compute;
using Azure.ResourceManager.Compute.Models;
using Azure.ResourceManager.Network;
using Azure.ResourceManager.Network.Models;
using Azure.ResourceManager.Resources;
*/

string resourceGroupName = "testResourceGroup";
string publicIpName = "testIP";
string virtualNetworkName = "testVN";
string networkInterfaceName = "testNic";
string vmName = "testVM";
string computeName = "computeName";
string admin = "admin";
string pwd = "pwd";

var client = new ArmClient(new DefaultAzureCredential());
ResourceGroupResource resourceGroup = client.GetDefaultSubscription().GetResourceGroup(resourceGroupName);
VirtualMachineCollection vms = resourceGroup.GetVirtualMachines();
NetworkInterfaceCollection nics = resourceGroup.GetNetworkInterfaces();
VirtualNetworkCollection vns = resourceGroup.GetVirtualNetworks();
PublicIPAddressCollection publicIps = resourceGroup.GetPublicIPAddresses();

PublicIPAddressResource ipResource = publicIps.CreateOrUpdate(
    WaitUntil.Completed,
    publicIpName,
    new PublicIPAddressData()
    {
        PublicIPAddressVersion = NetworkIPVersion.IPv4,
        PublicIPAllocationMethod = NetworkIPAllocationMethod.Dynamic,
        Location = AzureLocation.WestUS
    }).Value;

VirtualNetworkResource vnetResrouce = vns.CreateOrUpdate(
    WaitUntil.Completed,
    virtualNetworkName,
    new VirtualNetworkData()
    {
        Location = AzureLocation.WestUS,
        Subnets =
        {
            new SubnetData()
            {
                Name = "testSubNet",
                AddressPrefix = "10.0.0.0/24"
            }
        },
        AddressPrefixes =
        {
            "10.0.0.0/16"
        },
    }).Value;

NetworkInterfaceResource nicResource = nics.CreateOrUpdate(
    WaitUntil.Completed,
    networkInterfaceName,
    new NetworkInterfaceData()
    {
        Location = AzureLocation.WestUS,
        IPConfigurations =
        {
            new NetworkInterfaceIPConfigurationData()
            {
                Name = "Primary",
                Primary = true,
                Subnet = new SubnetData() { Id = vnetResrouce?.Data.Subnets.First().Id },
                PrivateIPAllocationMethod = NetworkIPAllocationMethod.Dynamic,
                PublicIPAddress = new PublicIPAddressData() { Id = ipResource?.Data.Id }
            }
        }
    }).Value;

VirtualMachineResource vmResource = vms.CreateOrUpdate(
    WaitUntil.Completed,
    vmName,
    new VirtualMachineData(AzureLocation.WestUS)
    {
        HardwareProfile = new VirtualMachineHardwareProfile()
        {
            VmSize = VirtualMachineSizeType.BasicA0
        },
        OSProfile = new VirtualMachineOSProfile()
        {
            ComputerName = computeName,
            AdminUsername = admin,
            AdminPassword = pwd,
            LinuxConfiguration = new LinuxConfiguration() 
            { 
                DisablePasswordAuthentication = false, 
                ProvisionVmAgent = true 
            }
        },
        StorageProfile = new VirtualMachineStorageProfile()
        {
            OSDisk = new VirtualMachineOSDisk(DiskCreateOptionType.FromImage),
            ImageReference = new ImageReference()
            {
                Offer = "UbuntuServer",
                Publisher = "Canonical",
                Sku = "18.04-LTS",
                Version = "latest"
            }
        },
        NetworkProfile = new VirtualMachineNetworkProfile()
        {
            NetworkInterfaces =
            {
                new VirtualMachineNetworkInterfaceReference()
                {
                    Id = nicResource.Id
                }
            }
        },
    }).Value;
```

# [Old SDK](#tab/oldsdksample)

```csharp
/* Include these "using" directives...
using Microsoft.Azure.Management.Compute.Fluent;
using Microsoft.Azure.Management.Compute.Fluent.Models;
using Microsoft.Azure.Management.Fluent;
using Microsoft.Azure.Management.ResourceManager.Fluent;
using Microsoft.Azure.Management.ResourceManager.Fluent.Core;
*/

AzureCredentials cred = SdkContext.AzureCredentialsFactory.FromServicePrincipal(
    {client id}, 
    {client secret value}, 
    {tenant id}, 
    environment: AzureEnvironment.AzureGlobalCloud);
IAzure azure = Azure.Authenticate(cred).WithDefaultSubscription();
IVirtualMachine windowsVM = azure.VirtualMachines.Define("MyVirtualMachine")
    .WithRegion(Region.USEast)
    .WithNewResourceGroup("MyResourceGroup")
    .WithNewPrimaryNetwork("10.0.0.0/28")
    .WithPrimaryPrivateIPAddressDynamic()
    .WithNewPrimaryPublicIPAddress("MyIPAddressLabel")
    .WithPopularWindowsImage(KnownWindowsVirtualMachineImage.WindowsServer2012R2Datacenter)
    .WithAdminUsername("UserName")
    .WithAdminPassword("Password")
    .WithSize(VirtualMachineSizeTypes.StandardD3V2)
    .Create();
```


> [!div class="nextstepaction"]
> [Explore the management APIs](https://docs.microsoft.com/dotnet/api/overview/azure/virtualmachines/management?view=azure-dotnet)

### Samples


* [Deploy an SSH-enabled VM with a Template with .NET](https://azure.microsoft.com/resources/samples/resource-manager-dotnet-template-deployment/)

View the [complete list](https://azure.microsoft.com/resources/samples/?platform=dotnet&term=VM) of virtual machine samples.

[PackageManager]: https://docs.microsoft.com/nuget/tools/package-manager-console
[DotNetCLI]: https://docs.microsoft.com/dotnet/core/tools/dotnet-add-package
