---
title: Azure SDK for Java
description: Overview of the Azure SDK for Java
keywords: Azure, Java, SDK, API
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 04/16/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: multiple
ms.assetid: 9aaf22a2-382a-4b13-a8e3-0e467d607207
---

# Azure SDK for Java

The Java SDK for Azure lets you create and manage Azure resources from your Java applications. If you're looking for documentation to create Java apps on Azure, see [Azure for Java developers](https://review.docs.microsoft.com/en-us/azure/java/index?branch=pr-en-us-9782).

The Azure SDK for Java has a [fluent](dotnet-sdk-azure-patterns.md) interface to configure resources exactly to your specifications. For example, to add a Linux VM in an existing Azure resource group:

```java
VirtualMachine linuxVM = azure.virtualMachines().define(linuxVmName)
           .withRegion(region)
           .withExistingResourceGroup(rgName)
           .withNewPrimaryNetwork("10.0.0.0/28")
           .withPrimaryPrivateIpAddressDynamic()
           .withoutPrimaryPublicIpAddress()
           .withPopularLinuxImage(KnownLinuxVirtualMachineImage.UBUNTU_SERVER_16_04_LTS)
           .withRootUsername(userName)
           .withRootPassword(password)
           .withUnmanagedStorage()
           .withSize(VirtualMachineSizeTypes.STANDARD_D3_V2)
           .create();
 ```

Review the [install instructions](java-sdk-azure-install.md) to start using the SDK immediately with your Maven or Gradle projects. Set up authentication and run sample code against your own Azure subscription in the [get started article](java-sdk-azure-get-started.md). The [patterns article](java-sdk-azure-patterns.md) article goes into the conventions the SDK uses and how to leverage them to simplify your application code. New features, breaking changes, and migration instructions are available in the [release notes](java-sdk-release-notes.md).

The following samples cover common automation tasks with the Azure SDK for Java and are formatted for copy and paste into you own apps:

- [Virtual machines](java-sdk-azure-virtual-machine-samples.md)
- [Resource groups](java-sdk-azure-resource-groups-samples.md)
- [Web apps](java-sdk-azure-web-apps-samples.md)
- [SQL Database](java-sdk-azure-sql-database-samples.md)

An up to date [reference](java-sdk-reference.md) is available for all packages and classes in the SDK.