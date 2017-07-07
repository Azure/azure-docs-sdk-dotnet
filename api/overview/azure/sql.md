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

[Azure SQL Database](https://docs.microsoft.com/azure/sql-database/sql-database-technical-overview) is a database service using the Microsoft SQL Server engine that supports relational, JSON, spatial, and XML data. 

To learn more about the Azure .NET APIs, see [Get started with the Azure .NET APIs](/dotnet/azure/dotnet-sdk-azure-get-started).

## Client library

Use the .NET SQL client library to connect and authenticate with your database and execute ad-hoc T-SQL statements and stored procedures.

Install the [NuGet package]( https://www.nuget.org/packages/System.Data.SqlClient) directly from the Visual Studio [Package Manager console](https://docs.microsoft.com/nuget/tools/package-manager-console) or with the [.NET Core CLI](https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-add-package).

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
/* Include this 'using' directive:
using System.Data.SqlClient;
*/

// Always store connection strings securely. 
string connectionString = "your connection string here";

// Best practice is to scope the SqlConnection to a "using" block
using (SqlConnection conn = new SqlConnection(connectionString))
{
    // Connect to the database
    conn.Open();

    // Read rows
    SqlCommand selectCommand = new SqlCommand("SELECT * FROM MyTable", conn);
    SqlDataReader results = selectCommand.ExecuteReader();
    
    // Enumerate over the rows
    while(results.Read())
    {
        Console.WriteLine("Column 0: {0} Column 1: {1}", results[0], results[1]);
    }
}
```

## Management library

Use the Azure SQL Database management library to create, manage, and scale Azure SQL Database server instances.

Install the [NuGet package](https://www.nuget.org/packages/Microsoft.Azure.Management.Sql.Fluent/) directly from the Visual Studio [Package Manager console](https://docs.microsoft.com/nuget/tools/package-manager-console) or with the [.NET Core CLI](https://docs.microsoft.com/dotnet/core/tools/dotnet-add-package).

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
/* Include these 'using' directives:
using Microsoft.Azure.Management.Sql.Fluent;
using Microsoft.Azure.Management.ResourceManager.Fluent.Core;
*/

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

