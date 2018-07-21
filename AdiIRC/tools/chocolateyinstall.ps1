$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://adiirc.com/AdiIRC.3.1.exe'
$url64      = 'https://adiirc.com/AdiIRC64.3.1.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  softwareName  = 'AdiIRC*'
  checksum      = '1264F077E15779D3F05AADA49A6A3F9A47A2AED618A74FA4C64B33D65267EA56'
  checksumType  = 'sha256'
  checksum64    = '1B83BAD088B4AA1AAA5284B2F4ADE5C77883598947D3F4F2FF8C5E11103D01E5'
  checksumType64= 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
