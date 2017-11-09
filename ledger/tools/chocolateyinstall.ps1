$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/AlexanderAA/ledger_binaries_windows/raw/master/ledger_3.1.1_win_bin.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'zip'
  url           = $url
  softwareName  = 'ledger*'
  checksum      = '182657B028F6EAB201965C2DE39D6F3BB63AA46B6BCF603B24624363338AA37D'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs