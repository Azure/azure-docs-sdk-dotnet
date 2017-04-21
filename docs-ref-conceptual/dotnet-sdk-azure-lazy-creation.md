---
title: Lazy resource initialization with the Java SDK for Azure
description: Learn about how to use lazy resource creation and Creatable<T> objects to help your code run faster. 
keywords: Azure, Java, SDK, API, Maven, Gradle, performance, async, lazy creation
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 04/16/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: multiple
ms.assetid: 1950680b-3707-4300-9165-5e80c3063046
---

# Lazy resource creation

> [!WARNING]
> TODO: Port to .NET

A challenge when creating Azure resources arises when a new resource depends on another resource that doesn't yet exist. An example is reserving a public IP address and setting up a disk when creating a new virtual machine. You don't want to verify reserving the address or the creating the disk, you just want to configure the virtual machine with those resources.

Use `Creatable<T>` objects to define Azure resources for use in your code but only create them when needed in Azure. Code written with `Creatable<T>` objects offloads resource creation in the Azure environment to the management API, boosting performance. 

Generate `Creatable<T>` objects through the resource collections' `define()` verb:

```java
Creatable<PublicIPAddress> publicIPAddressCreatable = azure.publicIPAddresses().define(publicIPAddressName)
                    .withRegion(Region.US_EAST)
                    .withNewResourceGroup(rgName);
```

The Azure resource defined by the `Creatable<T>` does not yet exist in your subscription. A `Creatable<T>` is a local representation of a resource that the management API will create when its needed. Use this `Creatable<T>` to define other Azure resources that need this resource. 

```java
Creatable<VirtualMachine> vmCreatable = azure.virtualMachines().define("creatableVM")
        .withNewPrimaryPublicIPAddress(publicIPAddressCreatable)
```

Create the resources in your Azure subscription using the  `create()` method for the resource collection. 

```java
CreatedResources<VirtualMachine> virtualMachine = azure.virtualMachines().create(vmCreatable);
```

Passing `Creatable<T>` to `create()` calls returns a `CreatedResources` object instead of a single resource object.  The `CreatedResources<T>` object lets you access all resources created by the `create()` call, not just the type from the resource collection. To access the public IP address created in Azure for the virtual machine created in the above example:

```java
PublicIPAddress pip = (PublicIPAddress) virtualMachine.createdRelatedResource(publicIPAddressCreatable.key());
```