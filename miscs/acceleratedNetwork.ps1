
if(-Not (Test-path c:\test -PathType Container))
{
    New-Item c:\test -ItemType Directory -force
}
$cx3driverPath = "c:\test\MLNX_VPI_WinOF-5_50_54000_All_win2019_x64.exe"
if(-Not (Test-Path $cx3driverPath -PathType Leaf))
{
    Invoke-WebRequest -Uri https://mywinimgbldstg.blob.core.windows.net/mywinimgbldcontr/MLNX_VPI_WinOF-5_50_54000_All_win2019_x64.exe -OutFile $cx3driverPath
}

$cx4driverPath = "MLNX_WinOF2-2_60_51000_All_x64.exe"
if(-Not (Test-Path $cx4driverPath -PathType Leaf))
{
    Invoke-WebRequest -Uri http://www.mellanox.com/downloads/WinOF/MLNX_WinOF2-2_60_51000_All_x64.exe -OutFile $cx4driverPath
}
start-process -Wait -FilePath $cx4driverPath "/s","/v""/qn"""


if(-Not (Test-path c:\tools -PathType Container))
{
    New-Item c:\tools -ItemType Directory -force
}

wget "https://github.com/microsoft/ntttcp/releases/download/v5.35/NTttcp.exe" -UseBasicParsing -OutFile c:\tools\ntttcp.exe

Get-NetAdapter