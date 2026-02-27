---
name: symlink-plugins
description: Symlink local plugin directories to Claude Code cache for instant reload development. Use when developing plugins locally and want changes to reflect immediately after VSCode window reload.
---

# Symlink Plugins

Replace cached plugin versions with symlinks to local plugin directories. Edit plugins, reload VSCode window, done.

## Quick Start

Run the symlink script from the repo root:

```bash
./scripts/symlink-plugins.sh
```

Then reload VSCode window (`Cmd+Shift+P` → "Reload Window").

## How It Works

1. Parse `marketplace.json` for plugin names and versions
2. For each plugin, replace `~/.claude/plugins/cache/overrides/<name>/<version>/` with symlink to `plugins/<name>/`
3. Claude Code loads plugins from cache on startup

## Manual Execution

Run these commands from repo root:

```bash
REPO_ROOT="$(pwd)"
CACHE_DIR="$HOME/.claude/plugins/cache/overrides"

jq -r '.plugins[] | "\(.name) \(.version) \(.source)"' .claude-plugin/marketplace.json | while read -r name version source; do
    local_path="$REPO_ROOT/${source#./}"
    cache_path="$CACHE_DIR/$name/$version"

    mkdir -p "$(dirname "$cache_path")"
    rm -rf "$cache_path"
    ln -s "$local_path" "$cache_path"
    echo "OK: $name@$version"
done
```

## When to Re-run

- After adding new plugins to marketplace.json
- After bumping plugin versions
- After clearing plugin cache (`rm -rf ~/.claude/plugins/cache`)
