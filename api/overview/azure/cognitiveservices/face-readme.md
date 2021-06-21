---
title: Face API 
author: PatrickFarley
ms.author: pafarley
ms.date: 06/21/2021
ms.topic: article
ms.prod: azure
ms.technology: azure
ms.devlang: csharp
ms.service: face-api
---

# Azure Face API

The Azure Face service provides AI algorithms that detect, recognize, and analyze human faces in images.

## Install the library

### Install with Visual Studio

Using Visual Studio, create a new .NET Core application.

Once you've created a new project, install the client library by right-clicking on the project solution in the **Solution Explorer** and selecting **Manage NuGet Packages**. In the package manager that opens select **Browse**, check **Include prerelease**, and search for `Microsoft.Azure.CognitiveServices.Vision.Face`. Select version `2.7.0-preview.1`, and then **Install**.

### Install with the command-line interface

In a console window (such as cmd, PowerShell, or Bash), use the `dotnet new` command to create a new console app with the name `face-quickstart`. This command creates a simple "Hello World" C# project with a single source file: *program.cs*.

```console
dotnet new console -n face-quickstart
```

Change your directory to the newly created app folder. You can build the application with:

```console
dotnet build
```

The build output should contain no warnings or errors.

```console
...
Build succeeded.
 0 Warning(s)
 0 Error(s)
...
```

Within the application directory, install the Face client library for .NET with the following command:

```console
dotnet add package Microsoft.Azure.CognitiveServices.Vision.Face --version 2.7.0-preview.1
```

## Next Steps

Go to the Face service [Overview](https://docs.microsoft.com/azure/cognitive-services/face/overview) or follow a [quickstart](https://docs.microsoft.com/azure/cognitive-services/face/quickstarts/client-libraries) to get started.
