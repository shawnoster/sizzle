#!/usr/bin/env bash
# ~/.dev/lib/help.sh - Central help system
#
# Provides unified help interface for all dev environment utilities

# Display central help menu with links to all module help commands
dev-help() {
  cat <<'EOF'
Developer Environment Utilities
================================

Welcome to your developer environment! This collection provides utilities
for AWS, Docker, Git, 1Password, and project management.

Module Help Commands:
---------------------

aws-help
  AWS CLI utilities including profile switching, SSO login, and identity.
  Commands: awsp, aws-whoami, aws-login

docker-help
  Docker utilities for container management and cleanup.
  Commands: dex, dlogs, dstop, drm, drmi, dprune, dprune-all

git-help
  Git shortcuts and utilities for branch management and workflows.
  Commands: gco, glog, gstash, gpr, gwip, gunwip, gclean, gsync

op-help
  1Password CLI utilities for secrets management.
  Commands: op-status, op-signin, op-load-env, op-clear-env

project-help
  Project navigation and build tool runners.
  Commands: bake, yak, poet, proj, serve

assistant-help
  Assistant launcher shortcuts.
  Commands: aya

Session Startup:
----------------

dev-up                   # Sign in, load secrets, verify environment
dev-commands             # List all available commands

Quick Reference:
----------------

Load secrets:
  op-load-env              # Load secrets from 1Password

Switch AWS profile:
  awsp                     # Interactive profile switcher

Docker shortcuts:
  dex                      # Exec into container
  dlogs                    # Tail container logs

Git shortcuts:
  gco                      # Checkout branch
  gwip                     # Quick WIP commit

Build tools:
  bake                     # Run Makefile targets (fuzzy)
  yak                      # Run npm scripts (fuzzy)
  poet                     # Run poetry scripts (fuzzy)
  aya                      # Jump to ~/guild and launch Claude

Configuration:
--------------

Location: ~/.dev/
Config:   ~/.dev/config/accounts.sh
Modules:  ~/.dev/lib/*.sh

Environment Variables:
  OP_ACCOUNT    - 1Password account shorthand
  AWS_PROFILE   - Default AWS profile
  PROJ_DIRS     - Project directories for 'proj' command
  DEV_VERBOSE   - Set to "1" for verbose loading messages

Getting Started:
----------------

1. Configure your accounts:
   Edit ~/.dev/config/accounts.sh

2. Run the startup command:
   dev-up

3. Explore individual modules:
   aws-help
   docker-help
   git-help
   op-help
   project-help
   assistant-help

For more details on any module, run its help command (e.g., 'aws-help').

EOF
}

# Alias for convenience
alias devhelp='dev-help'

# dev-commands: flat searchable list of all commands
dev-commands() {
  cat <<'EOF'
aws-help             Show AWS command help
aws-login [profile]  SSO login (fuzzy-selects if no profile given)
aws-whoami           Show current AWS profile, region, and identity
awsp                 Fuzzy-switch AWS profile
aya                  Jump to ~/guild and launch Claude
bake                 Fuzzy-select and run Makefile targets
dev-commands         This list
dev-help             Central help menu
dev-up               Session startup: sign in, load secrets, verify env
dex [shell]          Exec into running container
dlogs                Fuzzy-select container and tail logs
doctor / dr          Full environment health check
dprune               Safe Docker cleanup
dprune-all           Aggressive Docker cleanup (with volumes)
drm                  Fuzzy-select and remove containers
drmi                 Fuzzy-select and remove images
dstop                Fuzzy-select and stop containers
gclean [main]        Remove merged branches locally
gco                  Fuzzy checkout branch
glog                 Interactive git log with preview
gpr                  Create pull request via GitHub CLI
gstash               Fuzzy select and apply stash
gsync [main]         Sync fork with upstream
gunwip               Undo last WIP commit
gwip [msg]           Quick work-in-progress commit
op-clear-env         Clear all sensitive environment variables
op-help              Show 1Password command help
op-load-env          Load secrets from 1Password into env vars
op-signin [account]  Sign in to 1Password
op-status            Check 1Password sign-in status
poet                 Fuzzy-select and run poetry scripts
proj                 Fuzzy jump to project directory
serve [port]         Quick Python HTTP server (default: 8000)
yak                  Fuzzy-select and run npm scripts
EOF
}

assistant-help() {
  cat <<'EOF'
Assistant Launcher Utilities
============================

Available Commands:
-------------------

aya
  Jump to ~/guild and launch Claude CLI.
  Equivalent to: cd ~/guild && claude

Usage:
  aya

EOF
}
