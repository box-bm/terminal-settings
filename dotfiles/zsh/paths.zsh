typeset -U path

path=(
  $HOME/.config/flutter/bin
  $ANDROID_HOME/emulator
  $ANDROID_HOME/platform-tools
  $HOME/.local/bin
  /opt/homebrew/share/google-cloud-sdk/bin
  $path
)

export PATH
