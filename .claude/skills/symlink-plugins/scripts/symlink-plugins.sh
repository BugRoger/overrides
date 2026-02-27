#!/bin/bash
# Symlink local plugins to Claude Code cache for instant development
# Run from any project root that has a .claude-plugin/marketplace.json

set -e

REPO_ROOT="$(pwd)"
MARKETPLACE="$REPO_ROOT/.claude-plugin/marketplace.json"

if [ ! -f "$MARKETPLACE" ]; then
    echo "Error: marketplace.json not found at $MARKETPLACE"
    echo "Run this script from a project root with .claude-plugin/marketplace.json"
    exit 1
fi

# Read marketplace name for cache directory
MARKETPLACE_NAME="$(jq -r '.name' "$MARKETPLACE")"
CACHE_DIR="$HOME/.claude/plugins/cache/$MARKETPLACE_NAME"

echo "Symlinking plugins to cache..."
echo ""

jq -r '.plugins[] | "\(.name) \(.version) \(.source)"' "$MARKETPLACE" | while read -r name version source; do
    local_path="$REPO_ROOT/${source#./}"
    cache_path="$CACHE_DIR/$name/$version"

    if [ ! -d "$local_path" ]; then
        echo "SKIP: $name - not found: $local_path"
        continue
    fi

    mkdir -p "$(dirname "$cache_path")"
    rm -rf "$cache_path"
    echo "ln -s \"$local_path\" \"$cache_path\""
    ln -s "$local_path" "$cache_path"
done

echo ""
echo "Done. Reload VSCode window to apply changes."
