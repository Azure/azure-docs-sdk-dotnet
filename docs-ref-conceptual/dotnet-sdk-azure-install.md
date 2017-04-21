---
title: Install the Azure SDK for .NET
description: Import the Azure SDK for Java into your Maven or Gradle project
keywords: Azure, Java, SDK, API, Maven, Gradle
author: rloutlaw
ms.author: routlaw
manager: douge
ms.date: 04/16/2017
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: java
ms.service: multiple
ms.assetid: 3d6961b1-5bf5-4514-84cf-100d756f41fd
---

# Set up the Azure SDK for .NET

# Using Azure Libraries for .NET

Use the Azure Libraries for .NET to manage, integrate, and consume Azure services in your .NET applications.

* [Packages for integrating Azure services and consuming data](data-packages.md)
* [Packages for managing Azure resources](management-packages.md)

## Installation

### Visual Studio

If you're using Visual Studio, use the **NuGet Package Manager Console** to import the package into your project.

1. With your Visual Studio solution open, launch the console by clicking **Tools**, followed by **NuGet Packager Manager**, and then click **Package Manager Console**.  

    ![Package Manager Console](media/dotnet-sdk-azure-install/package-manager.png)

2. In the console window, use the **Install-Package** cmdlet to download and install the NuGet package.  For example, to include the latest version of the [Azure Resource Management Library](http://www.nuget.org/packages/Microsoft.Azure.Management.ResourceManager) for .NET:

    ```powershell
    Install-Package Microsoft.Azure.Management.ResourceManager -Pre 
    ``` 
    To use a specific version, include the version number like this:

    ```powershell
    Install-Package Microsoft.Azure.Management.ResourceMananger -Version 1.4.0-preview
    ``` 

### .NET Core

If you're using .NET Core with Visual Studio Code (or any other editor), edit your csproj file to add the package as a **PackageReference** element.  This example uses a specific version of **Microsoft.Azure.Management.ResourceManager**, which is the best practice, but NuGet [floating versions](/nuget/consume-packages/package-references-in-project-files#floating-versions) are also supported.

```xml
<Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>netcoreapp1.1</TargetFramework>
  </PropertyGroup>

  <ItemGroup>
    <PackageReference Include="Microsoft.Azure.Management.ResourceManager" Version="1.4.0-preview" />
  </ItemGroup>

</Project>
```

> [!TIP]
> Previous versions of .NET Core used project.json files instead of csproj.  To learn about mapping project.json to csproj, [see this document](/dotnet/articles/core/tools/project-json-to-csproj).


## Verify your install

After configuring your build tool or IDE, create a new class source file in the location appropriate to your project tooling with the following contents:

> [!WARNING]
> TODO: Port to .NET

```java
import com.microsoft.azure.credentials.AzureTokenCredentials;
import com.microsoft.azure.management.Azure;

public class TestJavaSDK {
	
	public static void main(String[] args) {
		
	    AzureTokenCredentials credentials = null;
	    
	    try {
	    	Azure azure = Azure.configure()
	    			.authenticate(credentials)
	                .withDefaultSubscription();	
	    }
	    catch(Exception e) {
	    	System.out.println(e.getMessage());
	        e.printStackTrace();
	    }
	}
}
```

If you're using an IDE, the import of the SDK is successful if the `Azure` and `AzureTokenCredentials` imports resolve. On the command line, run the compile step for your build tool (such as `mvn compile` for Maven) and verify that the compile is successful.

## Next steps

Now that the SDK is ready to use, visit the [get started with the Azure SDK for Java] guide to see it in action.