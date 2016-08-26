$ErrorActionPreference = 'Stop'

$scriptPath = $MyInvocation.MyCommand.Path
$scriptHome = Split-Path $scriptPath

Push-Location $scriptHome

$azureDoc = "azure-docs-sdk-dotnet"
$docfxZip = "c:\projects\docfx.zip"
$docfx = "c:\projects\docfx"
$docfxExeUrl = "https://github.com/dotnet/docfx/releases/download/v2.1.0-cli-alpha/docfx.cli.zip"

# download docfx from github.com
Invoke-WebRequest $docfxExeUrl -OutFile $docfxZip

# unzip docfx.zip
Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

Unzip $docfxZip $docfx

# run docfx metadata to generate YAML metadata
& $docfx\docfx.exe metadata $azureDoc\docfx.json
if($LASTEXITCODE -ne 0)
{
    Pop-Location
    exit 1
}

Pop-Location