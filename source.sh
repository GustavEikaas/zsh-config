#!/bin/bash

# Get the directory of the script
SCRIPT_DIR="$(dirname "$(realpath "$0")")"

source "$SCRIPT_DIR/git.sh"
source "$SCRIPT_DIR/gh.sh"
source "$SCRIPT_DIR/pnpm.sh"
source "$SCRIPT_DIR/dotnet.sh"

