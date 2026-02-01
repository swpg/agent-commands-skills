#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="$HOME/.ai-config-backups/$(date +%Y%m%d_%H%M%S)"
BACKED_UP=false

backup_if_exists() {
    local target="$1"
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        mkdir -p "$BACKUP_DIR"
        echo "Backing up: $target → $BACKUP_DIR/"
        mv "$target" "$BACKUP_DIR/"
        BACKED_UP=true
    elif [ -L "$target" ]; then
        rm "$target"
    fi
}

# Create target directories
mkdir -p ~/.claude/commands
mkdir -p ~/.codex/skills

# Symlink global instructions to both locations
backup_if_exists ~/.claude/CLAUDE.md
ln -sf "$SCRIPT_DIR/instructions/global-instructions.md" ~/.claude/CLAUDE.md

backup_if_exists ~/.codex/AGENTS.md
ln -sf "$SCRIPT_DIR/instructions/global-instructions.md" ~/.codex/AGENTS.md

# Symlink commands to both locations
for cmd in "$SCRIPT_DIR/commands"/*; do
    [ -e "$cmd" ] || continue
    name=$(basename "$cmd")
    [ "$name" = ".gitkeep" ] && continue

    backup_if_exists ~/.claude/commands/"$name"
    ln -sf "$cmd" ~/.claude/commands/"$name"

    backup_if_exists ~/.codex/commands/"$name"
    mkdir -p ~/.codex/commands
    ln -sf "$cmd" ~/.codex/commands/"$name"
done

# Symlink skills to both locations
for skill in "$SCRIPT_DIR/skills"/*; do
    [ -e "$skill" ] || continue
    name=$(basename "$skill")
    [ "$name" = ".gitkeep" ] && continue

    backup_if_exists ~/.codex/skills/"$name"
    ln -sf "$skill" ~/.codex/skills/"$name"

    backup_if_exists ~/.claude/skills/"$name"
    mkdir -p ~/.claude/skills
    ln -sf "$skill" ~/.claude/skills/"$name"
done

echo "Setup complete!"
if [ "$BACKED_UP" = true ]; then
    echo "Backups saved to: $BACKUP_DIR"
fi
