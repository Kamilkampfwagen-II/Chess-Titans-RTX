$ErrorActionPreference = 'SilentlyContinue'
rem <#
	cls
	@echo off
	cd %~dp0
	set "helper=$args=$args -split '';$Error.Clear();Set-Variable PSScript -Option Constant -Value ([ordered]@{Root=$args[0].Substring(0,$args[0].Length-1);Name=$args[1];FullName=$args[2];Args=$args[3..$args.length]}).AsReadOnly();Invoke-Command([ScriptBlock]::Create((Get-Content $args[2] -Raw))) -NoNewScope -ArgumentList $args[3..$args.Length]"

	:initArg
	set args=%~dp0%~nx0%0
	if '%1'=='' goto exec
	set args=%args%%1

	:addArg
	shift
	if '%1'=='' goto exec
	set args=%args%%1
	goto addArg

	:exec
	Powershell.exe -ExecutionPolicy Bypass -Command $ErrorActionPreference = 'Continue';$args = '%args%';%helper%
	exit
rem #>

#	---Chess Titans RTX Launcher---

<#
Put the following line to Steam -> Manage -> Properties -> Launch Options
cmd /c ""%command%/../chess-rtx-launcher.bat""
#>


#   Script start, don't touch the below:
$ErrorActionPreference = 'Inquire'


# Read Config
$scriptConfigDefault = @{

    'Fullscreen' = 'True'

    # Uncommon ratios don't work
    'WindowResolution' = 'AUTO'

}
$scriptConfigPath = './launcher.conf'
$scriptConfig = Get-Content $scriptConfigPath -Raw -ErrorAction Ignore | ConvertFrom-StringData

if ($scriptConfig) {
    # I don't have a better method in mind, please inform me if you do
    foreach ($key in $scriptConfigDefault.Keys) {

        # Fill in blanks in the read config     
        if (!$scriptConfig[$key]) {
            $scriptConfig[$key] = $scriptConfigDefault[$key]
        }

        # Construct lists
        if ($scriptConfig[$key].Contains(',')) {
            $scriptConfig[$key] = $scriptConfig[$key].Split(',')
        }

        # Works on lists as well
        $scriptConfig[$key] = $scriptConfig[$key].Trim()

        # Construct booleans
        if ($scriptConfig[$key] -eq 'True') {
            $scriptConfig[$key] = $true
        } elseif ($scriptConfig[$key] -eq 'False') {
            $scriptConfig[$key] = $false
        }

    }

    if ($scriptConfig['WindowResolution'] -eq 'AUTO') {
        Add-Type -AssemblyName System.Windows.Forms
        $primaryMonitorSize = [System.Windows.Forms.SystemInformation]::PrimaryMonitorSize
        $scriptConfig['WindowResolution'] = ($primaryMonitorSize.Width, $primaryMonitorSize.Height)
    }

    if ($scriptConfig['WindowResolution'].Length -ne 2) {
        $scriptConfig['WindowResolution'] = $scriptConfigDefault['WindowResolution']
    }
} else {
    $scriptConfig = $scriptConfigDefault
}


Write-Host 'Chess Titans ' -NoNewline
Write-Host 'RTX' -ForegroundColor Green
Write-Host ''

Write-Host 'Configuration:' -BackgroundColor White -ForegroundColor Black
Write-Host 'Display Mode: ' -NoNewline
Write-Host "$(if ($scriptConfig['Fullscreen']) {'Fullscreen'} else {'Windowed'})" -ForegroundColor Cyan
Write-Host 'Resolution: ' -NoNewline
Write-Host "$($scriptConfig['WindowResolution'][0])x$($scriptConfig['WindowResolution'][1])" -ForegroundColor Cyan
Write-Host ''

Write-Host '^ Edit the "launcher.conf" to reconfigure ^' -ForegroundColor Yellow
Start-Sleep -Seconds 2


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
    <PieceStyle>2</PieceStyle>
    <BoardStyle>2</BoardStyle>
    <WindowX>100</WindowX>
    <WindowY>100</WindowY>
    <WindowWidth>$($scriptConfig['WindowResolution'][0])</WindowWidth>
    <WindowHeight>$($scriptConfig['WindowResolution'][1])</WindowHeight>
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


# Configure Chess Titans
$chessConfigPath = "$env:LOCALAPPDATA/Microsoft Games/Chess Titans/ChessTitans.xml"
if (Test-Path $chessConfigPath) {
    $chessConfig = Get-Content -Path $chessConfigPath

    $chessConfig[12] = "    <Rendering>2</Rendering>"
    $chessConfig[13] = "    <RenderingLast3D>2</RenderingLast3D>"
    $chessConfig[21] = "    <WindowMaximized>false</WindowMaximized>"
    if ($scriptConfig['Fullscreen']) {
        $chessConfig[17] = "    <WindowX>100</WindowX>"
        $chessConfig[18] = "    <WindowY>100</WindowY>"
        $chessConfig[19] = "    <WindowWidth>$($scriptConfig['WindowResolution'][0])</WindowWidth>"
        $chessConfig[20] = "    <WindowHeight>$($scriptConfig['WindowResolution'][1])</WindowHeight>"
    }
} else {
    $chessConfig = $chessConfigDefault
}
# I have no idea why the $chessConfig is in script scope and the following works just fine ¯\_(ツ)_/¯
Set-Content -Path $chessConfigPath -Value $chessConfig -Force


# Configure DxWrapper
$newLine = "FullscreenWindowMode       = $(if ($scriptConfig['Fullscreen']) {1} else {0})"
$dxwrapperConfig = Get-Content './d3d9.ini'
$match = $dxwrapperConfig | Select-String -Pattern '^FullscreenWindowMode\s*=\s*\d$'
if ($match) {
    $dxwrapperConfig[$match.LineNumber -1] = $newLine
    Set-Content -Path './d3d9.ini' -Value $dxwrapperConfig -Force
} else {
    Add-Content -Path './d3d9.ini' -Value $newLine
}

# Start the Chess Titans
& "$($PSScript.Root)/chess.exe"

Start-Sleep -Seconds 3