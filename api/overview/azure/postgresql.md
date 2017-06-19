---
title: Azure Database for PostgreSQL libraries for .NET
description: Reference documentation for the .NET client libraries for Azure Database for PostgreSQL
keywords: Azure, .NET ODBC, SDK, API, SQL, ADO.NET, database, PostGres, PostgreSQL 
author: camsoper
ms.author: casoper
manager: douge
ms.date: 06/20/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.service: postgresql
---

# Azure Database for PostgreSQL libraries for .NET

## Overview

The recommended client library for accessing Azure Database for PostgreSQL is the open-source [Npgsql ADO.NET data provider](http://www.npgsql.org/). Use the ADO.NET provider to connect to the database and execute SQL statements directly or through Entity Framework with the Npgsql's [Entity Framework 6](http://www.npgsql.org/ef6/index.html) or [Entity Framework Core](http://www.npgsql.org/efcore/index.html) providers.

Learn more about [Azure Database for PostgreSQL](https://docs.microsoft.com/azure/postgresql/).

## Import the libraries

### Visual Studio 

In the [Package Manager](https://docs.microsoft.com/dotnet/azure/dotnet-sdk-azure-install?view=azure-dotnet) window, use the following cmdlet:

```powershell
Install-Package Npgsql
``` 

### .NET Core command line

Execute the following command in your project directory:

```bash
dotnet add package Npgsql
```

## Example

```csharp
using (NpgsqlConnection connection = new NpgsqlConnection(connectionString))
{
        // Create the Command and Parameter objects.
        NpgsqlCommand command = new NpgsqlCommand(queryString, connection);
        command.Parameters.AddWithValue("@widgetId", paramValue);

        // Open the connection in a try/catch block. 
        // Create and execute the DataReader, writing the result
        // set to the console window.
        try
        {
                connection.Open();
                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                            Console.WriteLine("\t{0}\t{1}\t{2}",
                            reader[0], reader[1], reader[2]);
                    }
                }
                
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
- [Design a PostgreSQL database using the Azure CLI](https://docs.microsoft.com/azure/postgresql/tutorial-design-database-using-azure-cli) 

Explore more [sample .NET code](https://azure.microsoft.com/resources/samples/?platform=.NET) you can use in your apps.