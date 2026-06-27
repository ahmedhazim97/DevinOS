#!/usr/bin/env bash
# DevinOS Auto-Installer for Mac/Linux
# Supports: Windsurf, Cursor, Claude Code
# Usage: curl -sL https://raw.githubusercontent.com/ahmedhazim97/DevinOS/main/install.sh | bash

set -e

REPO_URL="https://raw.githubusercontent.com/ahmedhazim97/DevinOS/main/.agents"
TMP_DIR="$(mktemp -d /tmp/devinos-install-XXXXXX)"
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

download() {
    local url="$1"
    local out="$2"
    curl -fsSL "$url" -o "$out" 2>/dev/null || wget -q "$url" -O "$out" 2>/dev/null || return 1
}

install_windsurf() {
    header "Installing for Windsurf"
    local base="$HOME/.codeium/windsurf"
    local memories="$base/memories"
    local skills_dir="$base/skills"
    mkdir -p "$memories" "$skills_dir"

    # Rules → global_rules.md
    local rules_file="$memories/global_rules.md"
    {
        echo "# DevinOS Global Rules"
        echo ""
        echo "> Source: https://github.com/ahmedhazim97/DevinOS"
        echo "> Date: $(date +%Y-%m-%d)"
        echo "> Total Rules: 21"
        echo ""
        echo "---"
        echo ""
    } > "$rules_file"

    local rules=(ai api architecture communication database debugging deployment documentation engineering git learning mcp memory monitoring performance planning quality review security testing ux)
    for r in "${rules[@]}"; do
        local tmp="$TMP_DIR/rules/$r.md"
        if download "$REPO_URL/rules/$r.md" "$tmp"; then
            cat "$tmp" >> "$rules_file"
            echo "" >> "$rules_file"
            echo "---" >> "$rules_file"
            echo "" >> "$rules_file"
            success "Rule: $r"
        else
            error "Failed: $r"
        fi
    done

    # Skills
    local skills=(ai-engineering api-design architecture backend ci-cd code-review database debugging docker documentation frontend git incident-response knowledge-distillation mcp performance planning quality-audit refactoring root-cause-analysis security testing verification)
    for s in "${skills[@]}"; do
        local dst="$skills_dir/$s"
        mkdir -p "$dst"
        local tmp="$TMP_DIR/skills/$s/SKILL.md"
        mkdir -p "$(dirname "$tmp")"
        if download "$REPO_URL/skills/$s/SKILL.md" "$tmp"; then
            cp "$tmp" "$dst/SKILL.md"
            local title
            title=$(head -1 "$tmp" | sed 's/# Skill: //')
            printf '{"name":"%s","displayName":"%s","description":"DevinOS skill: %s","version":"1.0.0","author":"ahmedhazim97","platforms":["windsurf"]}\n' "$s" "$title" "$title" > "$dst/skill.json"
            success "Skill: $s"
        else
            error "Failed: $s"
        fi
    done

    echo -e "${GREEN}\n🎉 Windsurf installation complete! Restart Windsurf to activate.${NC}"
}

install_cursor() {
    header "Installing for Cursor"
    local cursor_dir="$HOME/.cursor"
    local rules_dir="$cursor_dir/rules"
    local skills_dir="$cursor_dir/skills"

    # macOS alternative path
    if [[ "$OSTYPE" == "darwin"* ]]; then
        if [ -d "$HOME/Library/Application Support/Cursor" ]; then
            cursor_dir="$HOME/Library/Application Support/Cursor/User"
            rules_dir="$cursor_dir/rules"
            skills_dir="$cursor_dir/skills"
        fi
    fi

    mkdir -p "$rules_dir" "$skills_dir"

    local rules=(ai api architecture communication database debugging deployment documentation engineering git learning mcp memory monitoring performance planning quality review security testing ux)
    for r in "${rules[@]}"; do
        local tmp="$TMP_DIR/rules/$r.md"
        if download "$REPO_URL/rules/$r.md" "$tmp"; then
            cp "$tmp" "$rules_dir/$r.md"
            success "Rule: $r"
        else
            error "Failed: $r"
        fi
    done

    # Global .cursorrules
    {
        echo "# DevinOS Rules"
        echo ""
        echo "> Source: https://github.com/ahmedhazim97/DevinOS"
        echo ""
    } > "$HOME/.cursorrules"
    for r in "${rules[@]}"; do
        local tmp="$TMP_DIR/rules/$r.md"
        [ -f "$tmp" ] && cat "$tmp" >> "$HOME/.cursorrules" && echo "" >> "$HOME/.cursorrules" && echo "---" >> "$HOME/.cursorrules" && echo "" >> "$HOME/.cursorrules"
    done
    success "Global .cursorrules written"

    local skills=(ai-engineering api-design architecture backend ci-cd code-review database debugging docker documentation frontend git incident-response knowledge-distillation mcp performance planning quality-audit refactoring root-cause-analysis security testing verification)
    for s in "${skills[@]}"; do
        local dst="$skills_dir/$s"
        mkdir -p "$dst"
        local tmp="$TMP_DIR/skills/$s/SKILL.md"
        mkdir -p "$(dirname "$tmp")"
        if download "$REPO_URL/skills/$s/SKILL.md" "$tmp"; then
            cp "$tmp" "$dst/SKILL.md"
            success "Skill: $s"
        else
            error "Failed: $s"
        fi
    done

    echo -e "${GREEN}\n🎉 Cursor installation complete! Restart Cursor to activate.${NC}"
}

install_claude() {
    header "Installing for Claude Code"
    local base="$HOME/.claude"
    local skills_dir="$base/skills"
    mkdir -p "$skills_dir"

    local skills=(ai-engineering api-design architecture backend ci-cd code-review database debugging docker documentation frontend git incident-response knowledge-distillation mcp performance planning quality-audit refactoring root-cause-analysis security testing verification)
    for s in "${skills[@]}"; do
        local dst="$skills_dir/$s"
        mkdir -p "$dst"
        local tmp="$TMP_DIR/skills/$s/SKILL.md"
        mkdir -p "$(dirname "$tmp")"
        if download "$REPO_URL/skills/$s/SKILL.md" "$tmp"; then
            cp "$tmp" "$dst/SKILL.md"
            success "Skill: $s"
        else
            error "Failed: $s"
        fi
    done

    echo -e "${GREEN}\n🎉 Claude Code installation complete!${NC}"
}

install_local() {
    header "Installing locally (.agents/)"
    local agents_dir="./.agents"
    local rules_dir="$agents_dir/rules"
    local skills_dir="$agents_dir/skills"
    mkdir -p "$rules_dir" "$skills_dir"

    local rules=(ai api architecture communication database debugging deployment documentation engineering git learning mcp memory monitoring performance planning quality review security testing ux)
    for r in "${rules[@]}"; do
        if download "$REPO_URL/rules/$r.md" "$rules_dir/$r.md"; then
            success "Rule: $r"
        else
            error "Failed: $r"
        fi
    done

    local skills=(ai-engineering api-design architecture backend ci-cd code-review database debugging docker documentation frontend git incident-response knowledge-distillation mcp performance planning quality-audit refactoring root-cause-analysis security testing verification)
    for s in "${skills[@]}"; do
        local dst="$skills_dir/$s"
        mkdir -p "$dst"
        if download "$REPO_URL/skills/$s/SKILL.md" "$dst/SKILL.md"; then
            success "Skill: $s"
        else
            error "Failed: $s"
        fi
    done

    echo -e "${GREEN}\n🎉 Local .agents/ folder created! Devin will auto-discover it.${NC}"
}

# ========== MAIN ==========
header "DevinOS Installer"
info "Repo: ahmedhazim97/DevinOS"
info "Temp: $TMP_DIR"

mkdir -p "$TMP_DIR/rules" "$TMP_DIR/skills"

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
