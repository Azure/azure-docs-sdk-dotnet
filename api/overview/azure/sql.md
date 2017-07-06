---
title: Azure SQL Database APIs for .NET
description: Reference for Azure SQL Database libraries for .NET
keywords: Azure, .NET, SDK, API, SQL, database
author: camsoper
ms.author: casoper
manager: douge
ms.date: 06/20/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.service: multiple
---

# Azure SQL Database APIs for .NET

## Overview

[Azure SQL Database](https://docs.microsoft.com/azure/sql-database/sql-database-technical-overview) is a relational database service using the Microsoft SQL Server engine that supports relational, JSON, spatial, and XML data. 

To learn more about the Azure .NET APIs, see [Get started with the Azure .NET APIs](/dotnet/azure/dotnet-sdk-azure-get-started).

## Client package

Azure SQL Database uses the same client libraries as on-premises SQL Server. Use these .NET client libraries for Azure SQL Database to:

* Connect and authenticate with your database.
* Execute ad-hoc T-SQL statements.
* Execute stored procedures.

Install the [Nuget package]( https://www.nuget.org/packages/System.Data.SqlClient) directly from the Visual Studio [Package Manager console](https://docs.microsoft.com/nuget/tools/package-manager-console) or with the [.NET Core CLI](https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-add-package).

#### Visual Studio Package Manager

```powershell
Install-Package System.Data.SqlClient
```

#### .NET Core CLI

```bash
dotnet add package System.Data.SqlClient
```

### Example

```csharp
// Best practice is to scope the SqlConnection to a "using" block
using (SqlConnection conn = new SqlConnection(connectionString))
{
    // Connect to the database
    conn.Open();

    // Read rows
    SqlCommand selectCommand = new SqlCommand("SELECT * FROM CLOUD", conn);
    SqlDataReader results = selectCommand.ExecuteReader();
    
    // Enumerate over the rows
    while(results.Read())
    {
        Console.WriteLine("Column 0: {0} Column 1: {1}", results[0], results[1]);
    }
}
```

## Management package

Use the Azure SQL Database management package to:

* Create and manage Azure SQL Database server instances.
* Scale Azure SQL Database.

Install the [Nuget package](https://www.nuget.org/packages/Microsoft.Azure.Management.Sql.Fluent/) directly from the Visual Studio [Package Manager console](https://docs.microsoft.com/nuget/tools/package-manager-console) or with the [.NET Core CLI](https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-add-package).

#### Visual Studio Package Manager

```powershell
Install-Package Microsoft.Azure.Management.Sql.Fluent
``` 

#### .NET Core command line

```bash
dotnet add package Microsoft.Azure.Management.Sql.Fluent
```

### Example

```csharp
// Create the SQL server instance
ISqlServer sqlServer = azure.SqlServers.Define(sqlServerName)
    .WithRegion(Region.USEast)
    .WithNewResourceGroup(rgName)
    .WithAdministratorLogin(adminUser)
    .WithAdministratorPassword(adminPassword)
    .WithNewFirewallRule(startAddress, endAddress)
    .Create();

// Create the database
ISqlDatabase sqlDb = sqlServer.Databases.Define(sqlDbName).Create();
```

## Samples

- [ADO.NET code examples](/dotnet/framework/data/adonet/ado-net-code-examples)
- [Azure management libraries for .NET samples for SQL Database](/dotnet/azure/dotnet-sdk-azure-sql-database-samples)

View the [complete list](https://azure.microsoft.com/en-us/resources/samples/?platform=dotnet&term=sql+database) of Azure SQL Database samples.

