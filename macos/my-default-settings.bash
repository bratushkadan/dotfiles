#!/usr/bin/env zsh

# Get settings example:
# defaults read -g com.apple.trackpad.scaling

### Trackpad
# Set the trackpad sensibility
defaults write -g com.apple.trackpad.scaling -float 1.0
# Disable the desktop swipe navigation (Trackpad > More Gestures > Swipe Between Pages -> Off)
defaults write -g AppleEnableSwipeNavigateWithScrolls -bool false

### Mouse
# Increase the mouse sensibility
defaults read -g com.apple.mouse.scaling

### Keyboard
# Increase the repeat speed
defaults write -g KeyRepeat -int 2
# Decrease the delay before repeat
defaults write -g InitialKeyRepeat -int 15
# Fn key opens emoji bar
defaults write com.apple.HIToolbox AppleFnUsageType -int 2
# Auto-repeat key press enable
defaults write -g ApplePressAndHoldEnabled -bool false
