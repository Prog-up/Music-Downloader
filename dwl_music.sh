#!/bin/bash

# Function to downloads music
dl_music() {
  yt-dlp -w -x --audio-format mp3 \
  -P ... \ # Folder for mp3 files
  ... # Youtube link
}

# Run the task in background and show loading window
dl_music &
DL_PID=$!

zenity --info \
    --title="Downloading music" \
    --text="Downloading in progress...\nPlease wait.\n\nTo stop dowloads, close the Terminal." \
    --width=200 \
    --timeout=1 &
ZENITY_PID=$!

# Clean up
wait $DL_PID
kill $ZENITY_PID 2>/dev/null

# Show completion message
zenity --info \
    --title="Complete" \
    --text="Music dowload finished." \
    --width=200
