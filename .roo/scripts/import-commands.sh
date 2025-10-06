#!/bin/bash
#
# Cross-platform wrapper for import-commands.ps1
# Detects OS and invokes appropriate shell with correct flags
#

set -e

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PS1_SCRIPT="$SCRIPT_DIR/import-commands.ps1"

# Function to detect OS and available shells
detect_shell() {
    case "$(uname -s)" in
        "Darwin"|"Linux")
            if command -v pwsh &> /dev/null; then
                echo "pwsh"
            elif command -v powershell &> /dev/null; then
                echo "powershell"
            else
                echo "ERROR: No PowerShell installation found"
                exit 1
            fi
            ;;
        "CYGWIN*"|"MINGW*"|"MSYS*")
            if command -v pwsh &> /dev/null; then
                echo "pwsh"
            elif command -v powershell &> /dev/null; then
                echo "powershell"
            else
                echo "ERROR: No PowerShell installation found"
                exit 1
            fi
            ;;
        *)
            echo "ERROR: Unsupported OS: $(uname -s)"
            exit 1
            ;;
    esac
}

# Detect appropriate shell
SHELL_CMD=$(detect_shell)

echo "Detected shell: $SHELL_CMD"
echo "PowerShell script: $PS1_SCRIPT"
echo "Working directory: $(pwd)"
echo "Arguments: $*"
echo

# Execute PowerShell script with appropriate flags
exec "$SHELL_CMD" -NoProfile -ExecutionPolicy Bypass -File "$PS1_SCRIPT" "$@"