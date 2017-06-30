---
title: Azure .NET SQL Database APIs
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

# Azure .NET SQL Database APIs

## Overview

Azure SQL Database uses the same client libraries as SQL Server.  Use the client libraries to:

* Connect and authenticate with your database.
* Execute ad-hoc T-SQL statements.
* Execute stored procedures.

Use the Azure SQL Database management libraries to:

* Create and manage Azure SQL Database server instances.
* Scale Azure SQL Database.

## Install the packages

### Visual Studio 

In the Package Manager console, execute:

```powershell
# Client library
Install-Package System.Data.SqlClient

# Management library
Install-Package Microsoft.Azure.Management.Sql.Fluent
``` 

### .NET Core command line

In your project directory, execute:

```bash
# Client library
dotnet add package System.Data.SqlClient

# Management library
dotnet add package Microsoft.Azure.Management.Sql.Fluent
```

[Get started with Azure libraries for .NET](/dotnet/azure/dotnet-sdk-azure-get-started)

## Example

```csharp
// Create the Azure management object
IAzure azure = Azure
    .Configure()
    .Authenticate(credentials)
    .WithDefaultSubscription();

// Create the SQL server and database
ISqlServer sqlServer = azure.SqlServers.Define(sqlServerName)
    .WithRegion(Region.USEast)
    .WithNewResourceGroup(rgName)
    .WithAdministratorLogin(adminUser)
    .WithAdministratorPassword(dbPassword)
    .WithNewFirewallRule("0.0.0.0", "255.255.255.255")
    .Create();

ISqlDatabase sqlDb = sqlServer.Databases.Define(sqlDbName).Create();

// Build the connection string
SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
builder.DataSource = sqlServer.FullyQualifiedDomainName;
builder.InitialCatalog = sqlDbName;
builder.UserID = adminUser + "@" + sqlServer.Name; // Format user ID as "user@server"
builder.Password = dbPassword;
builder.Encrypt = true;
builder.TrustServerCertificate = true;

using (SqlConnection conn = new SqlConnection(builder.ConnectionString))
{
    // connect to the database
    conn.Open();

    // Create a table
    SqlCommand createCommand = new SqlCommand("CREATE TABLE CLOUD (name varchar(255), code int);", conn);
    createCommand.ExecuteNonQuery();

    // Insert a row
    SqlCommand insertCommand = new SqlCommand("INSERT INTO CLOUD (name, code ) VALUES ('Azure', 1);", conn);
    insertCommand.ExecuteNonQuery();

    // Read rows
    SqlCommand selectCommand = new SqlCommand("SELECT * FROM CLOUD", conn);
    SqlDataReader results = selectCommand.ExecuteReader();
    while(results.Read())
    {
        Console.WriteLine("Name: {0} Code: {1}", results[0], results[1]);
    }
}
 
```

## Samples

- [ADO.NET code examples](/dotnet/framework/data/adonet/ado-net-code-examples)
- [Azure management libraries for .NET samples for SQL Database](/dotnet/azure/dotnet-sdk-azure-sql-database-samples)