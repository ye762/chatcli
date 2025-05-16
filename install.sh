#!/bin/bash

VENV_DIR="~/.chatcli"

echo "Creating dirrectory at $VENV_DIR ..."
mkdir -p $VENV_DIR

echo "Creating virtual environment in ./$VENV_DIR ..."
python3 -m venv "$VENV_DIR"

echo "Activating virtual environment..."
source "$VENV_DIR/bin/activate"

echo "Installing requirements..."
pip install --upgrade pip
pip install -r requirements.txt

echo "Setting up shell-gpt config (if not already present)..."
if [ ! -f ~/.config/shell_gpt/.sgptrc ]; then
    mkdir -p ~/.config/shell_gpt
    echo 'OPENAI_API_KEY="your-api-key-here"' > ~/.config/shell_gpt/.sgptrc
    echo "🔑 Please update your API key in ~/.config/shell_gpt/.sgptrc"
else
    echo "Config already exists at ~/.config/shell_gpt/.sgptrc"
fi

echo "✅ Done. To activate the environment later, run:"
echo "source $VENV_DIR/bin/activate"
