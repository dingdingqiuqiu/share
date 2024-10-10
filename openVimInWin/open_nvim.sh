#!/bin/bash
FILE="$1"
BASENAME=$(basename "$FILE" | cut -d. -f1)  # 获取不带后缀的文件名
TIMESTAMP=$(date +%s)  # 获取当前时间戳
SESSION_NAME="${BASENAME}_${TIMESTAMP}"
cd "$(dirname "$FILE")"
tmux new-session -d -s "$SESSION_NAME" "nvim \"$FILE\"" && tmux attach -t "$SESSION_NAME"
exec zsh

