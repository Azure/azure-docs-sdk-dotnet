---
title: Azure Management Libraries for .NET usage concepts and patterns
description: 
keywords: Azure, .NET, SDK, API, patterns, concepts, fluent, logging
author: camsoper
ms.author: casoper
manager: douge
ms.date: 04/16/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.service: multiple
ms.assetid: 
---

# Azure management library concepts

This article details several concepts that will help you understand how to effectively use the Azure Management Libraries for .NET.

## Building resources through a fluent interface

Fluent interfaces let you customize objects using method chains instead of long parameter lists.  This allows you to customize the objects as you create them. For example, the entry-point Azure object is created using a fluent interface:

```csharp
var azure = Azure
    .Configure()
    .WithLogLevel(HttpLoggingDelegatingHandler.Level.Basic)
    .Authenticate(credentials)
    .WithDefaultSubscription();
```

The `Microsoft.Azure.Management.Fluent.Azure` object shown above is the entry point for all resource creation in the fluent management libraries. Select which type of resources to work with using the resource collections in the `Azure` object. For example, for SQL Database:

```csharp
var sql = azure.SqlServers.Define(sqlServerName)
            .WithRegion(Region.USEast)
            .WithNewResourceGroup(rgName)
            .WithAdministratorLogin(administratorLogin)
            .WithAdministratorPassword(administratorPassword)
            .Create();
```

Most fluent conversations you have with the API starts with selecting the appropriate resource collection for the Azure resources you need to work with.  Intellisense in Visual Studio then guides you through the "conversation."    

## Lists and iterations

Every resource collection has a `List()` method to return every instance of that resource in your current subscription. For example, `azure.SqlServers.List()` returns all SQL servers in the subscription.

Use the `ListByResourceGroup()` method to scope the returned List to a specific [Azure resource group](https://docs.microsoft.com/azure/azure-resource-manager/resource-group-overview#resource-groups).  

Iterate over the returned collection just as you would a normal `List<T>`:

```csharp
var vmList = azure.VirtualMachines.List();
foreach(var vm in vmList)
{
    Console.WriteLine("VM Name: {0}", vm.Name);
}
```   

## Actionable verbs

> [!WARNING]
> **TODO**: Port to .NET.

Resource collection methods with verbs in their names take immediate action in Azure. These methods work synchronously and block execution in the current thread until they complete. 

| Verb   |  Sample Usage |
|--------|---------------|
| create | `azure.virtualMachines().create(listOfVMCreatables)` |
| apply  | `virtualMachineScaleSet.update().withCapacity(6).apply()` |
| delete | `azure.disks().deleteById(id)` | 
| list   | `azure.sqlServers().list()` | 
| get    | `VirtualMachine vm  = azure.virtualMachines().getByResourceGroup(group, vmName)` |

>[!NOTE]
> `define()` and `update()` are verbs but do not block unless followed by a `create()` or `apply()`.
 
Asynchronous versions of these methods exist with a `Async` suffix use [Reactive extensions](https://github.com/ReactiveX/RxJava). 

Specific resource objects have verbs that change the state of the resource in Azure. For example:

```java
VirtualMachine vmToRestart = azure.getVirtualMachines().getById(id);
vmToRestart.restart();
```
These resource collection verbs generally do not have asynchronous versions in the management API.

## Lazy resource creation

> [!WARNING]
> **TODO**: Port to .NET.

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

## Exception handling

> [!WARNING]
> **TODO**: Port to .NET.

The management API currently defines Exception classes that extend `com.microsoft.rest.RestException`. Catch exceptions generated by management API, with a `catch (RestException exception)` block after the relevant `try` statement.

## Logs and trace

Configure the amount of logging from the management API when you build the entry point `Azure` object using `withLogLevel()`. The following trace levels exist:

| Trace level | Logging enabled 
| ------------ | ---------------
| HttpLoggingDelegatingHandler.Level.None | No output
| HttpLoggingDelegatingHandler.Level.Basic | Logs the URLs to underlying REST calls, response codes and times
| HttpLoggingDelegatingHandler.Level.Body | Everything in Basic plus request and response bodies for the REST calls
| HttpLoggingDelegatingHandler.Level.Headers | Everything in Basic plus the request and response headers REST calls
| HttpLoggingDelegatingHandler.Level.BodyAndHeaders | Everything in both Body and Headers log level
