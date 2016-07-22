REM clear azure-sdk-for-net/ and api/
rmdir /s /q "azure-sdk-for-net"
rmdir /s /q "api""

REM git clone azure .NET SDK souce code
git clone "https://github.com/Azure/azure-sdk-for-net.git"

REM run docfx
docfx metadata docfx.json