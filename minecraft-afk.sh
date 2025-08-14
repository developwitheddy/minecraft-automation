#!/bin/bash

open -a "Minsecraft"
sleep 6

# Click "Close" button if application cashed
/usr/local/bin/cliclick c:1373,799
/usr/local/bin/cliclick c:1373,799
sleep 2

# Click "Play" button — adjust coords
/usr/local/bin/cliclick c:1371,960
sleep 30

# Click "Multiplayer" — adjust if needed
/usr/local/bin/cliclick c:1253,762
/usr/local/bin/cliclick c:1253,762
sleep 5

# Select "DonutSMP Service" — adjust if needed
/usr/local/bin/cliclick c:1233,653
/usr/local/bin/cliclick c:1233,653
sleep 2

# Click "Join Server" — adjust if needed
/usr/local/bin/cliclick c:1076,868
/usr/local/bin/cliclick c:1076,868
sleep 5

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

  osascript -e 'tell application "System Events" to key code 49'  # jump
  sleep 5
done

# Press Escape
osascript -e 'tell application "System Events" to key code 53'

# Click "Disconnect" — adjust if needed
/usr/local/bin/cliclick c:1285,826
/usr/local/bin/cliclick c:1285,826
sleep 2

# Click "Back" — adjust if needed
/usr/local/bin/cliclick c:1521,919
/usr/local/bin/cliclick c:1521,919
sleep 2

# Click "Quit Game" — adjust if needed
/usr/local/bin/cliclick c:1366,884
/usr/local/bin/cliclick c:1366,884
sleep 2

# Find Minecraft Java process by name
PID=$(pgrep -f 'net.minecraft.client.main.Main')

# Send SIGINT (soft quit)
if [ -n "$PID" ]; then
  echo "Quitting Minecraft cleanly using SIGINT..."
  kill -SIGINT "$PID"
else
  echo "Minecraft process not found."
fi
sleep 2

osascript -e 'quit app "MineCraft Launcher"'

# echo "AFK script completed after $SECONDS seconds."