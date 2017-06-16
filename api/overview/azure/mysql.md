---
title: Azure Database for MySQL libraries for .NET
description: Reference documentation for the .NET client libraries for Azure Database for MySQL
keywords: Azure, .NET, SDK, API, SQL, database, MySQL 
author: camsoper
ms.author: casoper
manager: douge
ms.date: 06/20/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.service: mysql
---

# Azure Database for MySQL libraries for .NET

## Overview

The recommended client library for accessing Azure Database for MySQL is MySQL's [Connector/Net](https://dev.mysql.com/doc/connector-net/en). Use the package to connect to the database and execute SQL statements directly.  
Learn more about [Azure Database for MySQL](https://docs.microsoft.com/azure/MySQL/)

## Import the libraries

### Visual Studio 

In the [Package Manager](https://docs.microsoft.com/dotnet/azure/dotnet-sdk-azure-install?view=azure-dotnet) window, use the following cmdlet:

```powershell
Install-Package MySql.Data
``` 

### .NET Core command line

Execute the following command in your project directory:

```bash
dotnet add package MySql.Data
```

## Example

```csharp
using (MySqlConnection connection = new MySqlConnection(connectionString))
{
        // Create the Command and Parameter objects.
        MySqlCommand command = new MySqlCommand(queryString, connection);
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
- [Design a MySQL database using the Azure CLI](https://docs.microsoft.com/azure/mysql/tutorial-design-database-using-cli) 

Explore more [sample .NET code](https://azure.microsoft.com/resources/samples/?platform=.NET) you can use in your apps.