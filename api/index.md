---
title: Azure .NET API Reference 
description: Azure .NET API Reference 
keywords: Azure .NET, Azure .NET API Reference, Azure .NET class library
author: allclark
manager: douge
ms.date: 09/21/2016
ms.topic: managed-reference
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.assetid: 46ad4ac6-bc51-45c9-b6dd-394ed0af5424
---

# Azure .NET API reference

> This page was hand-authored, pulling information from some equivalent MSDN pages.
> The page will be generated from the source (.yml) files in the future.
> The source files need to have summary information added for namespaces.


## Microsoft.Azure.Graph.RBAC

[Microsoft.Azure.Graph.RBAC namespace](Microsoft.Azure.Graph.RBAC)

### Classes

- [ApplicationsOperationsExtensions](Microsoft.Azure.Graph.RBAC.ApplicationOperationsExtensions)
- [GraphRbacManagementClient](Microsoft.Azure.Graph.RBAC.GraphRbacManagementClient)
- [GroupsOperationsExtensions](Microsoft.Azure.Graph.RBAC.GroupsOperationsExtensions)
- [ObjectsOperationsExtensions](Microsoft.Azure.Graph.RBAC.ObjectsOperationsExtensions)
- [ServicePrincipalOperationsExtensions](Microsoft.Azure.Graph.RBAC.ServicePrincipalOperationsExtensions)
- [UserOperationsExtensions](Microsoft.Azure.Graph.RBAC.UserOperationsExtensions)

### Interfaces

- [IApplicationsOperations](Microsoft.Azure.Graph.RBAC.IApplicationsOperations)
- [IGraphRbacManagementClient](Microsoft.Azure.Graph.RBAC.IGraphRbacManagementClient)
- [IGroupsOperations](Microsoft.Azure.Graph.RBAC.)
- [IGroupOperations](Microsoft.Azure.Graph.RBAC.IGroupsOperations)
- [IObjectOperations](Microsoft.Azure.Graph.RBAC.IObjectOperations)
- [IServicePrincipalsOperations](Microsoft.Azure.Graph.RBAC.IServicePrincipalsOperations)
- [IUSersOperations](Microsoft.Azure.Graph.RBAC.IUSersOperations)

## Microsoft.Azure.Graph.RBAC.Models

[Microsoft.Azure.Graph.RBAC.Models namespace](Microsoft.Azure.Graph.RBAC.Models)

### Classes

- [AADObjet](Microsoft.Azure.Graph.RBAC.Models.AADObject)
- [ADGroup](Microsoft.Azure.Graph.RBAC.Models.ADGroup)
- [Application](Microsoft.Azure.Graph.RBAC.Models.Application)
- [ApplicationCreateParameters](Microsoft.Azure.Graph.RBAC.Models.ApplicationCreateParameters)
- [ApplicationUpdateParameters](Microsoft.Azure.Graph.RBAC.Models.ApplicationUpdateParameters)
- [CheckGroupMembershipParemeters](Microsoft.Azure.Graph.RBAC.Models.CheckGroupMembershipParameters)
- [CheckGroupMembershipResult](Microsoft.Azure.Graph.RBAC.Models.CheckGroupMembershipResult)
- [GetObjectsParameters](Microsoft.Azure.Graph.RBAC.Models.GetObjectsParameters)
- [GraphError](Microsoft.Azure.Graph.RBAC.Models.GraphError)
- [GraphErrorException](Microsoft.Azure.Graph.RBAC.Models.GraphErrorException)
- [GroupAddMemberParameters](Microsoft.Azure.Graph.RBAC.Models.GroupAddMemberParameters)
- [GroupCreateParameters](Microsoft.Azure.Graph.RBAC.Models.GroupCreateParameters)
- [GroupGetMemberGroupsParameters](Microsoft.Azure.Graph.RBAC.Models.GroupGetMemberGroupsParameters)
- [KeyCredentials](Microsoft.Azure.Graph.RBAC.Models.KeyCredentials)
- [KeyCredentialsUpdateParameters](Microsoft.Azure.Graph.RBAC.Models.KeyCredentialsUpdateParameters)
- [PasswordCredential](Microsoft.Azure.Graph.RBAC.Models.PasswordCredential)
- [PasswordCredentialUpdateParameters](Microsoft.Azure.Graph.RBAC.Models.PasswordCredential)
- [PasswordProfile](Microsoft.Azure.Graph.RBAC.Models.PasswordProfile)
- [ServicePrincipal](Microsoft.Azure.Graph.RBAC.Models.ServicePrincipal)
- [ServicePrincipalCreateParameters](Microsoft.Azure.Graph.RBAC.Models.ServicePrincipalCreateParameters)
- [User](Microsoft.Azure.Graph.RBAC.Models.User)
- [UserCreateParameters](Microsoft.Azure.Graph.RBAC.Models.UserCreateParameters)
- [UserGetMemberGroupsParameters](Microsoft.Azure.Graph.RBAC.Models.UserGetMemberGroupsParameters)
- [UserUpdateParameters](Microsoft.Azure.Graph.RBAC.Models.UserGetMemberGroupsParameters)

## Microsoft.Azure.Management

[Microsoft.Azure.Management namespace](Microsoft.Azure.Management)

### Classes

- [Azure](Microsoft.Azure.Management.Azure)
- [Azure.Authenticated](Microsoft.Azure.Management.Azure.Authenticated)
- [Azure.Configurable](Microsoft.Azure.Management.Azure.Configurable)

## Interfaces

- [Azure.IAuthenticated](Microsoft.Azure.Management.Azure.IAuthenticated)
- [Azure.IConfigurable](Microsoft.Azure.Management.Azure.IConfigurable)

## Microsoft.Azure.Management.Batch

[Microsoft.Azure.Management.Batch namespace](Microsoft.Azure.Management.Batch)

### Classes

- [AccountOperationsExtensions](Microsoft.Azure.Management.Batch.AccountOperationsExtensions)
- [ApplicationOperationsExtensions](Microsoft.Azure.Management.Batch.ApplicationOperationsExtensions)
- [BatchManagementClient](Microsoft.Azure.Management.Batch.BatchManagementClient)
- [SubscriptionOperationsExtensions](Microsoft.Azure.Management.Batch.SubscriptionOperationsExtensions)

### Interfaces

- [IAccountOperations](Microsoft.Azure.Management.Batch.IAccountOperations)
- [IApplicationOperations](Microsoft.Azure.Management.Batch.IApplicationOperations)
- [IBatchManagementClient](Microsoft.Azure.Management.Batch.IBatchManagementClient)
- [ISubscriptionOperations](Microsoft.Azure.Management.Batch.ISubscriptionOperations)

## Microsoft.Azure.Management.Batch.Models

[Microsoft.Azure.Management.Batch.Models namespace](Microsoft.Azure.Management.Batch.Models)

### Classes

- [AccountResourceInner](Microsoft.Azure.Management.Batch.Models.AccountResourceInner)
- [ActivateApplicationPackageParameters](Microsoft.Azure.Management.Batch.Models.ActivateApplicationPackageParameters)
- [AddApplicationPackageResultInner](Microsoft.Azure.Management.Batch.Models.AddApplicationPackageResultInner)
- [ActivateApplicationPackageParameters](Microsoft.Azure.Management.Batch.Models.ActivateApplicationPackageParameters)
- [AddApplicationPackageResultInner](Microsoft.Azure.Management.Batch.Models.AddApplicationPackageResultInner)
- [AddApplicationParametersInner](Microsoft.Azure.Management.Batch.Models.AddApplicationParametersInner)
- [ApplicationInner](Microsoft.Azure.Management.Batch.Models.ApplicationInner)
- [ApplicationPackage](Microsoft.Azure.Management.Batch.Models.ApplicationPackage)
- [AutoStorageBaseProperties](Microsoft.Azure.Management.Batch.Models.AutoStorageBaseProperties)
- [AutoStorageProperties](Microsoft.Azure.Management.Batch.Models.AutoStorageProperties)
- [BatchAccountCreateParametersInner](Microsoft.Azure.Management.Batch.Models.BatchAccountCreateParametersInner)
- [BatchAccountListKeyResultInner](Microsoft.Azure.Management.Batch.Models.BatchAccountListKeyResultInner)
- [BatchAccountListResultInner](Microsoft.Azure.Management.Batch.Models.BatchAccountListResultInner)
- [BatchAccountRegenerateKeyParameters](Microsoft.Azure.Management.Batch.Models.BatchAccountRegenerateKeyParameters)
- [BatchAccountRegenerateKeyResultInner](Microsoft.Azure.Management.Batch.Models.BatchAccountRegenerateKeyResultInner)
- [BatchAccountUpdateParametersInner](Microsoft.Azure.Management.Batch.Models.BatchAccountUpdateParametersInner)
- [GetApplicationPackageResultInner](Microsoft.Azure.Management.Batch.Models.GetApplicationPackageResultInner)
- [ListApplicationsResultInner](Microsoft.Azure.Management.Batch.Models.ListApplicationsResultInner)
- [Page<T>](Microsoft.Azure.Management.Batch.Models.Page`1)
- [SubscriptionQuotasGetResultInner](Microsoft.Azure.Management.Batch.Models.SubscriptionQuotasGetResultInner)
- [UpdateApplicationParametersInner](Microsoft.Azure.Management.Batch.Models.UpdateApplicationParametersInner)

## Enums

- [AccountKeyType](Microsoft.Azure.Management.Batch.Models.AccountKeyType)
- [AccountProvisioningState](Microsoft.Azure.Management.Batch.Models.AccountProvisioningState)
- [PackageState](Microsoft.Azure.Management.Batch.Models.PackageState)


## Microsoft.Azure.Management.Cdn
## Microsoft.Azure.Management.Cdn.Models
## Microsoft.Azure.Management.CognitiveServices
## Microsoft.Azure.Management.CognitiveServices.Models
## Microsoft.Azure.Management.Compute
## Microsoft.Azure.Management.Compute.Models
## Microsoft.Azure.Management.DataLake.Analytic
## Microsoft.Azure.Management.DataLake.Analytic.Models
## Microsoft.Azure.Management.DataLake.Store
## Microsoft.Azure.Management.DataLake.Store.Models
## Microsoft.Azure.Management.DevTestLabs
## Microsoft.Azure.Management.DevTestLabs.Models
## Microsoft.Azure.Management.DNS
## Microsoft.Azure.Management.DNS.Models
## Microsoft.Azure.Management.EventHub
## Microsoft.Azure.Management.EventHub.Models
## Microsoft.Azure.Management.IotHub
## Microsoft.Azure.Management.IotHub.Models
## Microsoft.Azure.Management.KeyVault
## Microsoft.Azure.Management.KeyVault.Models
## Microsoft.Azure.Management.Logic
## Microsoft.Azure.Management.Logic.Models
## Microsoft.Azure.Management.MachineLearning.CommitmentPlans
## Microsoft.Azure.Management.MachineLearning.CommitmentPlans.Models
## Microsoft.Azure.Management.MachineLearning.WebServices
## Microsoft.Azure.Management.MachineLearning.WebServices.Models
## Microsoft.Azure.Management.Media
## Microsoft.Azure.Management.Media.Models
## Microsoft.Azure.Management.Network
## Microsoft.Azure.Management.Network.Models
## Microsoft.Azure.Management.NotificationHubs
## Microsoft.Azure.Management.NotificationHubs.Models
## Microsoft.Azure.Management.PowerBIEmbedded
## Microsoft.Azure.Management.PowerBIEmbedded.Models
## Microsoft.Azure.Management.Redis
## Microsoft.Azure.Management.Redis.Models
## Microsoft.Azure.Management.ResourceManager
## Microsoft.Azure.Management.ResourceManager.Models
## Microsoft.Azure.Management.Scheduler
## Microsoft.Azure.Management.Scheduler.Models
## Microsoft.Azure.Management.ServerManagement
## Microsoft.Azure.Management.ServerManagement.Models
## Microsoft.Azure.Management.ServiceBus
## Microsoft.Azure.Management.ServiceBus.Models
## Microsoft.Azure.Management.Storage
## Microsoft.Azure.Management.Storage.Models
## Microsoft.Azure.Management.TrafficManager
## Microsoft.Azure.Management.TrafficManager.Models
## Microsoft.Azure.Management.WebSites
## Microsoft.Azure.Management.WebSites.Models
## Scheduler.Test.Helpers
## Scheduler.Test.InMemoryTests
## Scheduler.Test.ScenarioTests
