$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.adiirc.com/AdiIRC.3.2.exe'
$url64      = 'https://www.adiirc.com/AdiIRC64.3.2.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  softwareName  = 'AdiIRC*'
  checksum      = '715EEE29A12DD59B33B55D3AE8C62738BB2270A7433E1AB0F9D5A61BA9B10471'
  checksumType  = 'sha256'
  checksum64    = 'B92344F09B1FD8706CCD5392877841DF95CD861138C40749B70E89323EACC999'
  checksumType64= 'sha256'

  validExitCodes= @(1223, 0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
