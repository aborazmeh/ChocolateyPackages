$ErrorActionPreference = 'Stop';

function Get-CurrentDirectory
{
  $thisName = $MyInvocation.MyCommand.Name
  [IO.Path]::GetDirectoryName((Get-Content function:$thisName).File)
}

$fontHelpersPath = (Join-Path (Get-CurrentDirectory) 'FontHelpers.ps1')
. $fontHelpersPath

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = Join-Path $Env:Temp $packageName
  fileType      = 'zip'
  url           = 'https://github.com/alif-type/amiri/releases/download/0.111/Amiri-0.111.zip'
  checksum      = '1fbfccced6348b5db2c1c21d5b319cd488e14d055702fa817a0f6cb83d882166'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$shell = New-Object -ComObject Shell.Application
$fontsFolder = $shell.Namespace(0x14)

$fontFiles = Get-ChildItem $packageArgs.unzipLocation -Recurse -Filter *.ttf

$commands = $fontFiles |
% { Join-Path $fontsFolder.Self.Path $_.Name } |
? { Test-Path $_ } |
% { "Remove-SingleFont '$_' -Force;" }

$fontFiles |
% { $commands += "Add-SingleFont '$($_.FullName)';" }

$toExecute = ". $fontHelpersPath;" + ($commands -join ';')
Start-ChocolateyProcessAsAdmin $toExecute

Remove-Item $packageArgs.unzipLocation -Recurse