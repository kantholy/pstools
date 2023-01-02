$user = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-Not $user.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)) {
    Write-Error "Need to be run as Administrator"
    exit 1
}

$downloadLink = "https://download.sysinternals.com/files/PSTools.zip"
$pstoolsZip = Join-Path -Path $env:TEMP -ChildPath "PSTools.zip"
$targetFolder = $env:WINDIR

# download
Invoke-WebRequest -Uri $downloadLink -OutFile $pstoolsZip

# extract
Add-Type -AssemblyName System.IO.Compression.FileSystem
$zip = [System.IO.Compression.ZipFile]::OpenRead($pstoolsZip)
$zip.Entries | ForEach-Object { 
    $target = Join-Path -Path $targetFolder -ChildPath $_.Name
    [System.IO.Compression.ZipFileExtensions]::ExtractToFile($_, $target, $true)
}
$zip.Dispose()

# cleanup
Remove-Item $pstoolsZip

Write-Host "PsTools installed." -ForegroundColor Green