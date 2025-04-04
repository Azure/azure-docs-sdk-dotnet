---
title: Azure Monitor Exporter client library for .NET
keywords: Azure, .net, SDK, API, Microsoft.OpenTelemetry.Exporter.AzureMonitor,
ms.date: 11/10/2020
ms.topic: reference
ms.devlang: .net
ms.service: 
---
# Azure Monitor Exporter client library for .NET - version 1.0.0-beta.1 


The [OpenTelemetry .NET](https://github.com/open-telemetry/opentelemetry-dotnet) exporters which send [telemetry data](https://docs.microsoft.com/azure/azure-monitor/app/data-model) to [Azure Monitor](https://docs.microsoft.com/azure/azure-monitor/app/app-insights-overview) following the [OpenTelemetry Specification](https://github.com/open-telemetry/opentelemetry-specification).

## Getting started

### Prerequisites

- **Azure Subscription:**  To use Azure services, including Azure Monitor Exporter for [OpenTelemetry .NET](https://github.com/open-telemetry/opentelemetry-dotnet), you'll need a subscription.  If you do not have an existing Azure account, you may sign up for a [free trial](https://azure.microsoft.com/free) or use your [Visual Studio Subscription](https://visualstudio.microsoft.com/subscriptions/) benefits when you [create an account](https://account.windowsazure.com/Home/Index).
- **Azure Application Insights Connection String:** To send telemetry data to the monitoring service you'll need connection string from Azure Application Insights. If you are not familiar with creating Azure resources, you may wish to follow the step-by-step guide for [Create an Application Insights resource](https://docs.microsoft.com/azure/azure-monitor/app/create-new-resource) and [copy the connection string](https://docs.microsoft.com/azure/azure-monitor/app/sdk-connection-string?tabs=net#finding-my-connection-string).

### Install the package

Install the Azure Monitor Exporter for OpenTelemetry .NET with NuGet:

```shell
dotnet add package Microsoft.OpenTelemetry.Exporter.AzureMonitor
```
### Authenticate the client

Exporter does not use authentication. 

## Key concepts

This exporter sends traces to the configured Azure Monitor Resource using HTTPS. IP addresses used by the Azure Monitor is documented in [IP addresses used by Application Insights and Log Analytics](https://docs.microsoft.com/azure/azure-monitor/app/ip-addresses#outgoing-ports).

## Examples

Refer to [`DemoTrace.cs`](https://github.com/Azure/azure-sdk-for-net/blob/Microsoft.OpenTelemetry.Exporter.AzureMonitor_1.0.0-beta.1/sdk/monitor/Microsoft.OpenTelemetry.Exporter.AzureMonitor/tests/Microsoft.OpenTelemetry.Exporter.AzureMonitor.Demo.Tracing/DemoTrace.cs) for a complete demo.

```csharp
using Microsoft.OpenTelemetry.Exporter.AzureMonitor;
using OpenTelemetry.Trace;

OpenTelemetry.Sdk.CreateTracerProviderBuilder()
    .AddSource("Demo.DemoClient")
    .AddAzureMonitorTraceExporter(o => {
        o.ConnectionString = "<Your Connection String>";
    })
    .Build();
```

## Troubleshooting

This exporter logs event using the .NET EventSource to emit information. The exporter logs are available to any EventListener by opting into the source named "OpenTelemetry-TraceExporter-AzureMonitor".

## Next steps

For more information on Azure SDK, please refer to [this website](https://azure.github.io/azure-sdk/)

## Contributing

See [CONTRIBUTING.md](https://github.com/Azure/azure-sdk-for-net/blob/Microsoft.OpenTelemetry.Exporter.AzureMonitor_1.0.0-beta.1/CONTRIBUTING.md) for details on contribution process.

