#!/bin/bash

if [ "$(uname)" != "Darwin" ]; then
  echo "This script is only for macOS!"
  exit 1
fi

echo "Applying macOS settings..."

# Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Keyboard
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Scroll: Disable natural scrolling
defaults write -g com.apple.swipescrolldirection -bool false

# Dock
defaults write com.apple.dock tilesize -int 69
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock persistent-apps -array  # Remove all default app icons

# Photos: Prevent auto-launch when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Help Viewer: non-floating mode
defaults write com.apple.helpviewer DevMode -bool true

# Bluetooth: increase audio quality
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Restart affected apps
killall Dock &> /dev/null || true
killall Finder &> /dev/null || true

echo "Done! Some settings require a restart or re-login to take effect."
