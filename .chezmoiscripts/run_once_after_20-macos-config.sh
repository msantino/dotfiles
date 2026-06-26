#!/bin/bash

set -eufo pipefail

echo "⚙️  Applying macOS preferences…"

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

#################################################
# Dock                                          #
#################################################

# Set dock auto-hide
defaults write com.apple.dock autohide -int 1

# Set the icon size of Dock items to 44 pixels
defaults write com.apple.dock tilesize -int 44

# Set the icon magnification size of Dock items to 85 pixels
defaults write com.apple.dock largesize -int 85

# Enable magnification
defaults write com.apple.dock magnification -int 1

#################################################
# Safari & WebKit                               #
#################################################

# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Disable auto-correct
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false

# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

#################################################
# Keyboard                                      #
#################################################

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 2

#################################################
# Trackpad & Mouse                              #
#################################################
defaults write NSGlobalDomain com.apple.trackpad.forceClick -int 1
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 0.875

# Tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Three-finger drag
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# Scroll direction: traditional (NOT "natural")
defaults write "Apple Global Domain" com.apple.swipescrolldirection -bool false

#################################################
# Screenshots — hand the native hotkeys to CleanShot X (Setapp)
# Disable ⌘⇧3 (28), ⌃⌘⇧3 (29), ⌘⇧4 (30), ⌃⌘⇧4 (31), ⌘⇧5 (184)
#################################################
for hk in 28 29 30 31 184; do
  defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add "$hk" \
    "<dict><key>enabled</key><false/></dict>"
done

#################################################
# Terminal                                      #
#################################################

# General / New window with Pro profile
defaults write com.apple.Terminal "Startup Window Settings" -string Pro
defaults write com.apple.Terminal "Default Window Settings" -string Pro

###############################################################################
# Apply changes                                                               #
###############################################################################

# Reload the symbolic hotkeys so the screenshot changes take effect without logout
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u 2>/dev/null || true

for app in Dock Finder SystemUIServer; do
  killall "$app" >/dev/null 2>&1 || true
done

echo "✅  Done. A few changes (keyboard, screenshots) may require a logout/restart to fully apply."
