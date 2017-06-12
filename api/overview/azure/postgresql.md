---
title: Azure Database for PostgreSQL libraries for .NET
description: Reference documentation for the .NET client libraries for Azure Database for PostgreSQL
keywords: Azure, .NET ODBC, SDK, API, SQL, ADO.NET, database, PostGres, PostgreSQL 
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 05/17/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: dotnet
ms.service: postgresql
---

# Azure Database for PostgreSQL libraries for .NET

## Overview

The recommended client library for accessing Azure Database for PostgreSQL is the open-source [Npgsql ADO.NET data provider](http://www.npgsql.org/). Use the ADO.NET provider to connect to the database and execute SQL statements directly or through Entity Framework with the Npgsql's [Entity Framework 6](http://www.npgsql.org/ef6/index.html) or [Entity Framework Core](http://www.npgsql.org/efcore/index.html) providers.

Learn more about [Azure Database for PostgreSQL](https://docs.microsoft.com/azure/postgresql/)

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

## Samples

| | |
|--|--|
| [Design a PostgreSQL database using the Azure CLI](https://docs.microsoft.com/azure/postgresql/tutorial-design-database-using-azure-cli) | Create an Azure Database for PostgreSQL ,configure firewall rules, and connect to the database with the psql utility.