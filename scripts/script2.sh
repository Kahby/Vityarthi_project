#!/bin/bash
# ============================================================
# Script 2: FOSS Package Inspector
# Author : Amritanshu Gupta | Reg No: 24BCE11114
# Course : Open Source Software Audit
# Purpose: Inspects one or more FOSS packages on the system —
#          checks installation status, version, location,
#          and displays a brief description from a built-in
#          knowledge base.
# ============================================================

# ─── ANSI Color Definitions ────────────────────────────────
readonly CLR_RESET='\033[0m'
readonly CLR_BOLD='\033[1m'
readonly CLR_CYAN='\033[1;36m'
readonly CLR_GREEN='\033[1;32m'
readonly CLR_RED='\033[1;31m'
readonly CLR_YELLOW='\033[1;33m'
readonly CLR_WHITE='\033[1;37m'
readonly CLR_DIM='\033[2m'

# ─── Package Knowledge Base (associative array) ───────────
declare -A PKG_DESCRIPTIONS=(
    [vlc]="VLC — free, open-source cross-platform multimedia player by VideoLAN"
    [git]="Git — distributed version control system for tracking source code changes"
    [nginx]="Nginx — high-performance HTTP server and reverse proxy"
    [python3]="Python 3 — general-purpose, high-level programming language"
    [docker]="Docker — platform for building and running containerized applications"
    [curl]="cURL — command-line tool for transferring data via various protocols"
    [vim]="Vim — highly configurable terminal-based text editor"
    [node]="Node.js — JavaScript runtime built on Chrome's V8 engine"
    [firefox]="Firefox — privacy-focused open-source web browser by Mozilla"
    [gcc]="GCC — GNU Compiler Collection for C, C++, and other languages"
)

declare -A PKG_LICENSES=(
    [vlc]="GPL v2"
    [git]="GPL v2"
    [nginx]="BSD-like (2-clause)"
    [python3]="PSF License"
    [docker]="Apache 2.0"
    [curl]="MIT / curl License"
    [vim]="Vim License (GPL-compatible)"
    [node]="MIT License"
    [firefox]="MPL 2.0"
    [gcc]="GPL v3+"
)

# ─── Default packages to inspect ──────────────────────────
DEFAULT_PACKAGES=("vlc" "git" "python3" "curl" "ffmpeg")

# ─── Helper Functions ─────────────────────────────────────

print_banner() {
    echo -e "${CLR_CYAN}"
    echo "╔══════════════════════════════════════════════════════╗"
    echo "║          FOSS PACKAGE INSPECTOR                     ║"
    echo "║            Audit Script 2 of 5                      ║"
    echo "╚══════════════════════════════════════════════════════╝"
    echo -e "${CLR_RESET}"
}

print_separator() {
    echo -e "${CLR_DIM}────────────────────────────────────────────────────────${CLR_RESET}"
}

# Inspects a single package: checks if it's installed, shows version,
# path, description, and license from the knowledge base.
# Args: $1 = command/package name
inspect_package() {
    local pkg="$1"
    local desc="${PKG_DESCRIPTIONS[$pkg]:-No description available}"
    local license="${PKG_LICENSES[$pkg]:-Unknown}"

    echo -e "\n  ${CLR_YELLOW}▸ Package: ${CLR_BOLD}${pkg}${CLR_RESET}"

    if command -v "$pkg" &>/dev/null; then
        local location version
        location=$(command -v "$pkg")
        version=$("$pkg" --version 2>/dev/null | head -n 1)

        echo -e "    ${CLR_GREEN}✔ Installed${CLR_RESET}"
        printf "    %-14s : %s\n" "Version"     "${version:-N/A}"
        printf "    %-14s : %s\n" "Location"    "$location"
        printf "    %-14s : %s\n" "Description" "$desc"
        printf "    %-14s : %s\n" "License"     "$license"
    else
        echo -e "    ${CLR_RED}✘ Not installed${CLR_RESET}"
        printf "    %-14s : %s\n" "Description" "$desc"
        printf "    %-14s : %s\n" "License"     "$license"
    fi
}

# ─── Summary Counters ─────────────────────────────────────
count_installed=0
count_missing=0

# Wraps inspect_package and keeps running totals.
inspect_and_tally() {
    local pkg="$1"
    inspect_package "$pkg"
    if command -v "$pkg" &>/dev/null; then
        (( count_installed++ ))
    else
        (( count_missing++ ))
    fi
}

# ─── Main ─────────────────────────────────────────────────

main() {
    print_banner

    # Use command-line args if provided, otherwise default list
    local packages=("${@}")
    if [ ${#packages[@]} -eq 0 ]; then
        packages=("${DEFAULT_PACKAGES[@]}")
    fi

    echo -e "  Inspecting ${CLR_BOLD}${#packages[@]}${CLR_RESET} package(s)…"
    print_separator

    for pkg in "${packages[@]}"; do
        inspect_and_tally "$pkg"
    done

    print_separator
    echo ""
    echo -e "  ${CLR_GREEN}Installed${CLR_RESET} : $count_installed"
    echo -e "  ${CLR_RED}Missing${CLR_RESET}   : $count_missing"
    echo -e "  ${CLR_WHITE}Total${CLR_RESET}     : ${#packages[@]}"
    echo ""
    print_separator
    echo -e "${CLR_DIM}  Audit completed at $(date '+%H:%M:%S %Z on %d %B %Y')${CLR_RESET}\n"
}

main "$@"
