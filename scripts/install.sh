#!/usr/bin/env bash
set -euo pipefail

REPO_URL="${REPO_URL:-https://github.com/raquezha/nvim-config.git}"
TARGET_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
BACKUP_DIR="${TARGET_DIR}.bak.${TIMESTAMP}"

need() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "error: missing required command: $1" >&2
    exit 1
  fi
}

need git

mkdir -p "$(dirname "$TARGET_DIR")"

if [ -e "$TARGET_DIR" ] || [ -L "$TARGET_DIR" ]; then
  echo "Backing up existing config: $TARGET_DIR -> $BACKUP_DIR"
  mv "$TARGET_DIR" "$BACKUP_DIR"
fi

echo "Cloning $REPO_URL -> $TARGET_DIR"
git clone --depth=1 "$REPO_URL" "$TARGET_DIR"

echo
echo "Installed Neovim config to: $TARGET_DIR"
echo "Next step:"
echo "  nvim"
echo

echo "Recommended packages:"
echo "  neovim git ripgrep lazygit curl tar base-devel tree-sitter-cli"

echo
if ! command -v nvim >/dev/null 2>&1; then
  echo "warning: neovim is not installed"
fi
if ! command -v rg >/dev/null 2>&1; then
  echo "warning: ripgrep is not installed (Telescope live_grep needs it)"
fi
if ! command -v lazygit >/dev/null 2>&1; then
  echo "warning: lazygit is not installed (<leader>lg needs it)"
fi
if ! command -v tree-sitter >/dev/null 2>&1; then
  echo "warning: tree-sitter CLI is not installed (parser installs/updates need it)"
fi
if ! command -v cc >/dev/null 2>&1 && ! command -v gcc >/dev/null 2>&1 && ! command -v clang >/dev/null 2>&1; then
  echo "warning: no C compiler found (Treesitter parser builds need one)"
fi
