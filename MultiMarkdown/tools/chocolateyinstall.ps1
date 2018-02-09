$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/fletcher/MultiMarkdown-6/releases/download/6.3.0/MultiMarkdown-Windows-32-6.3.0.exe'
$url64      = 'https://github.com/fletcher/MultiMarkdown-6/releases/download/6.3.0/MultiMarkdown-Windows-6.3.0.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64
  softwareName  = 'multimarkdown*'
  checksum      = 'E88E0FF9C92173D6D50412EA002AD9D250F299376C1FBEA5C081B9447E5F4CBD'
  checksumType  = 'sha256'
  checksum64    = '2A1646AADDE01EDCBEF8A5A9E8813DEDD992BA4D956BF8F1AE9B2DFC97FB43F5'
  checksumType64= 'sha256'
  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
