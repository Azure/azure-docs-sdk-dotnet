Create a text file named `azureauth.properties` using the service principal credentials:

```plaintext
# sample management library properties file
subscription=15dbcfa8-4b93-4c9a-881c-6189d39f04d4
client=a2ab11af-01aa-4759-8345-7803287dbd39
key=password
tenant=43413cc1-5886-4711-9804-8cfea3d1c3ee
managementURI=https://management.core.windows.net/
baseURL=https://management.azure.com/
authURL=https://login.windows.net/
graphURL=https://graph.windows.net/
```

- subscription: use the *SubscriptionId* value from when you ran `Login-AzureRmAccount`.
- client: use the *ApplicationId* value from the service principal output.
- key: use the *-Password* parameter you assigned when you ran `New-AzureRmADServicePrincipal` (without quotes).
- tenant: use the *TenantId* value from when you ran `Login-AzureRmAccount`.

Save this file in a secure location on your system where your code can read it. Use PowerShell to set an environment variable named `AZURE_AUTH_LOCATION` with the full path to the file, for example:

```powershell
[Environment]::SetEnvironmentVariable("AZURE_AUTH_LOCATION", "C:\src\azureauth.properties", "User")
```
