#!/bin/bash

# This bash file is program to run on MacOS
# Keep the Mac awake
caffeinate -dimsu &

# Ensure terminal input mode is restored on exit
cleanup() {
  stty sane
  echo "Exiting script. Keys cleaned up."
  osascript -e 'tell application "System Events" to key up "w"'
  osascript -e 'tell application "System Events" to key up "s"'
}
trap cleanup EXIT

# Set terminal to raw mode to read keys
stty -echo -icanon time 0 min 0

# Activate Minecraft window by Java process name
osascript -e 'tell application "System Events" to set frontmost of first application process whose name contains "java" to true'
sleep 0.5

# Click "Back to Game" button if application cashed
/usr/local/bin/cliclick c:1300,628
/usr/local/bin/cliclick c:1300,628
sleep 2

SECONDS=0
MAX_SECONDS=10800  # Loop for 3 hours

while [ $SECONDS -lt $MAX_SECONDS ]
do
  # Simulate key presses for Minecraft
  osascript -e 'tell application "System Events" to key down "w"'
  sleep 5
  osascript -e 'tell application "System Events" to key up "w"'
  sleep 1

  osascript -e 'tell application "System Events" to key down "s"'
  sleep 5
  osascript -e 'tell application "System Events" to key up "s"'
  sleep 1

  osascript -e 'tell application "System Events" to key down " "'
  sleep 0.3
  osascript -e 'tell application "System Events" to key up " "'
done