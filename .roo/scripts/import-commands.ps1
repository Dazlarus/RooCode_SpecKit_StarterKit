#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Import Roo Code slash commands from YAML configuration
.DESCRIPTION
    This script imports commands from .roo/custom_commands.yaml and generates
    markdown files in .roo/commands/ for Roo Code slash command integration.
.PARAMETER YamlPath
    Path to the custom_commands.yaml file (default: ".roo/custom_commands.yaml")
.PARAMETER TargetDir
    Target directory for generated markdown files (default: ".roo/commands")
.PARAMETER NoOverwrite
    Skip overwriting existing files
.PARAMETER AutoDetect
    Automatically find YAML file in .roo directory
#>

param(
    [string]$YamlPath = "",
    [string]$TargetDir = "",
    [switch]$NoOverwrite,
    [switch]$AutoDetect
)

# Set default paths if not provided
if (-not $YamlPath) {
    $YamlPath = ".roo/custom_commands.yaml"
}

if (-not $TargetDir) {
    $TargetDir = ".roo/commands"
}

# Auto-detect YAML file if requested
if ($AutoDetect -or (-not (Test-Path $YamlPath))) {
    $possiblePaths = @(
        ".roo/custom_commands.yaml",
        "custom_commands.yaml",
        ".roo/commands/custom_commands.yaml"
    )

    foreach ($path in $possiblePaths) {
        if (Test-Path $path) {
            $YamlPath = $path
            Write-Host "Auto-detected YAML file: $YamlPath" -ForegroundColor Green
            break
        }
    }
}

# Verify YAML file exists
if (-not (Test-Path $YamlPath)) {
    Write-Error "YAML file not found: $YamlPath"
    Write-Host "Please ensure .roo/custom_commands.yaml exists or specify the correct path."
    exit 1
}

# Create target directory if it doesn't exist
if (-not (Test-Path $TargetDir)) {
    New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
    Write-Host "Created target directory: $TargetDir" -ForegroundColor Yellow
}

Write-Host "Importing commands from: $YamlPath" -ForegroundColor Cyan
Write-Host "Target directory: $TargetDir" -ForegroundColor Cyan

if ($NoOverwrite) {
    Write-Host "Mode: No-overwrite (skipping existing files)" -ForegroundColor Yellow
} else {
    Write-Host "Mode: Overwrite (updating all files)" -ForegroundColor Yellow
}

# Note: This is a template script. The actual import logic would need to be
# implemented based on the specific Roo Code import mechanism.
# For now, this serves as a placeholder that shows the intended functionality.

Write-Host ""
Write-Host "To complete the import process:" -ForegroundColor Green
Write-Host "1. Open Roo Code in VS Code" -ForegroundColor White
Write-Host "2. Run: /import-commands $YamlPath --target $TargetDir $(if ($NoOverwrite) {'--no-overwrite'})" -ForegroundColor White
Write-Host "3. Reload VS Code window" -ForegroundColor White
Write-Host ""
Write-Host "Alternatively, you can run this directly in Roo Code without the script." -ForegroundColor Yellow

# Keep the window open for user to read
Write-Host "Press Enter to continue..." -ForegroundColor Gray
Read-Host