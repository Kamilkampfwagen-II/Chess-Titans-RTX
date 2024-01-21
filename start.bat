@echo off
cd %~dp0
Powershell -ExecutionPolicy bypass -NoLogo -File "./chess-rtx-launcher.ps1"
