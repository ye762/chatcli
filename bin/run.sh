#!/bin/bash

VENV_DIR="chatcli"

# Activate the virtual environment
source "$VENV_DIR/bin/activate"

# Read oapi key from secret file
function read_oapi_key() {
    cat ./secret/chatcli-0
}

export OPENAI_API_KEY=$(read_oapi_key)

# Check if OPENAI_API_KEY is set
if [ -z "$OPENAI_API_KEY" ]; then
    CONFIG_FILE="$HOME/.config/shell_gpt/.sgptrc"
    if [ -f "$CONFIG_FILE" ]; then
        echo "Loading API key from $CONFIG_FILE"
        source "$CONFIG_FILE"
    fi

    if [ -z "$OPENAI_API_KEY" ]; then
        echo "❌ OPENAI_API_KEY is not set."
        echo "Please export it or set it in ~/.config/shell_gpt/.sgptrc"
        exit 1
    fi
fi

# Run the ChatGPT CLI script
python chatcli.py
