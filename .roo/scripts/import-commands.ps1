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

# Robust YAML parser that handles the actual YAML structure in custom_commands.yaml
function ConvertFrom-Yaml {
    param([string]$YamlContent)

    $commands = @{}
    $lineNumber = 0

    # Split into lines and process
    $lines = $YamlContent -split "`n"
    $i = 0

    while ($i -lt $lines.Count) {
        $line = $lines[$i]
        $lineNumber++
        $trimmedLine = $line.Trim()

        # Skip empty lines and comments
        if ($trimmedLine -eq "" -or $trimmedLine -match "^\s*#") {
            $i++
            continue
        }

        # Handle root level
        if ($trimmedLine -eq "customCommands:" -or $trimmedLine -eq "commands:") {
            $i++
            continue
        }

        # Detect start of command entry (array item)
        if ($trimmedLine -match "^- name:") {
            $command = @{}

            # Extract name (handle both quoted and unquoted)
            $nameLine = $trimmedLine
            if ($nameLine -match '- name:\s*"([^"]+)"') {
                $command.name = $matches[1]
            } elseif ($nameLine -match "- name:\s*'([^']+)'") {
                $command.name = $matches[1]
            } elseif ($nameLine -match "- name:\s*(.+)") {
                $command.name = $matches[1].Trim()
            }

            # Process subsequent lines for this command
            $i++
            while ($i -lt $lines.Count) {
                $nextLine = $lines[$i]
                $nextTrimmed = $nextLine.Trim()

                # End of command (next array item or end of array)
                if ($nextTrimmed -match "^- " -or $nextTrimmed -eq "" -or $i -eq ($lines.Count - 1)) {
                    break
                }

                # Extract command field
                if ($nextTrimmed -match "^\s*command:") {
                    if ($nextTrimmed -match 'command:\s*"([^"]+)"') {
                        $command.command = $matches[1]
                    } elseif ($nextTrimmed -match "command:\s*'([^']+)'") {
                        $command.command = $matches[1]
                    } elseif ($nextTrimmed -match "command:\s*(.+)") {
                        $command.command = $matches[1].Trim()
                    }
                }
                # Extract description field
                elseif ($nextTrimmed -match "^\s*description:") {
                    if ($nextTrimmed -match 'description:\s*"([^"]+)"') {
                        $command.description = $matches[1]
                    } elseif ($nextTrimmed -match "description:\s*'([^']+)'") {
                        $command.description = $matches[1]
                    } elseif ($nextTrimmed -match "description:\s*(.+)") {
                        $command.description = $matches[1].Trim()
                    }
                }

                $i++
            }

            # Validate and add command
            if ($command.name -and $command.command -and $command.description) {
                $commands[$command.name] = $command
            } else {
                Write-Warning "Incomplete command definition at line $lineNumber"
            }
        } else {
            $i++
        }
    }

    return @{customCommands = $commands.Values; totalCommands = $commands.Count}
}

# Set default paths if not provided (resolve relative to current working directory)
$currentDir = Get-Location
if (-not $YamlPath) {
    $YamlPath = Join-Path $currentDir ".roo/custom_commands.yaml"
}

if (-not $TargetDir) {
    $TargetDir = Join-Path $currentDir ".roo/commands"
}

Write-Host "Working directory: $currentDir" -ForegroundColor Cyan

# Enhanced auto-detection with multiple search strategies
if ($AutoDetect -or (-not $YamlPath) -or (-not (Test-Path $YamlPath))) {
    $currentDir = Get-Location
    $possiblePaths = @(
        # Primary locations (absolute paths)
        (Join-Path $currentDir ".roo/custom_commands.yaml"),
        (Join-Path $currentDir "custom_commands.yaml"),
        (Join-Path $currentDir ".roo/commands/custom_commands.yaml"),

        # Alternative names
        (Join-Path $currentDir ".roo/commands.yaml"),
        (Join-Path $currentDir ".roo/config/commands.yaml"),

        # Backup locations
        (Join-Path $currentDir "config/custom_commands.yaml"),
        (Join-Path $currentDir "tools/commands.yaml")
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
        Write-Host "Current working directory: $currentDir" -ForegroundColor Yellow
        Write-Host "Please ensure .roo/custom_commands.yaml exists or specify the correct path."
        Write-Host ""
        Write-Host "Troubleshooting steps:" -ForegroundColor Cyan
        Write-Host "1. Verify .roo/custom_commands.yaml exists in your project root" -ForegroundColor White
        Write-Host "2. Check file permissions in the .roo directory" -ForegroundColor White
        Write-Host "3. Specify the full path manually if auto-detection fails" -ForegroundColor White
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

    # Ensure paths are absolute for reliability in fresh environments
    $filePath = [System.IO.Path]::GetFullPath($filePath)

    # Handle dry-run mode
    if ($DryRun) {
        $fullPath = [System.IO.Path]::GetFullPath($filePath)
        if (Test-Path $fullPath) {
            Write-Host "  ~ $commandName -> $fileName (would overwrite)" -ForegroundColor Yellow
        } else {
            Write-Host "  + $commandName -> $fileName (new file)" -ForegroundColor Green
        }
        $dryRunCount++
        continue
    }

    # Check if file exists and we're in no-overwrite mode
    $fullPath = [System.IO.Path]::GetFullPath($filePath)
    if (Test-Path $fullPath -and $NoOverwrite) {
        Write-Host "Skipping (exists): $commandName" -ForegroundColor Gray
        $skippedCount++
        continue
    }

    # Determine action type for feedback
    $action = "Generated"
    $color = "Green"
    if (Test-Path $fullPath) {
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
        # Ensure target directory exists (use absolute path)
        $absoluteTargetDir = [System.IO.Path]::GetFullPath($TargetDir)
        if (-not (Test-Path $absoluteTargetDir)) {
            New-Item -ItemType Directory -Path $absoluteTargetDir -Force | Out-Null
        }

        Set-Content -Path $fullPath -Value $markdownContent -Encoding UTF8 -ErrorAction Stop
        Write-Host "$action`: $commandName -> $fileName" -ForegroundColor $color
        $processedCount++
    } catch {
        Write-Warning "Failed to create file for command: $commandName"
        Write-Warning $_.Exception.Message
        Write-Host "  Path: $fullPath" -ForegroundColor Gray
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