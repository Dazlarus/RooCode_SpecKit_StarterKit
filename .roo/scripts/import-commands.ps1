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

# Simple YAML parser for PowerShell (basic support for our use case)
function ConvertFrom-Yaml {
    param([string]$YamlContent)

    $commands = @{}
    $currentCommand = $null
    $inCommand = $false

    $lines = $YamlContent -split "`n"

    foreach ($line in $lines) {
        $trimmedLine = $line.Trim()

        if ($trimmedLine -eq "customCommands:" -or $trimmedLine -eq "") {
            continue
        }

        if ($trimmedLine -match "^- name:") {
            $inCommand = $true
            $currentCommand = @{}
            $name = $trimmedLine -replace "^- name:\s*" -replace '"', ''
            $currentCommand.name = $name
        }
        elseif ($inCommand -and $trimmedLine -match "^command:") {
            $command = $trimmedLine -replace "^\s*command:\s*" -replace '"', ''
            $currentCommand.command = $command
        }
        elseif ($inCommand -and $trimmedLine -match "^description:") {
            $description = $trimmedLine -replace "^\s*description:\s*" -replace '"', ''
            $currentCommand.description = $description
            $commands[$currentCommand.name] = $currentCommand
            $inCommand = $false
        }
    }

    return @{customCommands = $commands.Values}
}

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

# Import the YAML data
try {
    $yamlContent = Get-Content $YamlPath -Raw
    $commands = ConvertFrom-Yaml $yamlContent
} catch {
    Write-Error "Failed to read or parse YAML file: $YamlPath"
    Write-Error $_.Exception.Message
    exit 1
}

# Ensure target directory exists
if (-not (Test-Path $TargetDir)) {
    New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
    Write-Host "Created target directory: $TargetDir" -ForegroundColor Yellow
}

$processedCount = 0
$skippedCount = 0

foreach ($cmd in $commands.customCommands) {
    $commandName = $cmd.name
    $commandValue = $cmd.command
    $commandDescription = $cmd.description

    # Create a safe filename from the command name
    $safeName = $commandName -replace '[^\w\-\.]', '_' -replace '__+', '_'
    $fileName = "$safeName.md"
    $filePath = Join-Path $TargetDir $fileName

    # Check if file exists and we're in no-overwrite mode
    if (Test-Path $filePath -and $NoOverwrite) {
        Write-Host "Skipping (exists): $commandName" -ForegroundColor Gray
        $skippedCount++
        continue
    }

    # Create markdown content for the slash command
    $markdownContent = @"
---
command: $commandName
description: $commandDescription
---

$commandDescription

**Usage:**
`````
$commandValue
`````

**Category:** Workspace Commands
"@

    try {
        Set-Content -Path $filePath -Value $markdownContent -Encoding UTF8
        Write-Host "Generated: $commandName -> $fileName" -ForegroundColor Green
        $processedCount++
    } catch {
        Write-Warning "Failed to create file for command: $commandName"
        Write-Warning $_.Exception.Message
    }
}

Write-Host ""
Write-Host "Import Summary:" -ForegroundColor Cyan
Write-Host "  Processed: $processedCount commands" -ForegroundColor Green
if ($skippedCount -gt 0) {
    Write-Host "  Skipped: $skippedCount existing files" -ForegroundColor Yellow
}
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Reload VS Code window (Ctrl+Shift+P -> 'Developer: Reload Window')" -ForegroundColor White
Write-Host "2. Commands will appear in Settings -> Slash Commands -> Workspace Commands" -ForegroundColor White
Write-Host "3. You can now use any of the imported commands in Roo Code" -ForegroundColor White
Write-Host ""
Write-Host "Alternatively, run '/reimport' in Roo Code to refresh commands." -ForegroundColor Yellow

# Keep the window open for user to read
Write-Host "Press Enter to continue..." -ForegroundColor Gray
Read-Host