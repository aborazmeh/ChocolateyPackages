$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/fletcher/MultiMarkdown-6/releases/download/6.3.2/MultiMarkdown-Windows-32-6.3.2.exe'
$url64      = 'https://github.com/fletcher/MultiMarkdown-6/releases/download/6.3.2/MultiMarkdown-Windows-6.3.2.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  softwareName  = 'multimarkdown*'
  checksum      = '154589f99c235560a82af868ff4c0ebef1bcbc8ba4a17a2b96d1878987c8d085'
  checksumType  = 'sha256'
  checksum64    = '51e88926109d24df5fb9acf1ea854a330d4745effd7624ad3a77cc8f4a2b98ee'
  checksumType64= 'sha256'
  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
