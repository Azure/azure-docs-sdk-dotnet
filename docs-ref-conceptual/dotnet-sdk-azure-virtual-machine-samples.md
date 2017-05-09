---
title: Azure management libraries for .NET virtual machine samples
description: Get sample code for creating and updating Azure virtual machines using the Azure management libraries for .NET.
keywords: Azure, .NET, SDK, API, virtual machines
author: camsoper
ms.author: casoper
manager: douge
ms.date: 05/08/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.service: multiple
ms.assetid: 
---

# Azure management libraries for .NET samples for virtual machines

This article links to source you can use to create and configure Azure virtual machines.

[!include[Sample prerequisites](includes/sample-prereqs.md)]

## Manage virtual machines

Create, modify, start, stop, and delete virtual machines.

```cmd
git clone https://github.com/Azure-Samples/managed-disk-dotnet-create-virtual-machine-using-custom-image-from-VHD.git
```

## Create a virtual machine from a custom image

Create a custom virtual machine image and use it to create new virtual machines. 

```cmd
git clone https://github.com/Azure-Samples/managed-disk-dotnet-create-virtual-machine-using-custom-image-from-VHD.git
```

## Create a virtual machine using specialized VHD from a snapshot

Create snapshot from the virtual machine's OS and data disks, create managed disks from the snapshots, then create a virtual machine by attaching the managed disks.

```cmd
git clone https://github.com/Azure-Samples/managed-disk-dotnet-create-virtual-machine-using-specialized-disk-from-snapshot.git
```

## Create virtual machines in parallel in the same network

Create virtual machines in the same region on the same virtual network with two subnets in parallel. 

```cmd
git clone https://github.com/Azure-Samples/compute-dotnet-manage-virtual-machines-with-network-in-parallel.git
```

## Create virtual machines across regions in parallel

Create and load balance a set of virtual machines across multiple Azure regions.

```cmd
git clone https://github.com/Azure-Samples/compute-dotnet-create-virtual-machines-across-regions-in-parallel.git
```

## Manage virtual networks

Create a virtual network with subnets.

```cmd
git clone https://github.com/Azure-Samples/network-dotnet-manage-virtual-network.git
```

## Create a virtual machine scale set with a load balancer

Create a VM scale set, set up a load balancer, and get SSH connection strings to the scale set VMs.

```cmd
git clone https://github.com/Azure-Samples/compute-dotnet-manage-virtual-machine-scale-sets.git
```

[!include[More samples](includes/more-samples.md)]