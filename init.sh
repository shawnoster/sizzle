#!/usr/bin/env bash
# ~/.preflight/init.sh - Developer environment initialization
#
# Usage:
#   Source from .bashrc:  . "$HOME/.preflight/init.sh"
#   Or run standalone:    source ~/.preflight/init.sh

PREFLIGHT_DIR="${PREFLIGHT_DIR:-$HOME/.preflight}"

# Add bin/ to PATH so distributed scripts (light-remind, nanoleaf-*) are
# findable. Idempotent — safe to source multiple times.
case ":$PATH:" in
  *":$PREFLIGHT_DIR/bin:"*) ;;
  *) PATH="$PREFLIGHT_DIR/bin:$PATH" ;;
esac

# First-time setup: Copy templates if config files don't exist
if [[ ! -f "$PREFLIGHT_DIR/config/accounts.sh" ]] && [[ -f "$PREFLIGHT_DIR/config/accounts.sh.template" ]]; then
  echo "📋 Creating config/accounts.sh from template..."
  cp "$PREFLIGHT_DIR/config/accounts.sh.template" "$PREFLIGHT_DIR/config/accounts.sh"
  echo "✅ Created. Edit config/accounts.sh to customize your settings."
fi

if [[ ! -f "$PREFLIGHT_DIR/lib/1password.sh" ]] && [[ -f "$PREFLIGHT_DIR/lib/1password.sh.template" ]]; then
  echo "📋 Creating lib/1password.sh from template..."
  cp "$PREFLIGHT_DIR/lib/1password.sh.template" "$PREFLIGHT_DIR/lib/1password.sh"
  echo "✅ Created. Edit lib/1password.sh to customize your 1Password secrets."
fi

# Source all library scripts
for lib in "$PREFLIGHT_DIR/lib"/*.sh; do
  [[ -f "$lib" ]] && source "$lib"
done

# Source config (non-secret environment setup)
[[ -f "$PREFLIGHT_DIR/config/accounts.sh" ]] && source "$PREFLIGHT_DIR/config/accounts.sh"

# Optional: Print loaded status
if [[ "${PREFLIGHT_VERBOSE:-0}" == "1" ]]; then
  echo "✅ Developer environment loaded from $PREFLIGHT_DIR"
fi
