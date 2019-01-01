$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/fletcher/MultiMarkdown-6/releases/download/6.4.0/MultiMarkdown-Windows-32-6.4.0.exe'
$url64      = 'https://github.com/fletcher/MultiMarkdown-6/releases/download/6.4.0/MultiMarkdown-Windows-6.4.0.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  softwareName  = 'multimarkdown*'
  checksum      = '173886CAAE064BB3EA14F603DBFF19AFD05A823F00846A98D8D2A74D6B8AD504'
  checksumType  = 'sha256'
  checksum64    = '488D3F9BC168B2C1502C81DC3111F47F3C7E2C18A6C95FBF3A95578316E31B50'
  checksumType64= 'sha256'
  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
