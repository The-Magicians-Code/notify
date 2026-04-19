#!/bin/bash
# notify.sh
# Usage: ./notify.sh "your message here"
# Requires: NOTIFY_CONTACT set in ~/.zshrc as your Apple ID email

CONTACT="${NOTIFY_CONTACT}"
MESSAGE="${1:-Task complete}"

if [ -z "$CONTACT" ]; then
    echo "❌ NOTIFY_CONTACT not set. Add this to ~/.zshrc:" >&2
    echo '   export NOTIFY_CONTACT="your.actual@email.com"' >&2
    exit 1
fi

ESCAPED=$(echo "$MESSAGE" | sed 's/"/\\"/g')

osascript <<EOF
tell application "Messages"
    send "$ESCAPED" to buddy "$CONTACT" of (1st service whose service type = iMessage)
end tell
EOF

if [ $? -eq 0 ]; then
    echo "✅ Sent"
else
    echo "❌ Failed to send message" >&2
    exit 1
fi
