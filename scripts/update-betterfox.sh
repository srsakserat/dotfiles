#!/bin/bash
PROFILE_DIR="$HOME/.config/mozilla/firefox/irvq0hta.betterfox"
TARGET_FILE="$(ls -d $PROFILE_DIR | head -n 1)/user.js"
REMOTE_URL="https://raw.githubusercontent.com/yokoffing/Betterfox/main/user.js"

TMP_FILE=$(mktemp)

if curl -sL "$REMOTE_URL" -o "$TMP_FILE"; then
  if ! cmp -s "$TMP_FILE" "$TARGET_FILE"; then
    cp "$TMP_FILE" "$TARGET_FILE"
    echo "BetterFox updated successfully."
  else
    echo "BetterFox is already up to date."
  fi
else
  echo "Failed to download BetterFox."
fi

rm "$TMP_FILE"
