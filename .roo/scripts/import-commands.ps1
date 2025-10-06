#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Intelligent Roo Code slash command importer with smart detection and validation
.DESCRIPTION
    Advanced import system that auto-discovers YAML files, validates structure,
    and generates functional Roo Code slash commands with comprehensive error handling.
.PARAMETER YamlPath
    Path to the custom_commands.yaml file (auto-detected if not provided)
.PARAMETER TargetDir
    Target directory for generated markdown files (default: ".roo/commands")
.PARAMETER NoOverwrite
    Skip overwriting existing files
.PARAMETER AutoDetect
    Automatically find YAML file in multiple locations
.PARAMETER DryRun
    Show what would be generated without creating files
.PARAMETER ValidateOnly
    Only validate YAML structure without generating files
#>

param(
    [string]$YamlPath = "",
    [string]$TargetDir = "",
    [switch]$NoOverwrite,
    [switch]$AutoDetect,
    [switch]$DryRun,
    [switch]$ValidateOnly
)

# Enhanced YAML parser with validation and error reporting
function ConvertFrom-Yaml {
    param([string]$YamlContent)

    $commands = @{}
    $currentCommand = $null
    $inCommand = $false
    $lineNumber = 0

    $lines = $YamlContent -split "`n"

    foreach ($line in $lines) {
        $lineNumber++
        $trimmedLine = $line.Trim()

        # Skip empty lines and comments
        if ($trimmedLine -eq "" -or $trimmedLine -match "^\s*#") {
            continue
        }

        # Handle root level
        if ($trimmedLine -eq "customCommands:" -or $trimmedLine -eq "commands:") {
            continue
        }

        # Detect start of command entry
        if ($trimmedLine -match "^- name:") {
            $inCommand = $true
            $currentCommand = @{}
            $name = $trimmedLine -replace "^- name:\s*" -replace '"', ''
            $currentCommand.name = $name
            $currentCommand.lineNumber = $lineNumber
        }
        elseif ($inCommand -and $trimmedLine -match "^\s+command:") {
            $command = $trimmedLine -replace "^\s*command:\s*" -replace '"', ''
            $currentCommand.command = $command
        }
        elseif ($inCommand -and $trimmedLine -match "^\s+description:") {
            $description = $trimmedLine -replace "^\s*description:\s*" -replace '"', ''
            $currentCommand.description = $description

            # Validate command structure
            if (-not $currentCommand.name) {
                Write-Warning "Command at line $lineNumber missing name field"
            }
            if (-not $currentCommand.command) {
                Write-Warning "Command '$($currentCommand.name)' at line $lineNumber missing command field"
            }
            if (-not $currentCommand.description) {
                Write-Warning "Command '$($currentCommand.name)' at line $lineNumber missing description field"
            }

            $commands[$currentCommand.name] = $currentCommand
            $inCommand = $false
            $currentCommand = $null
        }
    }

    return @{customCommands = $commands.Values; totalCommands = $commands.Count}
}

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

# Enhanced auto-detection with multiple search strategies
if ($AutoDetect -or (-not $YamlPath) -or (-not (Test-Path $YamlPath))) {
    $possiblePaths = @(
        # Primary locations
        ".roo/custom_commands.yaml",
        "custom_commands.yaml",
        ".roo/commands/custom_commands.yaml",

        # Alternative names
        ".roo/commands.yaml",
        ".roo/config/commands.yaml",

        # Backup locations
        "config/custom_commands.yaml",
        "tools/commands.yaml"
    )

    Write-Host "Searching for YAML files..." -ForegroundColor Cyan

    foreach ($path in $possiblePaths) {
        if (Test-Path $path) {
            $YamlPath = $path
            Write-Host "✓ Found: $path" -ForegroundColor Green
            break
        } else {
            Write-Host "  Not found: $path" -ForegroundColor Gray
        }
    }

    if (-not $YamlPath -or -not (Test-Path $YamlPath)) {
        Write-Warning "No YAML file found in standard locations"
        Write-Host "Please specify the path manually or create .roo/custom_commands.yaml"
        exit 1
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

# Import and validate the YAML data
try {
    $yamlContent = Get-Content $YamlPath -Raw -ErrorAction Stop
    Write-Host "Reading YAML file: $YamlPath" -ForegroundColor Cyan

    $commands = ConvertFrom-Yaml $yamlContent

    if ($commands.totalCommands -eq 0) {
        Write-Warning "No valid commands found in YAML file"
        Write-Host "Please check the YAML structure and ensure it contains command definitions."
        exit 1
    }

    Write-Host "✓ Parsed $($commands.totalCommands) commands from YAML" -ForegroundColor Green

} catch {
    Write-Error "Failed to read or parse YAML file: $YamlPath"
    Write-Error $_.Exception.Message
    Write-Host "Please ensure the file exists and contains valid YAML syntax."
    exit 1
}

# Validation-only mode
if ($ValidateOnly) {
    Write-Host ""
    Write-Host "YAML Validation Results:" -ForegroundColor Cyan
    Write-Host "  File: $YamlPath" -ForegroundColor White
    Write-Host "  Commands found: $($commands.totalCommands)" -ForegroundColor Green
    Write-Host "  Target directory: $TargetDir" -ForegroundColor White
    Write-Host ""
    Write-Host "Commands that would be generated:" -ForegroundColor Yellow

    foreach ($cmd in $commands.customCommands) {
        $safeName = $cmd.name -replace '[^\w\-\.]', '_' -replace '__+', '_'
        $fileName = "$safeName.md"
        Write-Host "  ✓ $($cmd.name) -> $fileName" -ForegroundColor Green
    }

    Write-Host ""
    Write-Host "Validation complete! Use without --ValidateOnly to generate files." -ForegroundColor Cyan
    exit 0
}

# Ensure target directory exists
if (-not (Test-Path $TargetDir)) {
    New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
    Write-Host "Created target directory: $TargetDir" -ForegroundColor Yellow
}

$processedCount = 0
$skippedCount = 0
$dryRunCount = 0

# Pre-scan for dry-run information
if ($DryRun) {
    Write-Host ""
    Write-Host "DRY RUN - No files will be created" -ForegroundColor Yellow
    Write-Host "Commands that would be generated:" -ForegroundColor Cyan
}

foreach ($cmd in $commands.customCommands) {
    $commandName = $cmd.name
    $commandValue = $cmd.command
    $commandDescription = $cmd.description

    # Create a safe filename from the command name (enhanced sanitization)
    $safeName = $commandName -replace '[^\w\-\.\s]', '_' -replace '__+', '_' -replace '\s+', '_'
    $fileName = "$safeName.md"
    $filePath = Join-Path $TargetDir $fileName

    # Handle dry-run mode
    if ($DryRun) {
        if (Test-Path $filePath) {
            Write-Host "  ~ $commandName -> $fileName (would overwrite)" -ForegroundColor Yellow
        } else {
            Write-Host "  + $commandName -> $fileName (new file)" -ForegroundColor Green
        }
        $dryRunCount++
        continue
    }

    # Check if file exists and we're in no-overwrite mode
    if (Test-Path $filePath -and $NoOverwrite) {
        Write-Host "Skipping (exists): $commandName" -ForegroundColor Gray
        $skippedCount++
        continue
    }

    # Determine action type for feedback
    $action = "Generated"
    $color = "Green"
    if (Test-Path $filePath) {
        $action = "Updated"
        $color = "Blue"
    }

    # Create enhanced markdown content for the slash command
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
**Generated:** $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')
"@

    try {
        # Ensure target directory exists
        if (-not (Test-Path $TargetDir)) {
            New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
        }

        Set-Content -Path $filePath -Value $markdownContent -Encoding UTF8 -ErrorAction Stop
        Write-Host "$action`: $commandName -> $fileName" -ForegroundColor $color
        $processedCount++
    } catch {
        Write-Warning "Failed to create file for command: $commandName"
        Write-Warning $_.Exception.Message
        Write-Host "  Path: $filePath" -ForegroundColor Gray
    }
}

Write-Host ""
Write-Host "Import Summary:" -ForegroundColor Cyan
Write-Host "  YAML file: $YamlPath" -ForegroundColor White
Write-Host "  Target directory: $TargetDir" -ForegroundColor White
Write-Host "  Processed: $processedCount commands" -ForegroundColor Green

if ($skippedCount -gt 0) {
    Write-Host "  Skipped: $skippedCount existing files" -ForegroundColor Yellow
}

if ($DryRun) {
    Write-Host "  Mode: Dry run (no files created)" -ForegroundColor Blue
    Write-Host "  Previewed: $dryRunCount commands" -ForegroundColor Cyan
}

$totalCommands = $commands.totalCommands
$successRate = if ($totalCommands -gt 0) { [math]::Round(($processedCount / $totalCommands) * 100, 1) } else { 0 }
Write-Host "  Success rate: $successRate% ($processedCount/$totalCommands)" -ForegroundColor $(if ($successRate -eq 100) { "Green" } else { "Yellow" })

Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Reload VS Code window:" -ForegroundColor White
Write-Host "   • Press Ctrl+Shift+P (or Cmd+Shift+P on Mac)" -ForegroundColor Gray
Write-Host "   • Type 'Developer: Reload Window' and select it" -ForegroundColor Gray
Write-Host ""
Write-Host "2. Verify commands appear in:" -ForegroundColor White
Write-Host "   • Settings → Extensions → Roo Code" -ForegroundColor Gray
Write-Host "   • Look for 'Workspace Commands' section" -ForegroundColor Gray
Write-Host ""
Write-Host "3. Use the imported commands:" -ForegroundColor White
Write-Host "   • Commands are now available in Roo Code chat" -ForegroundColor Gray
Write-Host "   • Access via command palette or direct entry" -ForegroundColor Gray

if (-not $DryRun) {
    Write-Host ""
    Write-Host "💡 Tip: Run this script again with --DryRun to preview changes" -ForegroundColor Yellow
}

# Keep the window open for user to read
if (-not $DryRun) {
    Write-Host ""
    Write-Host "Press Enter to continue..." -ForegroundColor Gray
    Read-Host
}