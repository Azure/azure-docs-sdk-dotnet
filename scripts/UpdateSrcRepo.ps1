function CloneOrPull
{
      param([string]$gitRepo, [string]$branch, [string]$folderName)

      if (Test-Path $folderName\.git)
      {
          Push-Location $folderName
          & git pull
          Write-Host "Start to pull repo: $gitRepo"
          if ($lastexitcode -ne 0) { Write-Error "error while pulling repo: $gitRepo, exit code: $lastexitcode" }
          Write-Host "Finish pulling repo: $gitRepo"
          Pop-Location
      }
      else
      {
          Write-Host "Start to clone repo: $gitRepo"
          & git clone -q --branch=$branch $gitRepo $folderName
          if ($lastexitcode -ne 0) { Write-Error "error while cloning repo: $gitRepo, exit code: $lastexitcode" }
          Write-Host "Finish cloning repo: $gitRepo"
      }
}

$ErrorActionPreference = 'Stop'

$scriptPath = $MyInvocation.MyCommand.Path
$rootFolder = Split-Path $scriptPath | Split-Path
$src = "src"
md -Force $rootFolder\$src
Push-Location $rootFolder\$src

$config = Get-Content $rootFolder\repo.json -Raw | ConvertFrom-Json
Foreach($repo in $config.repo){
	CloneOrPull $($repo.url) $($repo.branch) $($repo.name)
	if ($repo.build_scripts)
	{
		Push-Location $($repo.name)
        Write-Host "Start to run build script in $($repo.name)"
        foreach ($script in $repo.build_scripts)
        {
		    Invoke-Expression $script
            if ($lastexitcode -ne 0) { Write-Error "error while running build script $($script) in $($repo.name), exit code: $lastexitcode" }
        }
        Write-Host "Finish running build script in $($repo.name)"
		Pop-Location
	}
}

Pop-Location
