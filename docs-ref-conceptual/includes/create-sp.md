Your .NET application needs permissions to read and create resources in your Azure subscription in order to use the Azure Management Libraries for .NET. Create a service principal and configure your app to run with its credentials to grant this access. Service principals provide a way to create a non-interactive account associated with your identity to which you grant only the privileges your app needs to run.

First, login to Azure PowerShell:

```powershell
Login-AzureRmAccount
```

Note the information displayed about your tenant and subscription:

```plaintext
Environment           : AzureCloud
Account               : jane@contoso.com
TenantId              : 43413cc1-5886-4711-9804-8cfea3d1c3ee
SubscriptionId        : 15dbcfa8-4b93-4c9a-881c-6189d39f04d4
SubscriptionName      : my-subscription
CurrentStorageAccount : 
```

[Create a service principal using PowerShell](/powershell/azure/create-azure-service-principal-azureps) as shown below. 

> [!NOTE]
> If the `New-AzureRmADServicePrincipal` cmdlet below returns "Another object with the same value for property identifierUris already exists," there is already a service principal by that name in your tenant. Use a different value for the **DisplayName** parameter. 

```powershell
# Create the service principal (use a strong password)
$cred = Get-Credential
$sp = New-AzureRmADServicePrincipal -DisplayName "AzureDotNetTest" -Password $cred.Password

# Give it the permissions it needs...
New-AzureRmRoleAssignment -ServicePrincipalName $sp.ApplicationId -RoleDefinitionName Contributor

# Display the Application ID, because we'll need it later.
$sp | Select DisplayName, ApplicationId
```

Make sure to note the ApplicationId:

```plaintext
DisplayName     ApplicationId
-----------     -------------
AzureDotNetTest a2ab11af-01aa-4759-8345-7803287dbd39
```
