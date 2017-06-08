---
title: Azure Database for PostgreSQL libraries for Java
description: Reference documentation for the Java client libraries for Azure Database for PostgreSQL
keywords: Azure, Java, SDK, API, SQL, database, PostGres, PostgreSQL 
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 05/17/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: postgresql
---

# Azure Database for PostgreSQL libraries for Java

## Overview

The recommended client library for accessing Azure Database for PostgreSQL is the open-source [JDBC driver](http://jdbc.postgresql.org/). Use the JDBC driver to connect to the database and execute SQL statements directly or through data access frameworks like [Spring Data JPA](http://projects.spring.io/spring-data-jpa/) and [Hibernate](http://hibernate.org/orm/).

Learn more about [Azure Database for PostgreSQL](https://docs.microsoft.com/azure/postgresql/)

## Import the libraries

Add a dependency to your Maven project's `pom.xml` file to use the libraries in your own project.

### JDBC driver 

```XML
<dependency>
    <groupId>org.postgresql</groupId>
    <artifactId>postgresql</artifactId>
    <version>42.1.1</version>
</dependency>
```   

## Example

Connect to Azure Database for PostgreSQL using JDBC and select all records in the sales table. You can get the JDBC connection string for the database from the Azure Portal.

```java
String url = String.format("jdbc:postgresql://mypostgresdb.postgres.database.azure.com:5432/mydb?user=frank@mypostgresdb&password=AbCdEfGhIjK&ssl=true");
Connection connection = null;
try {
    connection = DriverManager.getConnection(url);
    String selectSql = "SELECT * FROM SALES";
    Statement statement = connection.createStatement();
    ResultSet resultSet = statement.executeQuery(selectSql);
}
```

## Samples

| | |
|--|--|
| [Design a PostgreSQL database using the Azure CLI](https://docs.microsoft.com/azure/postgresql/tutorial-design-database-using-azure-cli) | Create an Azure Database for PostgreSQL ,configure firewall rules, and connect to the database with the psql utility.

Explore more [sample Java code](https://azure.microsoft.com/resources/samples/?platform=java) you can use in your apps.
