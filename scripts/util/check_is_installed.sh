#!/bin/bash

# Description: Check if a program is installed
#
# Variables
#  program_name  Name of program to check
#
# Example: ./check_is_installed.sh <program_name>

PROGRAM_NAME="$1"

if [[ -z "$PROGRAM_NAME" ]]; then
  echo "Usage: $0 <program_name>"
  exit 1
fi

if which "$PROGRAM_NAME" &>/dev/null; then
  echo "$PROGRAM_NAME is already installed."
  exit 0
else
  echo "$PROGRAM_NAME is not installed."
  exit 1
fi
