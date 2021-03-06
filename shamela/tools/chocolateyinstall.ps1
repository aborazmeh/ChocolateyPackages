﻿$ErrorActionPreference = 'Stop';
$packageName = $Env:ChocolateyPackageName;

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = Join-Path $Env:Temp $packageName
  fileType      = 'rar'
  url           = 'http://d.shamela.ws/downloads/shamela3.64.rar'
  softwareName  = 'shamela*'
  checksum      = '97dd189eb019e6c93498fdd542376dbbf0ee4e5d59d7639019e69b4e1aad336a'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath "$Env:Temp\$packageName$Env:ChocolateyPackageVersion.rar" -Url $packageArgs.url -Checksum $packageArgs.checksum -ChecksumType $packageArgs.checksumType

Get-ChocolateyUnzip -FileFullPath "$Env:Temp\shamela$Env:ChocolateyPackageVersion.rar" -Destination $Env:ChocolateyPackageFolder -PackageName $packageName

Install-ChocolateyInstallPackage -PackageName $packageName -FileType 'exe' -SilentArgs '/S' -File "$Env:ChocolateyPackageFolder\$packageName$Env:ChocolateyPackageVersion\setup.exe"
