#!/bin/bash

# Description: Function to check if a variable is set
#
# Usage: include via `source ./util/validate_variables.sh`, call via `check_variable "user" "$1"`

check_variable() {
    local var_name=$1
    local var_value=$2

    if [[ -z "$var_value" ]]; then
        echo "Error: $var_name is not set or is empty. Please provide a valid value."
        exit 1
    fi
}
