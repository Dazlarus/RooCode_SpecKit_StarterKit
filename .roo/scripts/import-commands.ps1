#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Import commands from YAML configuration into .md files
.DESCRIPTION
    Parses .roo/custom_commands.yaml and generates .md command files in .roo/commands/
.PARAMETER YamlPath
    Path to the YAML file containing command definitions (default: .roo/custom_commands.yaml)
.PARAMETER TargetDir
    Target directory for generated .md files (default: .roo/commands)
.PARAMETER NoOverwrite
    Skip overwriting existing files
#>

param(
    [string]$YamlPath = ".roo/custom_commands.yaml",
    [string]$TargetDir = ".roo/commands",
    [switch]$NoOverwrite
)

# Check if YAML file exists
if (-not (Test-Path $YamlPath)) {
    Write-Error "YAML file not found: $YamlPath"
    exit 1
}

# Create target directory if it doesn't exist
if (-not (Test-Path $TargetDir)) {
    New-Item -ItemType Directory -Path $TargetDir -Force
    Write-Host "Created target directory: $TargetDir"
}

# Read and parse YAML file
try {
    $yamlContent = Get-Content $YamlPath -Raw

    # Simple YAML parser for our specific structure
    $lines = $yamlContent -split "`n"
    $commands = @{ customCommands = @() }
    $currentCommand = $null
    $inCommandsSection = $false

    foreach ($line in $lines) {
        $trimmed = $line.Trim()

        # Skip empty lines and comments
        if (-not $trimmed -or $trimmed.StartsWith("#")) {
            continue
        }

        # Check if we've reached the customCommands section
        if ($trimmed -eq "customCommands:") {
            $inCommandsSection = $true
            continue
        }

        if ($inCommandsSection) {
            # Check if this line starts a new command (contains dash at start of actual content)
            if ($line -match "^\s*-\s+name:") {
                if ($currentCommand) {
                    $commands.customCommands += $currentCommand
                }
                $currentCommand = @{}

                # Parse the name from this line
                if ($line -match "name:\s*""([^""]+)""") {
                    $currentCommand.name = $matches[1]
                }
            }
            elseif ($currentCommand -and $line -match "^\s*command:\s*(.+)$") {
                $value = $matches[1] -replace '"', "" -replace "'", ""
                $currentCommand.command = $value
            }
            elseif ($currentCommand -and $line -match "^\s*description:\s*(.+)$") {
                $value = $matches[1] -replace '"', "" -replace "'", ""
                $currentCommand.description = $value
            }
        }
    }

    # Add the last command
    if ($currentCommand) {
        $commands.customCommands += $currentCommand
    }
}
catch {
    Write-Error "Failed to parse YAML file: $_"
    exit 1
}

if (-not $commands.customCommands) {
    Write-Warning "No 'customCommands' section found in YAML file"
    exit 0
}

$imported = 0
$skipped = 0
$errors = 0

foreach ($cmd in $commands.customCommands) {
    $commandName = $cmd.name
    $slashCommand = $cmd.command
    $description = $cmd.description

    if (-not $cmd.name -or -not $cmd.command -or -not $cmd.description) {
        Write-Warning "Skipping invalid command entry: $($cmd | ConvertTo-Json -Compress)"
        $errors++
        continue
    }

    # Extract command slug from slash command (first word after /)
    $commandSlug = $slashCommand -replace '^/', '' -split ' ' | Select-Object -First 1

    # Create filename from command slug
    $filename = "$TargetDir/$commandSlug.md"

    # Check if file exists and NoOverwrite is specified
    if ($NoOverwrite -and (Test-Path $filename)) {
        Write-Host "Skipping existing file: $filename"
        $skipped++
        continue
    }

    # Generate markdown content with frontmatter
    $frontmatter = @"
---
command: $commandSlug
description: $description
---

$commandName

**Usage**
`````
$slashCommand
`````
"@

    try {
        $frontmatter | Out-File -FilePath $filename -Encoding UTF8 -Force
        Write-Host "Generated: $filename"
        $imported++
    }
    catch {
        Write-Error "Failed to write file $filename`: $_"
        $errors++
    }
}

# Summary
Write-Host ""
Write-Host "Import Summary:" -ForegroundColor Green
Write-Host "  Imported: $imported files" -ForegroundColor White
if ($skipped -gt 0) {
    Write-Host "  Skipped: $skipped files" -ForegroundColor Yellow
}
if ($errors -gt 0) {
    Write-Host "  Errors: $errors" -ForegroundColor Red
}

exit 0