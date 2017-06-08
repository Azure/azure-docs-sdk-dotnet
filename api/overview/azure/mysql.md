---
title: Azure Database for MySQL libraries for Java
description: Reference documentation for the Java client libraries for Azure Database for MySQL
keywords: Azure, Java, SDK, API, SQL, database, PostGres, MySQL 
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 05/17/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: mysql
---

# Azure Database for MySQL libraries for Java

## Overview

The recommended client library for accessing Azure Database for MySQL is the open-source [JDBC driver](https://dev.mysql.com/doc/connector-j/5.1/). Use the JDBC driver to connect to the database and execute SQL statements directly or through data access frameworks like [Spring Data JPA](http://projects.spring.io/spring-data-jpa/) and [Hibernate](http://hibernate.org/orm/).

Learn more about [Azure Database for MySQL](https://docs.microsoft.com/azure/MySQL/)

## Import the libraries

Add a dependency to your Maven project's `pom.xml` file to use the libraries in your own project.

### JDBC driver 

```XML
<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <version>5.1.42</version>
</dependency>
```   

## Example

Connect to Azure Database for MySQL using JDBC and select all records in the sales table. You can get the JDBC connection string for the database from the Azure Portal.

```java
String url = String.format("jdbc:mysql://fabrikamysql.mysql.database.azure.com:3306/fabrikamdb?verifyServerCertificate=true&useSSL=true&requireSSL=false");
Connection connection = null;
try {
    connection = DriverManager.getConnection(url, "frank@fabrikamysql", "aBcDeFgHiJkL");
    String selectSql = "SELECT * FROM SALES";
    Statement statement = connection.createStatement();
    ResultSet resultSet = statement.executeQuery(selectSql);
}
```

## Samples

| | |
|--|--|
| [Design a MySQL database using the Azure CLI](https://docs.microsoft.com/azure/mysql/tutorial-design-database-using-cli) | Create an Azure Database for MySQL ,configure firewall rules, and connect to the database with the psql utility.

Explore more [sample Java code](https://azure.microsoft.com/resources/samples/?platform=java) you can use in your apps.
