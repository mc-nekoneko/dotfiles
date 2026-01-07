#!/usr/bin/env bash

cd "$(dirname "$0")"
set -e

_INFO=$(printf "\e[1;32m>>\e[m")
_TASK=$(printf "\e[1;34m::\e[m")
_WARN=$(printf "\e[1;33m!!\e[m")
_ERROR=$(printf "\e[1;31m!!\e[m")

# macOS: Install GNU coreutils for gls
OS=$(bash "$(dirname "$0")/../.misc/get-osdist.sh" | head -1)
if [ "$OS" = "macos" ]; then
    echo "$_TASK Setup GNU coreutils (macOS)..."
    if ! command -v gls &> /dev/null; then
        if command -v brew &> /dev/null; then
            brew install coreutils
        else
            echo "$_WARN Homebrew not found. Please install coreutils manually: brew install coreutils"
        fi
    else
        echo "$_INFO gls already installed"
    fi
fi

echo "$_TASK Setup fzf..."
if [ ! -d ~/.fzf ]; then
    git clone https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all --no-bash --no-fish
fi

echo "$_TASK Setup zgenom..."
if [ ! -d ~/.zgenom ]; then
    git clone https://github.com/jandamm/zgenom.git ~/.zgenom
fi

echo "$_TASK Setup tpm..."
if [ ! -d ~/.tmux/plugins/tpm ]; then
    mkdir -p ~/.tmux/plugins/tpm
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "$_TASK Setup vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "$_TASK Executing: 'vim PlugClean & PlugInstall'"
# Disable ALE during plugin installation to prevent errors
vim --cmd 'let g:ale_enabled=0' -c 'PlugClean!' -c 'PlugInstall' -c 'qa!'
nvim --headless --cmd 'let g:ale_enabled=0' -c 'PlugClean!' -c 'PlugInstall' -c 'qa!'
echo "$_TASK Installed vim packages"

echo "$_TASK Installing LSP servers..."
# Install LSP servers for common languages
LSP_SERVERS=(
    "typescript-language-server"
    "gopls"
    "rust-analyzer"
    "vscode-html-language-server"
    "vscode-css-language-server"
)
for server in "${LSP_SERVERS[@]}"; do
    echo "$_INFO Installing LSP: $server"
    nvim --headless -c "LspInstallServer $server" -c 'qa!' 2>/dev/null || true
done
echo "$_TASK Installed LSP servers"

echo "$_INFO Operation success! starting zsh..."
exec zsh
