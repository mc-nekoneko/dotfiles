#!/usr/bin/env bash

set -e

_INFO=$(printf "\e[1;32m>>\e[m")
_TASK=$(printf "\e[1;34m::\e[m")

# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
    echo "$_TASK Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add brew to PATH (persistent + current session)
    if [ -x /opt/homebrew/bin/brew ]; then
        echo >> "$HOME/.zprofile"
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [ -x /usr/local/bin/brew ]; then
        echo >> "$HOME/.zprofile"
        echo 'eval "$(/usr/local/bin/brew shellenv)"' >> "$HOME/.zprofile"
        eval "$(/usr/local/bin/brew shellenv)"
    fi
else
    echo "$_INFO Homebrew already installed"
fi

# Install packages via Brewfile
echo "$_TASK Installing packages via Brewfile..."
brew bundle --file="$(dirname "$0")/../Brewfile"
