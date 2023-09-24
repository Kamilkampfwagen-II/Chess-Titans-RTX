<#
Put the following line to Steam -> Manage -> Properties -> Launch Options
Powershell -ExecutionPolicy bypass -Command & ""%command%/../fullscreen.ps1""
#>


#   Script start, don't touch the below:
$ErrorActionPreference = 'Stop'

if ($MyInvocation.MyCommand.CommandType -eq 'ExternalScript') {
    $global:ScriptPath = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
} else {
    $global:ScriptPath = Split-Path -Path ([Environment]::GetCommandLineArgs()[0]) -Parent
    if (!$ScriptPath) { $global:ScriptPath = "." }
}

#   Options
$scriptConfigDefault = @"
{
    "fullscreen": true,
    "windowResolution": [1920,1080]
}
"@ | ConvertFrom-Json
$scriptConfig = $scriptConfigDefault
$scriptConfigPath = "$ScriptPath/options.json"

$dxwrapperConfigPath = "$ScriptPath/d3d9.ini"

#   Options Parsing:
if (!(Test-Path $dxwrapperConfigPath)) {
    throw "DxWrapper configuration was not found, please validate your installation."
}

$rewrite = $false
if (Test-Path $scriptConfigPath) {
    $scriptConfigUser = Get-Content $scriptConfigPath -Raw | ConvertFrom-Json -ErrorAction Ignore
    if ($scriptConfigUser) {
        $scriptConfig = $scriptConfigUser
    } else {
        $rewrite = $true
    }
} else {
    $rewrite = $true
}

#   Validate options
# Make sure fullscreen property exists
if (!($scriptConfig | Get-Member 'fullscreen')) {
    Add-Member -InputObject $scriptConfig -MemberType NoteProperty -Name 'fullscreen' -Value $scriptConfigDefault.fullscreen
    $rewrite = $true
}
# Prevent non boolean values
if ($scriptConfig.fullscreen -isnot [bool]) {
    $scriptConfig.fullscreen = $scriptConfigDefault.fullscreen
    $rewrite = $true
}


# Make sure windowResolution property exists
if (!($scriptConfig | Get-Member 'windowResolution')) {
    Add-Member -InputObject $scriptConfig -MemberType NoteProperty -Name 'windowResolution' -Value $scriptConfigDefault.windowResolution
    $rewrite = $true
}
# Prevent non digit values
if ("$($scriptConfig.windowResolution)" -notmatch '^\d+ \d+$') {
    $scriptConfig.windowResolution = $scriptConfigDefault.windowResolution
    $rewrite = $true
}
# Minimum resolution supported by Chess Titans is 640x420
if ($scriptConfig.windowResolution[0] -lt 640 -or $scriptConfig.windowResolution[1] -lt 420) {
    $scriptConfig.windowResolution = $scriptConfigDefault.windowResolution
    $rewrite = $true
}

if ($rewrite) {
    Set-Content -Path "$ScriptPath/options.json" -Value ($scriptConfig | ConvertTo-Json -Compress)
}

#   Default Config for Chess Titans
$chessConfigDefault = @"
<Prefs>
    <PlayAsWhite>true</PlayAsWhite>
    <PlayAnimations>true</PlayAnimations>
    <PlaySound>true</PlaySound>
    <ShowTips>false</ShowTips>
    <AutoContinueSavedGame>true</AutoContinueSavedGame>
    <AutoSaveGame>true</AutoSaveGame>
    <ShowLastMove>true</ShowLastMove>
    <ShowValidMoves>true</ShowValidMoves>
    <AutoRotateBoard>true</AutoRotateBoard>
    <ReturnToNeutral>false</ReturnToNeutral>
    <Difficulty>4</Difficulty>
    <Rendering>2</Rendering>
    <RenderingLast3D>2</RenderingLast3D>
    <RandomizeStyles>false</RandomizeStyles>
    <PieceStyle>1</PieceStyle>
    <BoardStyle>1</BoardStyle>
    <WindowX>100</WindowX>
    <WindowY>100</WindowY>
    <WindowWidth>$($scriptConfig.windowResolution[0])</WindowWidth>
    <WindowHeight>$($scriptConfig.windowResolution[1])</WindowHeight>
    <WindowMaximized>false</WindowMaximized>
    <TipHowToPlay>false</TipHowToPlay>
    <TipRotationFeature>false</TipRotationFeature>
    <DisplayRefWarning>true</DisplayRefWarning>
    <GamesPlayed0>0</GamesPlayed0>
    <GamesWon0>0</GamesWon0>
    <GamesDrawn0>0</GamesDrawn0>
    <LongestWinStreak0>0</LongestWinStreak0>
    <LongestLossStreak0>0</LongestLossStreak0>
    <LongestDrawnStreak0>0</LongestDrawnStreak0>
    <CurrentWinStreak0>0</CurrentWinStreak0>
    <CurrentDrawnStreak0>0</CurrentDrawnStreak0>
    <CurrentLossStreak0>0</CurrentLossStreak0>
    <GamesPlayed1>0</GamesPlayed1>
    <GamesWon1>0</GamesWon1>
    <GamesDrawn1>0</GamesDrawn1>
    <LongestWinStreak1>0</LongestWinStreak1>
    <LongestLossStreak1>0</LongestLossStreak1>
    <LongestDrawnStreak1>0</LongestDrawnStreak1>
    <CurrentWinStreak1>0</CurrentWinStreak1>
    <CurrentDrawnStreak1>0</CurrentDrawnStreak1>
    <CurrentLossStreak1>0</CurrentLossStreak1>
    <GamesPlayed2>0</GamesPlayed2>
    <GamesWon2>0</GamesWon2>
    <GamesDrawn2>0</GamesDrawn2>
    <LongestWinStreak2>0</LongestWinStreak2>
    <LongestLossStreak2>0</LongestLossStreak2>
    <LongestDrawnStreak2>0</LongestDrawnStreak2>
    <CurrentWinStreak2>0</CurrentWinStreak2>
    <CurrentDrawnStreak2>0</CurrentDrawnStreak2>
    <CurrentLossStreak2>0</CurrentLossStreak2>
    <GamesPlayed3>0</GamesPlayed3>
    <GamesWon3>0</GamesWon3>
    <GamesDrawn3>0</GamesDrawn3>
    <LongestWinStreak3>0</LongestWinStreak3>
    <LongestLossStreak3>0</LongestLossStreak3>
    <LongestDrawnStreak3>0</LongestDrawnStreak3>
    <CurrentWinStreak3>0</CurrentWinStreak3>
    <CurrentDrawnStreak3>0</CurrentDrawnStreak3>
    <CurrentLossStreak3>0</CurrentLossStreak3>
    <GamesPlayed4>0</GamesPlayed4>
    <GamesWon4>0</GamesWon4>
    <GamesDrawn4>0</GamesDrawn4>
    <LongestWinStreak4>0</LongestWinStreak4>
    <LongestLossStreak4>0</LongestLossStreak4>
    <LongestDrawnStreak4>0</LongestDrawnStreak4>
    <CurrentWinStreak4>0</CurrentWinStreak4>
    <CurrentDrawnStreak4>0</CurrentDrawnStreak4>
    <CurrentLossStreak4>0</CurrentLossStreak4>
    <GamesPlayed5>0</GamesPlayed5>
    <GamesWon5>0</GamesWon5>
    <GamesDrawn5>0</GamesDrawn5>
    <LongestWinStreak5>0</LongestWinStreak5>
    <LongestLossStreak5>0</LongestLossStreak5>
    <LongestDrawnStreak5>0</LongestDrawnStreak5>
    <CurrentWinStreak5>0</CurrentWinStreak5>
    <CurrentDrawnStreak5>0</CurrentDrawnStreak5>
    <CurrentLossStreak5>0</CurrentLossStreak5>
    <GamesPlayed6>0</GamesPlayed6>
    <GamesWon6>0</GamesWon6>
    <GamesDrawn6>0</GamesDrawn6>
    <LongestWinStreak6>0</LongestWinStreak6>
    <LongestLossStreak6>0</LongestLossStreak6>
    <LongestDrawnStreak6>0</LongestDrawnStreak6>
    <CurrentWinStreak6>0</CurrentWinStreak6>
    <CurrentDrawnStreak6>0</CurrentDrawnStreak6>
    <CurrentLossStreak6>0</CurrentLossStreak6>
    <GamesPlayed7>0</GamesPlayed7>
    <GamesWon7>0</GamesWon7>
    <GamesDrawn7>0</GamesDrawn7>
    <LongestWinStreak7>0</LongestWinStreak7>
    <LongestLossStreak7>0</LongestLossStreak7>
    <LongestDrawnStreak7>0</LongestDrawnStreak7>
    <CurrentWinStreak7>0</CurrentWinStreak7>
    <CurrentDrawnStreak7>0</CurrentDrawnStreak7>
    <CurrentLossStreak7>0</CurrentLossStreak7>
    <GamesPlayed8>0</GamesPlayed8>
    <GamesWon8>0</GamesWon8>
    <GamesDrawn8>0</GamesDrawn8>
    <LongestWinStreak8>0</LongestWinStreak8>
    <LongestLossStreak8>0</LongestLossStreak8>
    <LongestDrawnStreak8>0</LongestDrawnStreak8>
    <CurrentWinStreak8>0</CurrentWinStreak8>
    <CurrentDrawnStreak8>0</CurrentDrawnStreak8>
    <CurrentLossStreak8>0</CurrentLossStreak8>
    <GamesPlayed9>0</GamesPlayed9>
    <GamesWon9>0</GamesWon9>
    <GamesDrawn9>0</GamesDrawn9>
    <LongestWinStreak9>0</LongestWinStreak9>
    <LongestLossStreak9>0</LongestLossStreak9>
    <LongestDrawnStreak9>0</LongestDrawnStreak9>
    <CurrentWinStreak9>0</CurrentWinStreak9>
    <CurrentDrawnStreak9>0</CurrentDrawnStreak9>
    <CurrentLossStreak9>0</CurrentLossStreak9>
</Prefs>
"@

$chessConfigPath = "$env:LOCALAPPDATA/Microsoft Games/Chess Titans/ChessTitans.xml"
if (Test-Path $chessConfigPath) {
    $chessConfig = Get-Content -Path $chessConfigPath
    $chessConfig[12] = "    <Rendering>2</Rendering>"
    $chessConfig[13] = "    <RenderingLast3D>2</RenderingLast3D>"
    $chessConfig[17] = "    <WindowX>100</WindowX>"
    $chessConfig[18] = "    <WindowY>100</WindowY>"
    $chessConfig[19] = "    <WindowWidth>$($scriptConfig.windowResolution[0])</WindowWidth>"
    $chessConfig[20] = "    <WindowHeight>$($scriptConfig.windowResolution[1])</WindowHeight>"
    $chessConfig[21] = "    <WindowMaximized>false</WindowMaximized>"
} else {
    $chessConfig = $chessConfigDefault
}
Set-Content -Path $chessConfigPath -Value $chessConfig -Force

$dxwrapperConfig = Get-Content $dxwrapperConfigPath
$i = $dxwrapperConfig.indexOf(($dxwrapperConfig | Select-String -Pattern '^FullscreenWindowMode\s*=\s*\d$'))
if ($i -eq -1) {
    Add-Content -Path $dxwrapperConfigPath -Value "FullscreenWindowMode       = $(if ($scriptConfig.fullscreen) {1} else {0})" -Force
} else {
    $dxwrapperConfig[$i] = "FullscreenWindowMode       = $(if ($scriptConfig.fullscreen) {1} else {0})"
    Set-Content -Path $dxwrapperConfigPath -Value $dxwrapperConfig -Force
}

& "$ScriptPath/chess.exe"