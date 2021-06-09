
if(-Not (Test-path c:\test -PathType Container))
{
    New-Item c:\test -ItemType Directory -force
}
$driverPath = "c:\test\MLNX_WinOF2-2_60_51000_All_x64.exe"
if(-Not (Test-Path $driverPath -PathType Leaf))
{
    Invoke-WebRequest -Uri http://www.mellanox.com/downloads/WinOF/MLNX_WinOF2-2_60_51000_All_x64.exe -OutFile $driverPath
}
start-process -Wait -FilePath $driverPath "/s","/v""/qn"""


if(-Not (Test-path c:\tools -PathType Container))
{
    New-Item c:\tools -ItemType Directory -force
}

wget "https://github.com/microsoft/ntttcp/releases/download/v5.35/NTttcp.exe" -UseBasicParsing -OutFile c:\tools\ntttcp.exe

Get-NetAdapter