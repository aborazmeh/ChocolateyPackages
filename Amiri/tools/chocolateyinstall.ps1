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
  url           = 'https://github.com/alif-type/amiri/releases/download/0.109/amiri-0.109.zip'
  checksum      = '97ee6e40d87f4b31de15d9a93bb30bf27bf308f0814f4ee9c47365b027402ad6'
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