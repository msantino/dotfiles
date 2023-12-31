#!/bin/bash

set -eufo pipefail

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

# Set the icon size of Dock items to 32 pixels
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
# Trackpad                                      #
#################################################
defaults write NSGlobalDomain com.apple.trackpad.forceClick -int 1
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 0.875
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1

defaults write "Apple Global Domain" com.apple.swipescrolldirection -bool false

#################################################
# Terminal                                      #
#################################################

# General / New window with Pro profile:
defaults write com.apple.Terminal "Startup Window Settings" -string Pro

# Profile: default Pro profile:
defaults write com.apple.Terminal "Default Window Settings" -string Pro


echo "Done. Note that some of these changes require a logout/restart to take effect."
