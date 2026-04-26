#!/bin/bash
# Reset DESIGN-OPS configuration for fresh setup testing
# Run this script, then use /design-ops:setup to test the wizard

set -e

echo "╔═══════════════════════════════════════════════════════════╗"
echo "║           DESIGN-OPS Configuration Reset                  ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo ""

CONFIG_FILE="$HOME/.claude/design-ops-config.yaml"
BACKUP_DIR="$HOME/.claude/backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Create backup directory if needed
mkdir -p "$BACKUP_DIR"

# Check if config exists
if [ -f "$CONFIG_FILE" ]; then
    echo "Found existing config at: $CONFIG_FILE"

    # Create timestamped backup
    BACKUP_FILE="$BACKUP_DIR/design-ops-config_$TIMESTAMP.yaml"
    cp "$CONFIG_FILE" "$BACKUP_FILE"
    echo "✓ Backed up to: $BACKUP_FILE"

    # Remove the config
    rm "$CONFIG_FILE"
    echo "✓ Removed config file"
else
    echo "No existing config found at: $CONFIG_FILE"
fi

# Also check for legacy config
LEGACY_FILE="$HOME/.claude/team-pulse-config.yaml"
if [ -f "$LEGACY_FILE" ]; then
    LEGACY_BACKUP="$BACKUP_DIR/team-pulse-config_$TIMESTAMP.yaml"
    cp "$LEGACY_FILE" "$LEGACY_BACKUP"
    echo "✓ Backed up legacy config to: $LEGACY_BACKUP"
    rm "$LEGACY_FILE"
    echo "✓ Removed legacy config"
fi

echo ""
echo "╔═══════════════════════════════════════════════════════════╗"
echo "║                    Reset Complete                         ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo ""
echo "Next steps:"
echo "  1. Open Claude Code"
echo "  2. Run: /design-ops:setup"
echo "  3. Walk through the wizard to test the new UX"
echo ""
echo "Your backups are in: $BACKUP_DIR"
echo ""
