<#
Put the following line to Steam -> Manage -> Properties -> Launch Options
Powershell -ExecutionPolicy bypass -Command & ""%command%/../fullscreen.ps1""
#>

$windowResolution = (1920,1080)

Set-Location $PSScriptRoot

$configPath = "$env:LOCALAPPDATA/Microsoft Games/Chess Titans/ChessTitans.xml"
$config = Get-Content -Path $configPath
$config[12] = "    <Rendering>2</Rendering>"
$config[13] = "    <RenderingLast3D>2</RenderingLast3D>"
$config[17] = "    <WindowX>100</WindowX>"
$config[18] = "    <WindowY>100</WindowY>"
$config[19] = "    <WindowWidth>$($windowResolution[0])</WindowWidth>"
$config[20] = "    <WindowHeight>$($windowResolution[1])</WindowHeight>"
Set-Content -Path $configPath -Value $config -Force

Start-Process "./chess.exe" -WorkingDirectory '.' -PassThru