#!/bin/bash

# Keep the Mac awake
caffeinate -dimsu &

# This trap makes sure we release keys when the script exits (even with Ctrl+C)
cleanup() {
  echo "Cleaning up keys..."
  osascript -e 'tell application "System Events" to key up "w"'
  osascript -e 'tell application "System Events" to key up "s"'
}
trap cleanup EXIT

SECONDS=0
MAX_SECONDS=10800 s  # 3 hours

while [ $SECONDS -lt $MAX_SECONDS ]
do
  osascript -e 'tell application "System Events" to key down "w"'
  sleep 5
  osascript -e 'tell application "System Events" to key up "w"'
  sleep 1

  osascript -e 'tell application "System Events" to key down "s"'
  sleep 5
  osascript -e 'tell application "System Events" to key up "s"'
  sleep 1

  #osascript -e 'tell application "System Events" to key code 49'  # jump
  #sleep 5
done