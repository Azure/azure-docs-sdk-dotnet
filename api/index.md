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

## Microsoft.Azure.Insights

[Microsoft.Azure.Insights namespace](Microsoft.Azure.Insights.)

### Classes

- [EventCategoriesOperationsExtensions](Microsoft.Azure.Insights.EventCategoriesOperationsExtensions)
- [EventsOperationsExtensions](Microsoft.Azure.Insights.EventsOperationsExtensions)
- [InsightsClient](Microsoft.Azure.Insights.InsightsClient)
- [MetricDefinitionsOperationsExtensions](Microsoft.Azure.Insights.MetricDefinitionsOperationsExtensions)
- [MetricsOperationsExtensions](Microsoft.Azure.Insights.MetricsOperationsExtensions)
- [TenantEventsOperationsExtensions](Microsoft.Azure.Insights.TenantEventsOperationsExtensions)
- [UsageMetricsOperationsExtensions](Microsoft.Azure.Insights.UsageMetricsOperationsExtensions)

### Interfaces

- [IEventCategoriesOperations](Microsoft.Azure.Insights.IEventCategoriesOperations)
- [IEventsOperations](Microsoft.Azure.Insights.IEventsOperations)
- [IInsightsClient](Microsoft.Azure.Insights.IInsightsClient)
- [IMetricDefinitionsOperations](Microsoft.Azure.Insights.IMetricDefinitionsOperations)
- [IMetricsOperations](Microsoft.Azure.Insights.IMetricsOperations)
- [ITenantEventsOperations](Microsoft.Azure.Insights.ITenantEventsOperations)
- [IUsageMetricsOperations](Microsoft.Azure.Insights.IUsageMetricsOperations)

## Microsoft.Azure.Insights.Models

[Microsoft.Azure.Insights.Models namespace](Microsoft.Azure.Insights..Models)

### Classes

- [EventData](Microsoft.Azure.Insights.Models.EventData)
- [HttpRequestInfo](Microsoft.Azure.Insights.Models.HttpRequestInfo)
- [LocalizableString](Microsoft.Azure.Insights.Models.LocalizableString)
- [Metric](Microsoft.Azure.Insights.Models.Metric)
- [MetricAvailability](Microsoft.Azure.Insights.Models.MetricAvailability)
- [Page1<T>](Microsoft.Azure.Insights.Models.Page1`1)
- [Page<T>](Microsoft.Azure.Insights.Models.Page`1)
- [SenderAuthorization](Microsoft.Azure.Insights.Models.SenderAuthorization)
- [UsageMetric](Microsoft.Azure.Insights.Models.UsageMetric)

### Enums

- [AggregationType](Microsoft.Azure.Insights.Models.AggregationType)
- [EventChannels](Microsoft.Azure.Insights.Models.EventChannels)
- [EventLevel](Microsoft.Azure.Insights.Models.EventLevel)
- [Unit](Microsoft.Azure.Insights.Models.Unit)

## Microsoft.Azure.Management

[Microsoft.Azure.Management namespace](Microsoft.Azure.Management)

### Classes

- [Azure](Microsoft.Azure.Management.Azure)
- [Azure.Authenticated](Microsoft.Azure.Management.Azure.Authenticated)
- [Azure.Configurable](Microsoft.Azure.Management.Azure.Configurable)

### Interfaces

- [Azure.IAuthenticated](Microsoft.Azure.Management.Azure.IAuthenticated)
- [Azure.IConfigurable](Microsoft.Azure.Management.Azure.IConfigurable)

## Microsoft.Azure.Management.Authorization

[Microsoft.Azure.Management.Authorization namespace](Microsoft.Azure.Management.Authorization)

### Classes

- [AuthorizationManagementClient](Microsoft.Azure.Management.Authorization.AuthorizationManagementClient)
- [AuthorizationManagementClientExtensions](Microsoft.Azure.Management.Authorization.AuthorizationManagementClientExtensions)
- [ClassicAdministratorsOperationsExtesions](Microsoft.Azure.Management.Authorization.ClassicAdministratorsOperationsExtesions)
- [PermissionsOperationsExtensions](Microsoft.Azure.Management.Authorization.PermissionsOperationsExtensions)
- [ProverOperationsMetadataOperationsExtensions](Microsoft.Azure.Management.Authorization.ProverOperationsMetadataOperationsExtensions)
- [RoleAssignmentsOperationsExtensions](Microsoft.Azure.Management.Authorization.RoleAssignmentsOperationsExtensions)
- [RoleDefinitionsOperationsExtensions](Microsoft.Azure.Management.Authorization.RoleDefinitionsOperationsExtensions)

### Interfaces

- [IAuthorizationManagementClient](Microsoft.Azure.Management.Authorization.IAuthorizationManagementClient)
- [IClassicAdministratorsOperations](Microsoft.Azure.Management.Authorization.IClassicAdministratorsOperations)
- [IPermissionsOperations](Microsoft.Azure.Management.Authorization.IPermissionsOperations)
- [IProviderOperationsMetadataOperations](Microsoft.Azure.Management.Authorization.IProviderOperationsMetadataOperations)
- [IRoleAssignmentsOperations](Microsoft.Azure.Management.Authorization.IRoleAssignmentsOperations)
- [IRoleDefinitionsOperations](Microsoft.Azure.Management.Authorization.IRoleDefinitionsOperations)

## Microsoft.Azure.Management.Authorization.Models

[Microsoft.Azure.Management.Authorization.Models namespace](Microsoft.Azure.Management.Authorization.Models)

### Classes

- [ClassicAdministrator](Microsoft.Azure.Management.Authorization.Models.ClassicAdministrator)
- [ClassicAdministratorProperties](Microsoft.Azure.Management.Authorization.Models.ClassicAdministratorProperties)
- [Page<T>](Microsoft.Azure.Management.Authorization.Models.Page`1)
- [Permission](Microsoft.Azure.Management.Authorization.Models.Permission)
- [ProviderOperation](Microsoft.Azure.Management.Authorization.Models.ProviderOperation)
- [ProviderOperationsMetadata](Microsoft.Azure.Management.Authorization.Models.ProviderOperationsMetadata)
- [Resource](Microsoft.Azure.Management.Authorization.Models.Resource)
- [ResourceType](Microsoft.Azure.Management.Authorization.Models.ResourceType)
- [RoleAssignmentCreateParameters](Microsoft.Azure.Management.Authorization.Models.RoleAssignmentCreateParameters)
- [RoleAssignmentFilter](Microsoft.Azure.Management.Authorization.Models.RoleAssignmentFilter)
- [RoleAssignmentProperties](Microsoft.Azure.Management.Authorization.Models.RoleAssignmentProperties)
- [RoleAssignmentPropertiesWithScope](Microsoft.Azure.Management.Authorization.Models.RoleAssignmentPropertiesWithScope)
- [RoleDefinition](Microsoft.Azure.Management.Authorization.Models.RoleDefinition)
- [RoleDefinitionFilter](Microsoft.Azure.Management.Authorization.Models.RoleDefinitionFilter)
- [RoleDefinitionProperties](Microsoft.Azure.Management.Authorization.Models.RoleDefinitionProperties)
- [SubResource](Microsoft.Azure.Management.Authorization.Models.RoleDefinitionProperties)

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

### Enums

- [AccountKeyType](Microsoft.Azure.Management.Batch.Models.AccountKeyType)
- [AccountProvisioningState](Microsoft.Azure.Management.Batch.Models.AccountProvisioningState)
- [PackageState](Microsoft.Azure.Management.Batch.Models.PackageState)


## Microsoft.Azure.Management.Cdn

[Microsoft.Azure.Management.Cdn namespace](Microsoft.Azure.Management.Cdn)

### Classes

- [CdnManagementClient](Microsoft.Azure.Management.Cdn.CdnManagementClient)
- [CustomDomainsOperationsExtensions](Microsoft.Azure.Management.Cdn.CustomDomainsOperationsExtensions)
- [EndpointsOperationsExtensions](Microsoft.Azure.Management.Cdn.EndpointsOperationsExtensions)
- [NameAvailabilityOperationsExtensions](Microsoft.Azure.Management.Cdn.NameAvailabilityOperationsExtensions)
- [OperationsOperationsExtensions](Microsoft.Azure.Management.Cdn.OperationsOperationsExtensions)
- [OriginsOperationsExtensions](Microsoft.Azure.Management.Cdn.OriginsOperationsExtensions)
- [ProfilesOperationsExtensions](Microsoft.Azure.Management.Cdn.ProfilesOperationsExtensions)

### Interfaces

- [ICdnManagementClient](Microsoft.Azure.Management.Cdn.ICdnManagementClient)
- [ICustomDomainsOperations](Microsoft.Azure.Management.Cdn.ICustomDomainsOperations)
- [IEndpointsOperations](Microsoft.Azure.Management.Cdn.IEndpointsOperations)
- [INameAvailabilityOperations](Microsoft.Azure.Management.Cdn.INameAvailabilityOperations)
- [IOperationsOperations](Microsoft.Azure.Management.Cdn.IOperationsOperations)
- [IOriginsOperations](Microsoft.Azure.Management.Cdn.IOriginsOperations)
- [IProfilesOperations](Microsoft.Azure.Management.Cdn.IProfilesOperations)

## Microsoft.Azure.Management.Cdn.Models

[Microsoft.Azure.Management.Cdn.Models namespace](Microsoft.Azure.Management.Cdn.Models)

### Classes

- [CheckNameAvailabilityInput](Microsoft.Azure.Management.Cdn.Models.CheckNameAvailabilityInput)
- [CheckNameAvailabilityOutput](Microsoft.Azure.Management.Cdn.Models.CheckNameAvailabilityOutput)
- [CustomDomain](Microsoft.Azure.Management.Cdn.Models.CustomDomain)
- [CustomDomainParameters](Microsoft.Azure.Management.Cdn.Models.CustomDomainParameters)
- [DeepCreatedOrigin](Microsoft.Azure.Management.Cdn.Models.DeepCreatedOrigin)
- [EndPoint](Microsoft.Azure.Management.Cdn.Models.EndPoint)
- [EndPointCreateParameters](Microsoft.Azure.Management.Cdn.Models.EndPointCreateParameters)
- [EndpointUpdateParameters](Microsoft.Azure.Management.Cdn.Models.EndpointUpdateParameters)
- [ErrorResponse](Microsoft.Azure.Management.Cdn.Models.ErrorResponse)
- [ErrorResponseException](Microsoft.Azure.Management.Cdn.Models.ErrorResponseException)
- [LoadParameters](Microsoft.Azure.Management.Cdn.Models.LoadParameters)
- [Operation](Microsoft.Azure.Management.Cdn.Models.Operation)
- [OperationDisplay](Microsoft.Azure.Management.Cdn.Models.OperationDisplay)
- [Origin](Microsoft.Azure.Management.Cdn.Models.Origin)
- [OriginParameters](Microsoft.Azure.Management.Cdn.Models.OriginParameters)
- [Page<T>](Microsoft.Azure.Management.Cdn.Models.Page`1)
- [Profile](Microsoft.Azure.Management.Cdn.Models.Profile)
- [ProfileCreateParameters](Microsoft.Azure.Management.Cdn.Models.ProfileCreateParameters)
- [ProfileUpdateParameters](Microsoft.Azure.Management.Cdn.Models.ProfileUpdateParameters)
- [PurgeParameters](Microsoft.Azure.Management.Cdn.Models.PurgeParameters)
- [Resource](Microsoft.Azure.Management.Cdn.Models.Resource)
- [Sku](Microsoft.Azure.Management.Cdn.Models.Sku)
- [SsoUri](Microsoft.Azure.Management.Cdn.Models.SsoUri)
- [TrackedResource](Microsoft.Azure.Management.Cdn.Models.TrackedResource)
- [ValidateCustomDomainInput](Microsoft.Azure.Management.Cdn.Models.ValidateCustomDomainInput)
- [ValidateCustomDomainOutput](Microsoft.Azure.Management.Cdn.Models.ValidateCustomDomainOutput)

### Enums

- [CustomDomainResourceState](Microsoft.Azure.Management.Cdn.Models.CustomDomainResourceState)
- [EndPointResourceState](Microsoft.Azure.Management.Cdn.Models.EndPointResourceState)
- [OriginResourceState](Microsoft.Azure.Management.Cdn.Models.OriginResourceState)
- [ProfileResourceState](Microsoft.Azure.Management.Cdn.Models.ProfileResourceState)
- [ProvisioningState](Microsoft.Azure.Management.Cdn.Models.ProvisioningState)
- [QueryStringCachingBehavior](Microsoft.Azure.Management.Cdn.Models.QueryStringCachingBehavior)
- [ResourceType](Microsoft.Azure.Management.Cdn.Models.ResourceType)
- [SkuName](Microsoft.Azure.Management.Cdn.Models.SkuName)

## Microsoft.Azure.Management.CognitiveServices

[Microsoft.Azure.Management.CognitiveServices namespace](Microsoft.Azure.Management.CognitiveServices)

### Classes

- [CognitiveServicesAccountsOperationsExtensions](Microsoft.Azure.Management.CognitiveServices.CognitiveServicesAccountsOperationsExtensions)
- [CognitiveServicesManagementClient](Microsoft.Azure.Management.CognitiveServices.CognitiveServicesManagementClient)

### Interfaces

- [ICognitiveServicesAccountsOperations](Microsoft.Azure.Management.CognitiveServices.ICognitiveServicesAccountsOperations)
- [ICognitiveServicesManagementClient](Microsoft.Azure.Management.CognitiveServices.ICognitiveServicesManagementClient)

## Microsoft.Azure.Management.CognitiveServices.Models

[Microsoft.Azure.Management.CognitiveServices.Models namespace](Microsoft.Azure.Management.CognitiveServices.Models)

### Classes

- [CognitiveServicesAccount](Microsoft.Azure.Management.CognitiveServices.CognitiveServicesAccount)
- [CognitiveServicesAccountCreateParameters](Microsoft.Azure.Management.CognitiveServices.CognitiveServicesAccountCreateParameters)
- [CognitiveServicesAccountEnumerateSkusResult](Microsoft.Azure.Management.CognitiveServices.CognitiveServicesAccountEnumerateSkusResult)
- [CognitiveServicesAccountKeys](Microsoft.Azure.Management.CognitiveServices.CognitiveServicesAccountKeys)
- [CognitiveServicesAccountUpdateParameters](Microsoft.Azure.Management.CognitiveServices.CognitiveServicesAccountUpdateParameters)
- [CognitiveServicesResourceAndSku](Microsoft.Azure.Management.CognitiveServices.CognitiveServicesResourceAndSku)
- [Error](Microsoft.Azure.Management.CognitiveServices.Models.Error)
- [ErrorBody](Microsoft.Azure.Management.CognitiveServices.Models.ErrorBody)
- [ErrorException](Microsoft.Azure.Management.CognitiveServices.Models.ErrorException)
- [Page<T>](Microsoft.Azure.Management.CognitiveServices.Models.PAge`1)
- [Sku](Microsoft.Azure.Management.CognitiveServices.Models.Sku)

### Enums

- [KeyName](Microsoft.Azure.Management.CognitiveServices.Models.KeyName)
- [Kind](Microsoft.Azure.Management.CognitiveServices.Models.Kind)
- [ProvisioningState](Microsoft.Azure.Management.CognitiveServices.Models.ProvisioningState)
- [SkuName](Microsoft.Azure.Management.CognitiveServices.Models.SkuName)
- [SkuTier](Microsoft.Azure.Management.CognitiveServices.Models.SkuTier)

## Microsoft.Azure.Management.Compute

[Microsoft.Azure.Management.Compute namespace](Microsoft.Azure.Management.Compute)

### Classes

- [AvailabilitySetsOperationsExtensions](Microsoft.Azure.Management.Compute.AvailabilitySetsOperationsExtensions)
- [ComputeManagementClient](Microsoft.Azure.Management.Compute.ComputeManagementClient)
- [ContainerServiceOperationsExtensions](Microsoft.Azure.Management.Compute.ContainerServiceOperationsExtensions)
- [UsageOperationsExtensionsOperationsExtensions](Microsoft.Azure.Management.Compute.UsageOperationsExtensionsOperationsExtensions)
- [VirtualMachineExtrensionImagesOperationsExtensions](Microsoft.Azure.Management.Compute.VirtualMachineExtrensionImagesOperationsExtensions)
- [VirtualMachineExtrensionsOperationsExtensions](Microsoft.Azure.Management.Compute.VirtualMachineExtrensionsOperationsExtensions)
- [VirtualMachineImagesOperationsExtensions](Microsoft.Azure.Management.Compute.VirtualMachineImagesOperationsExtensions)
- [VirtualMachineScaleSetsOperationsExtensions](Microsoft.Azure.Management.Compute.VirtualMachineScaleSetsOperationsExtensions)
- [VirtualMachineScaleSetVMsOperationsExtensions](Microsoft.Azure.Management.Compute.VirtualMachineScaleSetVMsOperationsExtensions)
- [VirtualMachineSizesOperationsExtensions](Microsoft.Azure.Management.Compute.VirtualMachineSizesOperationsExtensions)
- [VirtualMachinesOperationsExtensions](Microsoft.Azure.Management.Compute.VirtualMachinesOperationsExtensions)

### Interfaces

- [IAvailabilitySetsOperations]](Microsoft.Azure.Management.Compute.IAvailabilitySetsOperations)
- [IComputeManagementClient](Microsoft.Azure.Management.Compute.IComputeManagementClient)
- [IContainerServiceOperations](Microsoft.Azure.Management.Compute.IContainerServiceOperations)
- [IUsageOperations](Microsoft.Azure.Management.Compute.IUsageOperations)
- [IVirtualMachineExtensionsImagesOperations](Microsoft.Azure.Management.Compute.IVirtualMachineExtensionsImagesOperations)
- [IVirtualMachineExtensionsOperations](Microsoft.Azure.Management.Compute.IVirtualMachineExtensionsOperations)
- [IVirtualMachineImagesOperations](Microsoft.Azure.Management.Compute.IVirtualMachineImagesOperations)
- [IVirtualMachineScaleSetsOperations](Microsoft.Azure.Management.Compute.IVirtualMachineScaleSetsOperations)
- [IVirtualMachineScaleSetVMsOperations](Microsoft.Azure.Management.Compute.IVirtualMachineScaleSetVMsOperations)
- [IVirtualMachineSizesOperations](Microsoft.Azure.Management.Compute.IVirtualMachineSizesOperations)
- [IVirtualMachinesOperations](Microsoft.Azure.Management.Compute.IVirtualMachinesOperations)

## Microsoft.Azure.Management.Compute.Models

[Microsoft.Azure.Management.Compute.Models namespace](Microsoft.Azure.Management.Compute.Models)

### Classes

- [AdditionalUnattendedContent](Microsoft.Azure.Management.Compute.Models.AdditionalUnattendedContent)
- [ApiEntityReference](Microsoft.Azure.Management.Compute.Models.ApiEntityReference)
- [ApiError](Microsoft.Azure.Management.Compute.Models.ApiError)
- [ApiErrorBase](Microsoft.Azure.Management.Compute.Models.ApiErrorBase)
- [AvailabilitySet](Microsoft.Azure.Management.Compute.Models.AvailabilitySet)
- [BootDiagnostics](Microsoft.Azure.Management.Compute.Models.BootDiagnostics)
- [BootDiagnosticsInstanceView](Microsoft.Azure.Management.Compute.Models.BootDiagnosticsInstanceView)
- [ComputeLongRunningOperationsProperties](Microsoft.Azure.Management.Compute.Models.ComputeLongRunningOperationsProperties)
- [ContainerService](Microsoft.Azure.Management.Compute.Models.ContainerService)
- [ContainerServiceAgentPoolProfile](Microsoft.Azure.Management.Compute.Models.ContainerServiceAgentPoolProfile)
- [ContainerServiceDiagnosticsProfile](Microsoft.Azure.Management.Compute.Models.ContainerServiceDiagnosticsProfile)
- [ContainerServiceLinuxProfile](Microsoft.Azure.Management.Compute.Models.ContainerServiceLinuxProfile)
- [ContainerServiceMasterProfile](Microsoft.Azure.Management.Compute.Models.ContainerServiceMasterProfile)
- [ContainerServiceOrchestratorProfile](Microsoft.Azure.Management.Compute.Models.ContainerServiceOrchestratorProfile)
- [ContainerServiceSshConfiguration](Microsoft.Azure.Management.Compute.Models.ContainerServiceSshConfiguration)
- [ContainerServiceVMDiagnostics](Microsoft.Azure.Management.Compute.Models.ContainerServiceVMDiagnostics)
- [ContainerServiceVMSizeTypes](Microsoft.Azure.Management.Compute.Models.ContainerServiceVMSizeTypes)
- [ContainerServiceWindowsProfile](Microsoft.Azure.Management.Compute.Models.ContainerServiceWindowsProfile)
- [DataDisk](Microsoft.Azure.Management.Compute.Models.DataDisk)
- [DataDiskImage](Microsoft.Azure.Management.Compute.Models.DataDiskImage)
- [DiagnosticsProfile](Microsoft.Azure.Management.Compute.Models.DiagnosticsProfile)
- [DiskEncryptionSettings](Microsoft.Azure.Management.Compute.Models.DiskEncryptionSettings)
- [DiskInstanceView](Microsoft.Azure.Management.Compute.Models.DiskInstanceView)
- [HardwareProfile](Microsoft.Azure.Management.Compute.Models.HardwareProfile)
- [ImageReference](Microsoft.Azure.Management.Compute.Models.ImageReference)
- [InnerError](Microsoft.Azure.Management.Compute.Models.InnerError)
- [KeyVaultKeyReference](Microsoft.Azure.Management.Compute.Models.KeyVaultKeyReference)
- [KeyVaultSecretReference](Microsoft.Azure.Management.Compute.Models.KeyVaultSecretReference)
- [LinuxConfiguration](Microsoft.Azure.Management.Compute.Models.LinuxConfiguration)
- [NetworkInterfaceReference](Microsoft.Azure.Management.Compute.Models.NetworkInterfaceReference)
- [NetworkProfile](Microsoft.Azure.Management.Compute.Models.NetworkProfile)
- [OSDisk](Microsoft.Azure.Management.Compute.Models.OSDisk)
- [OSDiskImage](Microsoft.Azure.Management.Compute.Models.OSDiskImage)
- [OSProfile](Microsoft.Azure.Management.Compute.Models.OSProfile)
- [Page1<T>](Microsoft.Azure.Management.Compute.Models.Page1`1)
- [Page<T>](Microsoft.Azure.Management.Compute.Models.Page`1)
- [Plan](Microsoft.Azure.Management.Compute.Models.Plan)
- [PurchasePlan](Microsoft.Azure.Management.Compute.Models.PurchasePlan)
- [Resource](Microsoft.Azure.Management.Compute.Models.Resource)
- [Sku](Microsoft.Azure.Management.Compute.Models.Sku)
- [SshConfiguration](Microsoft.Azure.Management.Compute.Models.SshConfiguration)
- [SshPublicKey](Microsoft.Azure.Management.Compute.Models.SshPublicKey)
- [StorageProfile](Microsoft.Azure.Management.Compute.Models.StorageProfile)
- [SubResource](Microsoft.Azure.Management.Compute.Models.SubResource)
- [UpgradePolicy](Microsoft.Azure.Management.Compute.Models.UpgradePolicy)
- [Usage](Microsoft.Azure.Management.Compute.Models.Usage)
- [VaultCertificate](Microsoft.Azure.Management.Compute.Models.VaultCertificate)
- [VaultSecretGroup](Microsoft.Azure.Management.Compute.Models.VaultSecretGroup)
- [VirtualHardDisk](Microsoft.Azure.Management.Compute.Models.)
- [VirtualMachine](Microsoft.Azure.Management.Compute.Models.VirtualMachine)
- [VirtualMachineAgentInstanceView](Microsoft.Azure.Management.Compute.Models.VirtualMachineAgentInstanceView)
- [VirtualMachineCaptureParameters](Microsoft.Azure.Management.Compute.Models.VirtualMachineCaptureParameters)
- [VirtualMachineCaptureResult](Microsoft.Azure.Management.Compute.Models.VirtualMachineCaptureResult)
- [VirtualMachineExtension](Microsoft.Azure.Management.Compute.Models.VirtualMachineExtension)
- [VirtualMachineExtensionHandlerInstanceView](Microsoft.Azure.Management.Compute.Models.VirtualMachineExtensionHandlerInstanceView)
- [VirtualMachineExtensionImage](Microsoft.Azure.Management.Compute.Models.VirtualMachineExtensionImage)
- [VirtualMachineExtensionInstanceView](Microsoft.Azure.Management.Compute.Models.VirtualMachineExtensionInstanceView)
- [VirtualMachineScaleSet](Microsoft.Azure.Management.Compute.Models.VirtualMachineScaleSet)
- [VirtualMachineScaleSetExtension](Microsoft.Azure.Management.Compute.Models.VirtualMachineScaleSetExtension)
- [VirtualMachineScaleSetExtensionProfile](Microsoft.Azure.Management.Compute.Models.VirtualMachineScaleSetExtensionProfile)
- [VirtualMachineScaleSetInstanceView](Microsoft.Azure.Management.Compute.Models.VirtualMachineScaleSetInstanceView)
- [VirtualMachineScaleSetInstanceViewStatusesSummary](Microsoft.Azure.Management.Compute.Models.VirtualMachineScaleSetInstanceViewStatusesSummary)
- [VirtualMachineScaleSetIPConfiguration](Microsoft.Azure.Management.Compute.Models.VirtualMachineScaleSetIPConfiguration)
- [VirtualMachineScaleSetNetworkConfiguration](Microsoft.Azure.Management.Compute.Models.VirtualMachineScaleSetNetworkConfiguration)
- [VirtualMachineScaleSetNetworkProfile](Microsoft.Azure.Management.Compute.Models.VirtualMachineScaleSetNetworkProfile)
- [VirtualMachineScaleSetOSDisk](Microsoft.Azure.Management.Compute.Models.VirtualMachineScaleSetOSDisk)
- [VirtualMachineScaleSetOSProfile](Microsoft.Azure.Management.Compute.Models.VirtualMachineScaleSetOSProfile)
- [VirtualMachineScaleSetSku](Microsoft.Azure.Management.Compute.Models.VirtualMachineScaleSetSku)
- [VirtualMachineScaleSetSkuCapacity](Microsoft.Azure.Management.Compute.Models.VirtualMachineScaleSetSkuCapacity)
- [VirtualMachineScaleSetStorageProfile](Microsoft.Azure.Management.Compute.Models.VirtualMachineScaleSetStorageProfile)
- [VirtualMachineScaleSetVM](Microsoft.Azure.Management.Compute.Models.VirtualMachineScaleSetVM)
- [VirtualMachineScaleSetVMExtensionsSummary](Microsoft.Azure.Management.Compute.Models.VirtualMachineScaleSetVMExtensionsSummary)
- [VirtualMachineScaleSetVMInstanceIDs](Microsoft.Azure.Management.Compute.Models.VirtualMachineScaleSetVMInstanceIDs)
- [VirtualMachineScaleSetVMInstanceRequiredIDs](Microsoft.Azure.Management.Compute.Models.VirtualMachineScaleSetVMInstanceRequiredIDs)
- [VirtualMachineScaleSetVMInstanceView](Microsoft.Azure.Management.Compute.Models.VirtualMachineScaleSetVMInstanceView)
- [VirtualMachineScaleSetVMProfile](Microsoft.Azure.Management.Compute.Models.VirtualMachineScaleSetVMProfile)
- [VirtualMachineSize](Microsoft.Azure.Management.Compute.Models.VirtualMachineSize)
- [VirtualMachineStatusCodeCount](Microsoft.Azure.Management.Compute.Models.VirtualMachineStatusCodeCount)
- [WindowsConfiguration](Microsoft.Azure.Management.Compute.Models.WindowsConfiguration)
- [WinRMConfiguration](Microsoft.Azure.Management.Compute.Models.WinRMConfiguration)
- [WinRMListener](Microsoft.Azure.Management.Compute.Models.WinRMListener)

### Enums

- [CachingTypes](Microsoft.Azure.Management.Compute.Models.CachingTypes)
- [ComponentNames](Microsoft.Azure.Management.Compute.Models.ComponentNames)
- [ContainerServiceOrchestratorTypes](Microsoft.Azure.Management.Compute.Models.ContainerServiceOrchestratorTypes)
- [ContainerServiceSshPublicKey](Microsoft.Azure.Management.Compute.Models.ContainerServiceSshPublicKey)
- [DisCreateOptionTypes](Microsoft.Azure.Management.Compute.Models.DisCreateOptionTypes)
- [InstanceViewStatus](Microsoft.Azure.Management.Compute.Models.InstanceViewStatus)
- [InstanceViewTypes](Microsoft.Azure.Management.Compute.Models.InstanceViewTypes)
- [OperatingSystemTypes](Microsoft.Azure.Management.Compute.Models.OperatingSystemTypes)
- [PassNames](Microsoft.Azure.Management.Compute.Models.PassNames)
- [ProtocolTypes](Microsoft.Azure.Management.Compute.Models.ProtocolTypes)
- [SettingNames](Microsoft.Azure.Management.Compute.Models.SettingNames)
- [StatusLevelTypes](Microsoft.Azure.Management.Compute.Models.StatusLevelTypes)
- [UsageName](Microsoft.Azure.Management.Compute.Models.UsageName)
- [VirtualMachineScaleSetSkuScaleType](Microsoft.Azure.Management.Compute.Models.VirtualMachineScaleSetSkuScaleType)
- [VirtualMachineSizeTypes](Microsoft.Azure.Management.Compute.Models.VirtualMachineSizeTypes)

## Microsoft.Azure.Management.DataLake.Analytic

[Microsoft.Azure.Management.DataLake.Analytic namespace](Microsoft.Azure.Management.DataLake.Analytic)

### Classes

- [](Microsoft.Azure.Management.DataLake.Analytic.)

### Interfaces

- [](Microsoft.Azure.Management.DataLake.Analytic.)

### Enums

- [](Microsoft.Azure.Management.DataLake.Analytic.)

## Microsoft.Azure.Management.DataLake.Analytic.Models

[Microsoft.Azure.Management.DataLake.Analytic.Models namespace](Microsoft.Azure.Management.DataLake.Analytic.Models)

### Classes

- [](Microsoft.Azure.Management.DataLake.Analytic.Models.)

### Interfaces

- [](Microsoft.Azure.Management.DataLake.Analytic.Models.)

### Enums

- [](Microsoft.Azure.Management.DataLake.Analytic.Models.)

## Microsoft.Azure.Management.DataLake.Store

[Microsoft.Azure.Management.DataLake.Store namespace](Microsoft.Azure.Management.DataLake.Store)

### Classes

- [](Microsoft.Azure.Management.Management.DataLake.Store.)

### Interfaces

- [](Microsoft.Azure.Management.Management.DataLake.Store.)

### Enums

- [](Microsoft.Azure.Management.Management.DataLake.Store.)

## Microsoft.Azure.Management.DataLake.Store.Models

[Microsoft.Azure.Management.DataLake.Store.Models namespace](Microsoft.Azure.Management.DataLake.Store.Models)

### Classes

- [](Microsoft.Azure.Management.DataLake.Store.Models.)

### Interfaces

- [](Microsoft.Azure.Management.DataLake.Store.Models.)

### Enums

- [](Microsoft.Azure.Management.DataLake.Store.Models.)

## Microsoft.Azure.Management.DevTestLabs

[Microsoft.Azure.Management.DevTestLabs namespace](Microsoft.Azure.Management.DevTestLabs)

### Classes

- [](Microsoft.Azure.Management.DevTestLabs.)

### Interfaces

- [](Microsoft.Azure.Management.DevTestLabs.)

### Enums

- [](Microsoft.Azure.Management.DevTestLabs.)

## Microsoft.Azure.Management.DevTestLabs.Models

[Microsoft.Azure.Management.DevTestLabs.Models namespace](Microsoft.Azure.Management.DevTestLabs.Models)

### Classes

- [](Microsoft.Azure.Management.DevTestLabs.Models.)

### Interfaces

- [](Microsoft.Azure.Management.DevTestLabs.Models.)

### Enums

- [](Microsoft.Azure.Management.DevTestLabs.Models.)

## Microsoft.Azure.Management.DNS

[Microsoft.Azure.Management.DNS namespace](Microsoft.Azure.Management.DNS)

### Classes

- [](Microsoft.Azure.Management.DNS.)

### Interfaces

- [](Microsoft.Azure.Management.DNS.)

### Enums

- [](Microsoft.Azure.Management.DNS.)

## Microsoft.Azure.Management.DNS.Models

[Microsoft.Azure.Management.DNS.Models namespace](Microsoft.Azure.Management.DNS.Models)

### Classes

- [](Microsoft.Azure.Management.DNS.Models.)

### Interfaces

- [](Microsoft.Azure.Management.DNS.Models.)

### Enums

- [](Microsoft.Azure.Management.DNS.Models.)

## Microsoft.Azure.Management.EventHub

[Microsoft.Azure.Management.EventHub namespace](Microsoft.Azure.Management.EventHub)

### Classes

- [](Microsoft.Azure.Management.EventHub.)

### Interfaces

- [](Microsoft.Azure.Management.EventHub.)

### Enums

- [](Microsoft.Azure.Management.EventHub.)

## Microsoft.Azure.Management.EventHub.Models

[Microsoft.Azure.Management.EventHub.Models namespace](Microsoft.Azure.Management.EventHub.Models)

### Classes

- [](Microsoft.Azure.Management.EventHub.Models.)

### Interfaces

- [](Microsoft.Azure.Management.EventHub.Models.)

### Enums

- [](Microsoft.Azure.Management.EventHub.Models.)

## Microsoft.Azure.Management.IotHub

[Microsoft.Azure.Management.IotHub namespace](Microsoft.Azure.Management.IotHub)

### Classes

- [](Microsoft.Azure.Management.IotHub.)

### Interfaces

- [](Microsoft.Azure.Management.IotHub.)

### Enums

- [](Microsoft.Azure.Management.IotHub.)

## Microsoft.Azure.Management.IotHub.Models

[Microsoft.Azure.Management.IotHub.Models namespace](Microsoft.Azure.Management.IotHub.Models)

### Classes

- [](Microsoft.Azure.Management.IotHub.Models.)

### Interfaces

- [](Microsoft.Azure.Management.IotHub.Models.)

### Enums

- [](Microsoft.Azure.Management.IotHub.Models.)

## Microsoft.Azure.Management.KeyVault

[Microsoft.Azure.Management.Management.KeyVault namespace](Microsoft.Azure.Management.Management.KeyVault)

### Classes

- [](Microsoft.Azure.Management.Management.KeyVault.)

### Interfaces

- [](Microsoft.Azure.Management.Management.KeyVault.)

### Enums

- [](Microsoft.Azure.Management.Management.KeyVault.)

## Microsoft.Azure.Management.KeyVault.Models

[Microsoft.Azure.Management.KeyVault.Models namespace](Microsoft.Azure.Management.KeyVault.Models)

### Classes

- [](Microsoft.Azure.Management.KeyVault.Models.)

### Interfaces

- [](Microsoft.Azure.Management.KeyVault.Models.)

### Enums

- [](Microsoft.Azure.Management.KeyVault.Models.)

## Microsoft.Azure.Management.Logic

[Microsoft.Azure.Management.Logic namespace](Microsoft.Azure.Management.Logic)

### Classes

- [](Microsoft.Azure.Management.Logic.)

### Interfaces

- [](Microsoft.Azure.Management.Logic.)

### Enums

- [](Microsoft.Azure.Management.Logic.)

## Microsoft.Azure.Management.Logic.Models

[Microsoft.Azure.Management.Logic.Models namespace](Microsoft.Azure.Management.Logic.Models)

### Classes

- [](Microsoft.Azure.Management.Logic.Models.)

### Interfaces

- [](Microsoft.Azure.Management.Logic.Models.)

### Enums

- [](Microsoft.Azure.Management.Logic.Models.)

## Microsoft.Azure.Management.MachineLearning.CommitmentPlans

[Microsoft.Azure.Management.MachineLearning.CommitmentPlans namespace](Microsoft.Azure.Management.MachineLearning.CommitmentPlans)

### Classes

- [](Microsoft.Azure.Management.MachineLearning.CommitmentPlans.)

### Interfaces

- [](Microsoft.Azure.Management.MachineLearning.CommitmentPlans.)

### Enums

- [](Microsoft.Azure.Management.MachineLearning.CommitmentPlans.)

## Microsoft.Azure.Management.MachineLearning.CommitmentPlans.Models

[Microsoft.Azure.Management.MachineLearning.CommitmentPlans.Models namespace](Microsoft.Azure.Management.MachineLearning.CommitmentPlans.Models)

### Classes

- [](Microsoft.Azure.Management.MachineLearning.CommitmentPlans.Models.)

### Interfaces

- [](Microsoft.Azure.Management.MachineLearning.CommitmentPlans.Models.)

### Enums

- [](Microsoft.Azure.Management.MachineLearning.CommitmentPlans.Models.)

## Microsoft.Azure.Management.MachineLearning.WebServices

[Microsoft.Azure.Management.MachineLearning.WebServices namespace](Microsoft.Azure.Management.MachineLearning.WebServices)

### Classes

- [](Microsoft.Azure.Management.MachineLearning.WebServices.)

### Interfaces

- [](Microsoft.Azure.Management.MachineLearning.WebServices.)

### Enums

- [](Microsoft.Azure.Management.MachineLearning.WebServices.)

## Microsoft.Azure.Management.MachineLearning.WebServices.Models

[Microsoft.Azure.Management.MachineLearning.WebServices.Models namespace](Microsoft.Azure.Management.MachineLearning.WebServices.Models)

### Classes

- [](Microsoft.Azure.Management.MachineLearning.WebServices.Models.)

### Interfaces

- [](Microsoft.Azure.Management.MachineLearning.WebServices.Models.)

### Enums

- [](Microsoft.Azure.Management.MachineLearning.WebServices.Models.)

## Microsoft.Azure.Management.Media

[Microsoft.Azure.Management.Media namespace](Microsoft.Azure.Management.Media)

### Classes

- [](Microsoft.Azure.Management.Media.)

### Interfaces

- [](Microsoft.Azure.Management.Media.)

### Enums

- [](Microsoft.Azure.Management.Media.)

## Microsoft.Azure.Management.Media.Models

[Microsoft.Azure.Management.Media.Models namespace](Microsoft.Azure.Management.Media.Models)

### Classes

- [](Microsoft.Azure.Management.Media.Models.)

### Interfaces

- [](Microsoft.Azure.Management.Media.Models.)

### Enums

- [](Microsoft.Azure.Management.Media.Models.)

## Microsoft.Azure.Management.Network

[Microsoft.Azure.Management.Network namespace](Microsoft.Azure.Management.Network)

### Classes

- [](Microsoft.Azure.Management.Network.)

### Interfaces

- [](Microsoft.Azure.Management.Network.)

### Enums

- [](Microsoft.Azure.Management.Network.)

## Microsoft.Azure.Management.Network.Models

[Microsoft.Azure.Management.Network.Models namespace](Microsoft.Azure.Management.Network.Models)

### Classes

- [](Microsoft.Azure.Management.Network.Models.)

### Interfaces

- [](Microsoft.Azure.Management.Network.Models.)

### Enums

- [](Microsoft.Azure.Management.Network.Models.)

## Microsoft.Azure.Management.NotificationHubs

[Microsoft.Azure.Management.NotificationHubs namespace](Microsoft.Azure.Management.NotificationHubs)

### Classes

- [](Microsoft.Azure.Management.NotificationHubs.)

### Interfaces

- [](Microsoft.Azure.Management.NotificationHubs.)

### Enums

- [](Microsoft.Azure.Management.NotificationHubs.)

## Microsoft.Azure.Management.NotificationHubs.Models

[Microsoft.Azure.Management.NotificationHubs.Models namespace](Microsoft.Azure.Management.NotificationHubs.Models)

### Classes

- [](Microsoft.Azure.Management.NotificationHubs.Models.)

### Interfaces

- [](Microsoft.Azure.Management.NotificationHubs.Models.)

### Enums

- [](Microsoft.Azure.Management.NotificationHubs.Models.)

## Microsoft.Azure.Management.PowerBIEmbedded

[Microsoft.Azure.Management.PowerBIEmbedded namespace](Microsoft.Azure.Management.PowerBIEmbedded)

### Classes

- [](Microsoft.Azure.Management.PowerBIEmbedded.)

### Interfaces

- [](Microsoft.Azure.Management.PowerBIEmbedded.)

### Enums

- [](Microsoft.Azure.Management.PowerBIEmbedded.)

## Microsoft.Azure.Management.PowerBIEmbedded.Models

[Microsoft.Azure.Management.PowerBIEmbedded.Models namespace](Microsoft.Azure.Management.PowerBIEmbedded.Models)

### Classes

- [](Microsoft.Azure.Management.PowerBIEmbedded.Models.)

### Interfaces

- [](Microsoft.Azure.Management.PowerBIEmbedded.Models.)

### Enums

- [](Microsoft.Azure.Management.PowerBIEmbedded.Models.)

## Microsoft.Azure.Management.Redis

[Microsoft.Azure.Management.Redis namespace](Microsoft.Azure.Management.Redis)

### Classes

- [](Microsoft.Azure.Management.Redis.)

### Interfaces

- [](Microsoft.Azure.Management.Redis.)

### Enums

- [](Microsoft.Azure.Management.Redis.)

## Microsoft.Azure.Management.Redis.Models

[Microsoft.Azure.Management.Redis.Models namespace](Microsoft.Azure.Management.Redis.Models)

### Classes

- [](Microsoft.Azure.Management.Redis.Models.)

### Interfaces

- [](Microsoft.Azure.Management.Redis.Models.)

### Enums

- [](Microsoft.Azure.Management.Redis.Models.)

## Microsoft.Azure.Management.ResourceManager

[Microsoft.Azure.Management.ResourceManager namespace](Microsoft.Azure.Management.ResourceManager)

### Classes

- [](Microsoft.Azure.Management.ResourceManager.)

### Interfaces

- [](Microsoft.Azure.Management.ResourceManager.)

### Enums

- [](Microsoft.Azure.Management.ResourceManager.)

## Microsoft.Azure.Management.ResourceManager.Models

[Microsoft.Azure.Management.ResourceManager.Models namespace](Microsoft.Azure.Management.ResourceManager.Models)

### Classes

- [](Microsoft.Azure.Management.ResourceManager.Models.)

### Interfaces

- [](Microsoft.Azure.Management.ResourceManager.Models.)

### Enums

- [](Microsoft.Azure.Management.ResourceManager.Models.)

## Microsoft.Azure.Management.Scheduler

[Microsoft.Azure.Management.Scheduler namespace](Microsoft.Azure.Management.Scheduler)

### Classes

- [](Microsoft.Azure.Management.Scheduler.)

### Interfaces

- [](Microsoft.Azure.Management.Scheduler.)

### Enums

- [](Microsoft.Azure.Management.Scheduler.)

## Microsoft.Azure.Management.Scheduler.Models

[Microsoft.Azure.Management.Scheduler.Models namespace](Microsoft.Azure.Management.Scheduler.Models)

### Classes

- [](Microsoft.Azure.Management.Scheduler.Models.)

### Interfaces

- [](Microsoft.Azure.Management.Scheduler.Models.)

### Enums

- [](Microsoft.Azure.Management.Scheduler.Models.)

## Microsoft.Azure.Management.ServerManagement

[Microsoft.Azure.Management.ServerManagement namespace](Microsoft.Azure.Management.ServerManagement)

### Classes

- [](Microsoft.Azure.Management.ServerManagement.)

### Interfaces

- [](Microsoft.Azure.Management.ServerManagement.)

### Enums

- [](Microsoft.Azure.Management.ServerManagement.)

## Microsoft.Azure.Management.ServerManagement.Models

[Microsoft.Azure.Management.ServerManagement.Models namespace](Microsoft.Azure.Management.ServerManagement.Models)

### Classes

- [](Microsoft.Azure.Management.ServerManagement.Models.)

### Interfaces

- [](Microsoft.Azure.Management.ServerManagement.Models.)

### Enums

- [](Microsoft.Azure.Management.ServerManagement.Models.)

## Microsoft.Azure.Management.ServiceBus

[Microsoft.Azure.Management.ServiceBus namespace](Microsoft.Azure.Management.ServiceBus)

### Classes

- [](Microsoft.Azure.Management.ServiceBus.)

### Interfaces

- [](Microsoft.Azure.Management.ServiceBus.)

### Enums

- [](Microsoft.Azure.Management.ServiceBus.)

## Microsoft.Azure.Management.ServiceBus.Models

[Microsoft.Azure.Management.ServiceBus.Models namespace](Microsoft.Azure.Management.ServiceBus.Models)

### Classes

- [](Microsoft.Azure.Management.ServiceBus.Models.)

### Interfaces

- [](Microsoft.Azure.Management.ServiceBus.Models.)

### Enums

- [](Microsoft.Azure.Management.ServiceBus.Models.)

## Microsoft.Azure.Management.Storage

[Microsoft.Azure.Management.Storage namespace](Microsoft.Azure.Management.Storage)

### Classes

- [](Microsoft.Azure.Management.Storage.)

### Interfaces

- [](Microsoft.Azure.Management.Storage.)

### Enums

- [](Microsoft.Azure.Management.Storage.)

## Microsoft.Azure.Management.Storage.Models

[Microsoft.Azure.Management.Storage.Models namespace](Microsoft.Azure.Management.Storage.Models)

### Classes

- [](Microsoft.Azure.Management.Storage.Models.)

### Interfaces

- [](Microsoft.Azure.Management.Storage.Models.)

### Enums

- [](Microsoft.Azure.Management.Storage.Models.)

## Microsoft.Azure.Management.TrafficManager

[Microsoft.Azure.Management.TrafficManager namespace](Microsoft.Azure.Management.TrafficManager)

### Classes

- [](Microsoft.Azure.Management.TrafficManager.)

### Interfaces

- [](Microsoft.Azure.Management.TrafficManager.)

### Enums

- [](Microsoft.Azure.Management.TrafficManager.)

## Microsoft.Azure.Management.TrafficManager.Models

[Microsoft.Azure.Management.TrafficManager.Models namespace](Microsoft.Azure.Management.TrafficManager.Models)

### Classes

- [](Microsoft.Azure.Management.TrafficManager.Models.)

### Interfaces

- [](Microsoft.Azure.Management.TrafficManager.Models.)

### Enums

- [](Microsoft.Azure.Management.TrafficManager.Models.)

## Microsoft.Azure.Management.WebSites

[Microsoft.Azure.Management.WebSites namespace](Microsoft.Azure.Management.WebSites)

### Classes

- [](Microsoft.Azure.Management.WebSites.)

### Interfaces

- [](Microsoft.Azure.Management.WebSites.)

### Enums

- [](Microsoft.Azure.Management.WebSites.)

## Microsoft.Azure.Management.WebSites.Models

[Microsoft.Azure.Management.WebSites.Models namespace](Microsoft.Azure.Management.WebSites.Models)

### Classes

- [](Microsoft.Azure.Management.WebSites.Models.)

### Interfaces

- [](Microsoft.Azure.Management.WebSites.Models.)

### Enums

- [](Microsoft.Azure.Management.WebSites.Models.)

## Scheduler.Test.Helpers

[Scheduler.Test.Helpers namespace](Scheduler.Test.Helpers)

### Classes

- [](Scheduler.Test.Helpers.)

### Interfaces

- [](Scheduler.Test.Helpers.)

### Enums

- [](Scheduler.Test.Helpers.)

## Scheduler.Test.InMemoryTests

[Scheduler.Test.InMemoryTests namespace](MicScheduler.Test.InMemoryTests)

### Classes

- [](Scheduler.Test.InMemoryTests.)

### Interfaces

- [](Scheduler.Test.InMemoryTests.)

### Enums

- [](Scheduler.Test.InMemoryTests.)

## Scheduler.Test.ScenarioTests

[Scheduler.Test.ScenarioTests namespace](Scheduler.Test.ScenarioTests)

### Classes

- [](Scheduler.Test.ScenarioTests.)

### Interfaces

- [](Scheduler.Test.ScenarioTests.)

### Enums

- [](Scheduler.Test.ScenarioTests.)

