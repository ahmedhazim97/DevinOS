#!/usr/bin/env bash
# DevinOS Auto-Installer for Mac/Linux
# Supports: Windsurf, Cursor, Claude Code
# Usage: curl -sL https://raw.githubusercontent.com/Devin-IQ/DevinOS/main/install.sh | bash

set -e

REPO="Devin-IQ/DevinOS"
REPO_URL="https://github.com/$REPO"
ARCHIVE_URL="https://github.com/$REPO/archive/refs/heads/main.tar.gz"
TMP_DIR="$(mktemp -d /tmp/devinos-install-XXXXXX)"
AGENTS_SOURCE=""
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

header() {
    echo -e "${CYAN}\n========================================"
    echo -e "  $1"
    echo -e "========================================${NC}"
}

success() { echo -e "${GREEN}  ✓ $1${NC}"; }
info()    { echo -e "${YELLOW}  → $1${NC}"; }
error()   { echo -e "${RED}  ✗ $1${NC}"; }

rules() {
    echo ai api architecture communication database debugging deployment documentation engineering git learning mcp memory monitoring performance planning quality review security testing ux
}

skills() {
    echo ai-engineering api-design architecture backend ci-cd code-review database debugging docker documentation frontend git incident-response knowledge-distillation mcp performance planning quality-audit refactoring root-cause-analysis scrollytelling security testing verification ui-ux-pro-max design-resources-library
}

prepare_agents() {
    local archive="$TMP_DIR/devinos.tar.gz"
    info "Downloading $REPO"
    curl -fsSL "$ARCHIVE_URL" -o "$archive" 2>/dev/null || wget -q "$ARCHIVE_URL" -O "$archive"
    tar -xzf "$archive" -C "$TMP_DIR"
    local root
    root="$(find "$TMP_DIR" -maxdepth 1 -type d -name 'DevinOS-*' | head -n 1)"
    if [ -z "$root" ]; then
        error "Failed to locate extracted DevinOS archive"
        exit 1
    fi
    AGENTS_SOURCE="$root/.agents"
    if [ ! -d "$AGENTS_SOURCE" ]; then
        error "Archive does not contain .agents"
        exit 1
    fi
}

copy_skill() {
    local skill="$1"
    local skills_dir="$2"
    local src="$AGENTS_SOURCE/skills/$skill"
    local dst="$skills_dir/$skill"
    if [ ! -d "$src" ]; then
        error "Missing skill: $skill"
        return
    fi
    rm -rf "$dst"
    cp -R "$src" "$dst"
    if [ -f "$dst/SKILL.md" ] && [ ! -f "$dst/skill.json" ]; then
        local description
        description="$(grep -m 1 '^description:' "$dst/SKILL.md" | sed 's/^description:[[:space:]]*//' | sed 's/^"//' | sed 's/"$//')"
        [ -z "$description" ] && description="DevinOS skill: $skill"
        printf '{"name":"%s","displayName":"%s","description":"%s","version":"1.0.0","author":"Devin-IQ","platforms":["windsurf"]}\n' "$skill" "$skill" "$description" > "$dst/skill.json"
    fi
    success "Skill: $skill"
}

install_windsurf() {
    header "Installing for Windsurf"
    local base="$HOME/.codeium/windsurf"
    local memories="$base/memories"
    local rules_dir="$base/rules"
    local skills_dir="$base/skills"
    mkdir -p "$memories" "$rules_dir" "$skills_dir"

    local rules_file="$memories/global_rules.md"
    {
        echo "# DevinOS Global Rules"
        echo ""
        echo "> Source: $REPO_URL"
        echo "> Date: $(date +%Y-%m-%d)"
        echo "> Total Rules: 21"
        echo ""
        echo "---"
        echo ""
    } > "$rules_file"

    for r in $(rules); do
        local src="$AGENTS_SOURCE/rules/$r.md"
        if [ -f "$src" ]; then
            cp "$src" "$rules_dir/$r.md"
            cat "$src" >> "$rules_file"
            echo "" >> "$rules_file"
            echo "---" >> "$rules_file"
            echo "" >> "$rules_file"
            success "Rule: $r"
        else
            error "Missing rule: $r"
        fi
    done

    for s in $(skills); do copy_skill "$s" "$skills_dir"; done
    echo -e "${GREEN}\n🎉 Windsurf installation complete! Restart Windsurf to activate.${NC}"
}

install_cursor() {
    header "Installing for Cursor"
    local cursor_dir="$HOME/.cursor"
    local rules_dir="$cursor_dir/rules"
    local skills_dir="$cursor_dir/skills"

    if [[ "$OSTYPE" == "darwin"* ]] && [ -d "$HOME/Library/Application Support/Cursor" ]; then
        cursor_dir="$HOME/Library/Application Support/Cursor/User"
        rules_dir="$cursor_dir/rules"
        skills_dir="$cursor_dir/skills"
    fi

    mkdir -p "$rules_dir" "$skills_dir"
    {
        echo "# DevinOS Rules"
        echo ""
        echo "> Source: $REPO_URL"
        echo ""
    } > "$HOME/.cursorrules"

    for r in $(rules); do
        local src="$AGENTS_SOURCE/rules/$r.md"
        if [ -f "$src" ]; then
            cp "$src" "$rules_dir/$r.md"
            cat "$src" >> "$HOME/.cursorrules"
            echo "" >> "$HOME/.cursorrules"
            echo "---" >> "$HOME/.cursorrules"
            echo "" >> "$HOME/.cursorrules"
            success "Rule: $r"
        else
            error "Missing rule: $r"
        fi
    done

    for s in $(skills); do copy_skill "$s" "$skills_dir"; done
    echo -e "${GREEN}\n🎉 Cursor installation complete! Restart Cursor to activate.${NC}"
}

install_claude() {
    header "Installing for Claude Code"
    local skills_dir="$HOME/.claude/skills"
    mkdir -p "$skills_dir"
    for s in $(skills); do copy_skill "$s" "$skills_dir"; done
    echo -e "${GREEN}\n🎉 Claude Code installation complete!${NC}"
}

install_local() {
    header "Installing locally (.agents/)"
    local agents_dir="./.agents"
    mkdir -p "$agents_dir"
    cp -R "$AGENTS_SOURCE/rules" "$agents_dir/"
    cp -R "$AGENTS_SOURCE/skills" "$agents_dir/"
    echo -e "${GREEN}\n🎉 Local .agents/ folder created! Devin will auto-discover it.${NC}"
}

header "DevinOS Installer"
info "Repo: $REPO"
info "Temp: $TMP_DIR"
prepare_agents

HAS_WINDSURF=0
HAS_CURSOR=0
HAS_CLAUDE=0

[ -d "$HOME/.codeium/windsurf" ] && HAS_WINDSURF=1
[ -d "$HOME/.cursor" ] && HAS_CURSOR=1
if [[ "$OSTYPE" == "darwin"* ]]; then
    [ -d "$HOME/Library/Application Support/Cursor" ] && HAS_CURSOR=1
fi
[ -d "$HOME/.claude" ] && HAS_CLAUDE=1

[ "$HAS_WINDSURF" -eq 1 ] && install_windsurf
[ "$HAS_CURSOR" -eq 1 ] && install_cursor
[ "$HAS_CLAUDE" -eq 1 ] && install_claude

if [ "$HAS_WINDSURF" -eq 0 ] && [ "$HAS_CURSOR" -eq 0 ] && [ "$HAS_CLAUDE" -eq 0 ]; then
    info "No supported IDE detected. Falling back to local install."
    install_local
fi

rm -rf "$TMP_DIR"
echo -e "${GREEN}\n✅ Done!${NC}"

