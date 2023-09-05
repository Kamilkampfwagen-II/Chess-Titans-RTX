<#
Put the following line to Steam -> Manage -> Properties -> Launch Options
Powershell -ExecutionPolicy bypass -Command & ""%command%/../fullscreen.ps1""
#>

Set-Location $PSScriptRoot

$configPath = "$env:LOCALAPPDATA/Microsoft Games/Chess Titans/ChessTitans.xml"

$config = Get-Content -Path $configPath
$config[17] = "    <WindowX>100</WindowX>"
$config[18] = "    <WindowY>100</WindowY>"
$config[19] = "    <WindowWidth>1920</WindowWidth>"
$config[20] = "    <WindowHeight>1080</WindowHeight>"
Set-Content -Path $configPath -Value $config

$process = Start-Process "./chess.exe" -WorkingDirectory '.' -PassThru