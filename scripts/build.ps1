$ErrorActionPreference = 'Stop'

$scriptPath = $MyInvocation.MyCommand.Path
$rootFolder = Split-Path $scriptPath | Split-Path

Push-Location $rootFolder
md -Force "docfx"
$docfxZip = "docfx\docfx.zip"
$docfx = "docfx\"
$docfxExeUrl = "https://github.com/dotnet/docfx/releases/download/v2.1.0-cli-alpha/docfx.cli.zip"

# download docfx from github.com
Invoke-WebRequest $docfxExeUrl -OutFile $rootFolder\$docfxZip

# unzip docfx.zip
Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

Unzip $rootFolder\$docfxZip $rootFolder\$docfx

# clean api_ref
Remove-Item "api_ref\*" -Force -recurse

# run docfx metadata to generate YAML metadata
& $docfx\docfx.exe metadata
if($LASTEXITCODE -ne 0)
{
    Pop-Location
    exit 1
}

# merge toc.yml if needed
if(Test-Path scripts/mergeToc.js)
{
    & node scripts/mergeToc.js
    if($LASTEXITCODE -ne 0)
    {
        Pop-Location
        exit 1
    }
}


Pop-Location