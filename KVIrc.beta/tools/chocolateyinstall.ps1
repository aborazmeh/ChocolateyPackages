$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://ci.appveyor.com/api/buildjobs/87xqs0900jn2tms0/artifacts/KVIrc-5.0.0-beta1-82-g8db61929f-x86.exe'
$url64      = 'https://ci.appveyor.com/api/buildjobs/idqha9tj2idlbba6/artifacts/KVIrc-5.0.0-beta1-82-g8db61929f-x86_64.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  softwareName  = 'KVIrc*'
  checksum      = 'af6f3f3e5504c0823f9161278325c7cb6ba3c205467d1de80d348a9202941f2e'
  checksumType  = 'sha256'
  checksum64    = '4e258aee7772edbccb34f957a7487094da204b06db3af448f66a97420a1a9a93'
  checksumType64= 'sha256'
  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
