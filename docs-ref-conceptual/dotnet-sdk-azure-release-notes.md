---
title: Azure SDK for Java release notes | Microsoft Docs
description: See what's new and watch for breaking changes in the Java SDK for Java
keywords: Azure,  Java, API, reference,  notes,  updates, deprecate
author: routlaw
manager: douge
ms.assetid: 1f128cf9-f747-4344-84e1-f9964709deb8
ms.service: Azure
ms.devlang: java
ms.topic: reference
ms.technology: Azure
ms.date: 3/06/2016
---

# Release Notes for 1.0.0-beta5

## What's new

### Feature 1

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris cursus lorem ipsum, ut gravida leo interdum eget. Nulla maximus, sem.

### Feature 2

Fusce accumsan placerat iaculis. Phasellus rutrum, mauris non sagittis tincidunt, lacus urna malesuada nunc, a accumsan nibh justo a magna.

## API changes

### `Create()` defaults to managed disks

In `VirtualMachine, VirtualMachineScaleSet` and `VirtualMachineScaleSetVM` the OS and data disks getters and withers default to managed disks. The withers and getters for storage account based (unmanaged) OS and data disks are renamed to include the term `unmanaged`.

### `Create()` creates unmanaged disks on explicit requests

Starting in 1.0.0-beta5, if you like to continue to use the storage account based (unmanaged) operating system and data disks, you may use `withUnmanagedDisks()` in the `define() ... create()` method chain. 

```java
    azure.virtualMachines().define("myLinuxVM")
       .withRegion(Region.US_EAST)
       .withNewResourceGroup(rgName)
       .withNewPrimaryNetwork("10.0.0.0/28")
       .withPrimaryPrivateIpAddressDynamic()
       .withNewPrimaryPublicIpAddress("mylinuxvmdns")
       .withPopularLinuxImage(KnownLinuxVirtualMachineImage.UBUNTU_SERVER_16_04_LTS)
       .withRootUsername("tirekicker")
       .withSsh(sshKey)
       // Unmanaged disks - uses Storage Account
       .withUnmanagedDisks()
       .withSize(VirtualMachineSizeTypes.STANDARD_D3_V2)
       .create();
```

See the [manage virtual machine with unmanaged disks](https://github.com/azure-samples/compute-java-manage-virtual-machine-with-unmanaged-disks) sample for more code examples.

## Migration 

[Migrate from Beta 4](migrate-from-beta-4.md)    
[Migrate from 0.91](migrate-from-before-1.md)

## Previous versions

[1.0.0-beta4 release notes](release-notes-1-0-0-beta4.md)   
[1.0.0-beta3 release notes](release-notes-1-0-0-beta3.md)

