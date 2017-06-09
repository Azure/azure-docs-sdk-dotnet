---
title: Azure SQL Database libraries for .NET
description: Reference for Azure SQL Database libraries for .NET
keywords: Azure, .NET, SDK, API, SQL, database
author: camsoper
ms.author: casoper
manager: douge
ms.date: 06/09/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.service: multiple
---

# Azure SQL Database libraries for .NET

## Overview

Work with data stored in  [Azure SQL Database](https://docs.microsoft.com/azure/sql-database/sql-database-technical-overview) from .NET with the data provider for SQL Server.  The provider can be used to issue SQL queries directly from your code through [ADO.NET](/dotnet/framework/data/adonet/) or through object-relational mappers like [Entity Framework](https://docs.microsoft.com/ef/).

The management libraries provide an interface to create, manage, and scale Azure SQL Database deployments from your .NET code. Set up and manage databases in [elastic pools](https://docs.microsoft.com/azure/sql-database/sql-database-elastic-pool) to share resources and configure databases across multiple regions from your code.

## Import the libraries

### Visual Studio 

In the [Package Manager](https://docs.microsoft.com/dotnet/azure/dotnet-sdk-azure-install?view=azure-dotnet) window, use the following cmdlet:

```powershell
Install-Package System.Data.SqlClient
``` 

### .NET Core command line

Execute the following command in your project directory:

```bash
dotnet add package System.Data.SqlClient
```

## Example

Create a new web app.

```csharp

using (SqlConnection connection = new SqlConnection(connectionString))
{
        // Create the Command and Parameter objects.
        SqlCommand command = new SqlCommand(queryString, connection);
        command.Parameters.AddWithValue("@widgetId", paramValue);

        // Open the connection in a try/catch block. 
        // Create and execute the DataReader, writing the result
        // set to the console window.
        try
        {
        connection.Open();
        SqlDataReader reader = command.ExecuteReader();
        while (reader.Read())
        {
                Console.WriteLine("\t{0}\t{1}\t{2}",
                reader[0], reader[1], reader[2]);
        }
        reader.Close();
        }
        catch (Exception ex)
        {
                Console.WriteLine(ex.Message);
        }
        Console.ReadLine();
}
```

## Samples

- [ADO.NET code examples](/dotnet/framework/data/adonet/ado-net-code-examples)
- [Azure management libraries for .NET samples for SQL Database](/dotnet/azure/dotnet-sdk-azure-sql-database-samples)