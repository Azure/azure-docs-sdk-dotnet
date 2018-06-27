---
title: Azure Recovery Services and Backup libraries for .NET
description: Reference for Azure Recovery Services and Backup libraries for .NET
keywords: Azure, .NET, SDK, API, Recovery Services, Backup
author: camsoper
ms.author: casoper
manager: wpickett
ms.date: 10/19/2017
ms.topic: reference
ms.devlang: dotnet
ms.service: recovery-services
ms.custom: devcenter, svc-overview
---

# Azure Recovery Services and Backup libraries for .NET

## Overview

Azure Recovery Services is a suite of services for data recovery, including [Azure Backup](/azure/backup/) and [Azure Site Recovery](/azure/site-recovery/).

## Management library

Install the [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.Management.RecoveryServices) directly from the Visual Studio [Package Manager console][PackageManager] or with the [.NET Core CLI][DotNetCLI].

#### Visual Studio Package Manager

```powershell
Install-Package Microsoft.Azure.Management.RecoveryServices
Install-Package Microsoft.Azure.Management.RecoveryServices.Backup
```

#### .NET Core CLI

```bash
dotnet add package Microsoft.Azure.Management.RecoveryServices
dotnet add package Microsoft.Azure.Management.RecoveryServices.Backup
```

> [!div class="nextstepaction"]
> [Explore the management APIs](/dotnet/api/overview/azure/recoveryservices/management)


## Code Example

The following code example uses the management library to trigger a backup.

```csharp
RecoveryServicesBackupManagementClient client = new RecoveryServicesBackupManagementClient(credentials);
TriggerBackupRequest triggerBackupRequest = new TriggerBackupRequest();
BaseRecoveryServicesJobResponse resp =
    await client.Backups.TriggerBackupAsync(resourceGroupName, resourceName, null,
        fabricName, containerName, protectedItemName, triggerBackupRequest);
```

[PackageManager]: https://docs.microsoft.com/nuget/tools/package-manager-console
[DotNetCLI]: https://docs.microsoft.com/dotnet/core/tools/dotnet-add-package
