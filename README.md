# overrides

Unsanctioned skills, agentic exploits, and logic overrides for Claude Code. System: Compromised. Efficiency: Maximum.

## Setup Guide (with Auto-Updates)

This marketplace works with **Claude Code CLI** and the **Claude Code VSCode extension**. **Auto-updating is fully supported** — plugins update automatically at startup when new versions are published.

### Quick Install with Auto-Updates

**Step 1: Add the marketplace**
```shell
/plugin marketplace add bugroger/overrides
```

**Step 2: Install plugins**
```shell
/plugin install dev-workflow@overrides
/plugin install dev-skills@overrides
/plugin install commons@overrides
```

**Step 3: Enable auto-updates**
```shell
/plugin
```
1. Go to the **Marketplaces** tab
2. Select `overrides`
3. Choose **Enable auto-update**

That's it! Plugins will now auto-update at every Claude Code startup.

### Team Setup (Auto-Updates Included)

For teams, configure `.claude/settings.json` in your project root. This ensures everyone gets the marketplace **and** auto-updates:

```json
{
  "extraKnownMarketplaces": {
    "overrides": {
      "source": {
        "source": "github",
        "repo": "bugroger/overrides"
      }
    }
  },
  "enabledPlugins": {
    "dev-workflow@overrides": true,
    "dev-skills@overrides": true,
    "commons@overrides": true
  }
}
```

When team members trust the project folder, Claude Code automatically:
1. Prompts them to add the marketplace
2. Enables the specified plugins
3. Auto-updates on every startup (if enabled in their Marketplaces tab)

### How Auto-Updates Work

- **At startup**: Claude Code checks GitHub for new versions of `marketplace.json`
- **Version detection**: Compares plugin versions in manifest against installed cache
- **Notification**: If updates were applied, you'll see a restart suggestion
- **Manual refresh**: Run `/plugin marketplace update overrides` anytime

**Environment variables:**
```bash
# Keep plugin auto-updates while disabling Claude Code updates
export DISABLE_AUTOUPDATER=true
export FORCE_AUTOUPDATE_PLUGINS=true

# Disable ALL auto-updates (not recommended)
export DISABLE_AUTOUPDATER=true
```

### VSCode-Specific Setup

The Claude Code VSCode extension shares the same configuration as the CLI. Both use:
- `~/.claude/settings.json` — user-level settings (applies everywhere)
- `.claude/settings.json` — project-level settings (committed to git, shared with team)
- `.claude/settings.local.json` — local overrides (gitignored, personal only)

**For VSCode users:** The `/plugin` commands work identically whether you're in:
- The Claude Code terminal panel
- The integrated terminal running `claude`
- The Claude Code chat interface

### VSCode Local Development (with Auto-Updates)

The CLI supports `--plugin-dir` for testing local plugins, but this flag isn't available in VSCode. Use this workaround instead — **it fully supports auto-updates**:

**Add your local clone as a marketplace:**
```shell
# Clone the repo locally
git clone https://github.com/bugroger/overrides.git ~/Code/overrides

# Add the local path as a marketplace
/plugin marketplace add ~/Code/overrides
```

**Enable auto-updates for local marketplace:**
1. Run `/plugin` → **Marketplaces** tab
2. Select your local marketplace
3. Choose **Enable auto-update**

**How auto-updates work with local paths:**
- Claude Code monitors the local `marketplace.json` for version changes
- When you `git pull` new changes, the next startup detects updated versions
- Plugins are re-cached automatically from your local directory

**Or use the GUI:**
1. Run `/plugin` to open the plugin manager
2. Go to the **Marketplaces** tab
3. Enter your local path (e.g., `/Users/you/Code/overrides`)
4. Click the refresh icon to load plugins
5. **Enable auto-update** for the marketplace
6. Switch to **Discover** tab and install plugins

**Development workflow:**
```shell
# Pull latest changes
cd ~/Code/overrides && git pull

# Restart Claude Code — auto-update kicks in
# Or manually refresh
/plugin marketplace update overrides
```

### Pin to a Specific Version

For stability, pin to a branch, tag, or commit:

```json
{
  "extraKnownMarketplaces": {
    "overrides": {
      "source": {
        "source": "github",
        "repo": "bugroger/overrides",
        "ref": "main"
      }
    }
  }
}
```

Or pin to an exact commit SHA:
```json
{
  "source": {
    "source": "github",
    "repo": "bugroger/overrides",
    "sha": "a1b2c3d4e5f6789..."
  }
}
```

## Available Plugins

| Plugin | Description |
|--------|-------------|
| `dev-workflow` | Session retrospective for self-improvement |
| `dev-workflow-2bd` | Development workflow skills for 2bd |
| `dev-skills` | Development tools and utilities |
| `dev-skills-superpowers` | Superpowers-based development skills |
| `commons` | Common skills for writing and communication |

## Troubleshooting

**Plugin commands not recognized?**
- Check version: `claude --version` (requires 1.0.33+)
- Update: `brew upgrade claude-code` or `npm update -g @anthropic-ai/claude-code`

**Marketplace not loading?**
- Verify the repo is accessible
- Check for `.claude-plugin/marketplace.json` at the repo root
- Run `/plugin marketplace update overrides` to refresh

**Auto-updates not working?**
- Ensure auto-update is enabled in `/plugin` → **Marketplaces** tab
- For private repos, set `GITHUB_TOKEN` in your environment
- Check that `DISABLE_AUTOUPDATER` is not set

**Clear plugin cache:**
```bash
rm -rf ~/.claude/plugins/cache
```
Then restart Claude Code and reinstall plugins.

## References

- [Claude Code Plugin Documentation](https://code.claude.com/docs/en/plugins)
- [Discover and Install Plugins](https://code.claude.com/docs/en/discover-plugins)
- [Create Plugin Marketplaces](https://code.claude.com/docs/en/plugin-marketplaces)
