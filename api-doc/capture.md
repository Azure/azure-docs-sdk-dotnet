---
uid: Microsoft.Azure.Management.Compute.VirtualMachinesOperationsExtensions.Capture(Microsoft.Azure.Management.Compute.IVirtualMachinesOperations,System.String,System.String,Microsoft.Azure.Management.Compute.Models.VirtualMachineCaptureParameters)
summary: *content
---

Here is content that is injected by the overwrite file method, so writers can add as much as they want to the generated API documentation in Markown format.

---
uid: Microsoft.Azure.Management.Compute.VirtualMachinesOperationsExtensions.Capture(Microsoft.Azure.Management.Compute.IVirtualMachinesOperations,System.String,System.String,Microsoft.Azure.Management.Compute.Models.VirtualMachineCaptureParameters)
remarks: *content
---

The code below demonstrates how to call the Capture method using the Azure .NET SDK. 

    using Microsoft.Azure.Management.Compute;
    using Microsoft.Azure.Management.Compute.Models;
    using Microsoft.Rest;

    namespace MyAzureVmClientApp
    {
        class Program
        {
            static void Main(string[] args)
            {
                var token = "[Token Obtained from ADAL]";

                var credential = new TokenCredentials(token);

                var captureResponse = 
                    new ComputeManagementClient(credential)
                    .VirtualMachines
                        .Capture(
                            "myResourceGroup",
                            "myVmName",
                            new VirtualMachineCaptureParameters
                            {
                                DestinationContainerName = "myblobcontainer",
                                OverwriteVhds = true,
                                VhdPrefix = "backup"
                            });
            }
        }
    }

