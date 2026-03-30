#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author : Amritanshu Gupta | Reg No: 24BCE11114
# Course : Open Source Software Audit
# Purpose: Audits key system directories — reports owner,
#          group, octal permissions, and disk usage in a
#          formatted table. Also checks the VS Code config.
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

# ─── Directories to Audit ─────────────────────────────────
AUDIT_DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

# ─── Helper Functions ─────────────────────────────────────

print_banner() {
    echo -e "${CLR_CYAN}"
    echo "╔══════════════════════════════════════════════════════╗"
    echo "║        DISK & PERMISSION AUDITOR                    ║"
    echo "║            Audit Script 3 of 5                      ║"
    echo "╚══════════════════════════════════════════════════════╝"
    echo -e "${CLR_RESET}"
}

print_separator() {
    echo -e "${CLR_DIM}────────────────────────────────────────────────────────${CLR_RESET}"
}

# Prints a formatted table header row.
print_table_header() {
    printf "  ${CLR_BOLD}${CLR_YELLOW}%-14s %-12s %-10s %-10s %-10s${CLR_RESET}\n" \
        "Directory" "Permissions" "Octal" "Owner" "Size"
    printf "  ${CLR_DIM}%-14s %-12s %-10s %-10s %-10s${CLR_RESET}\n" \
        "--------------" "------------" "----------" "----------" "----------"
}

# Audits a single directory using `stat` for precise permission parsing.
# Args: $1 = directory path
audit_directory() {
    local dir="$1"

    if [ ! -d "$dir" ]; then
        printf "  ${CLR_RED}%-14s %-12s${CLR_RESET}\n" "$dir" "[NOT FOUND]"
        return 1
    fi

    local perms_symbolic octal_perms owner size

    # Use stat for precise permission info (GNU coreutils syntax)
    perms_symbolic=$(stat -c '%A' "$dir" 2>/dev/null)
    octal_perms=$(stat -c '%a' "$dir" 2>/dev/null)
    owner=$(stat -c '%U:%G' "$dir" 2>/dev/null)
    size=$(du -sh "$dir" 2>/dev/null | cut -f1)

    printf "  ${CLR_WHITE}%-14s${CLR_RESET} %-12s %-10s %-10s %-10s\n" \
        "$dir" "${perms_symbolic:-N/A}" "${octal_perms:-N/A}" \
        "${owner:-N/A}" "${size:-N/A}"
}

# Checks VS Code configuration directory presence and details.
check_vscode_config() {
    local config_dir="$HOME/.config/vlc"

    echo -e "\n  ${CLR_YELLOW}▸ VLC Configuration Directory${CLR_RESET}\n"

    if [ -d "$config_dir" ]; then
        local perms octal owner size file_count
        perms=$(stat -c '%A' "$config_dir" 2>/dev/null)
        octal=$(stat -c '%a' "$config_dir" 2>/dev/null)
        owner=$(stat -c '%U:%G' "$config_dir" 2>/dev/null)
        size=$(du -sh "$config_dir" 2>/dev/null | cut -f1)
        file_count=$(find "$config_dir" -type f 2>/dev/null | wc -l)

        echo -e "    ${CLR_GREEN}✔ Found:${CLR_RESET} $config_dir"
        printf "    %-14s : %s\n" "Permissions" "$perms ($octal)"
        printf "    %-14s : %s\n" "Owner"       "$owner"
        printf "    %-14s : %s\n" "Size"        "$size"
        printf "    %-14s : %s\n" "Files"       "$file_count"
    else
        echo -e "    ${CLR_RED}✘ Not found:${CLR_RESET} $config_dir"
        echo -e "    ${CLR_DIM}VLC may not be installed, or uses a different config path.${CLR_RESET}"
    fi
}

# ─── Main ─────────────────────────────────────────────────

main() {
    print_banner
    echo -e "  ${CLR_YELLOW}▸ System Directory Audit${CLR_RESET}\n"
    print_table_header

    local ok_count=0
    local fail_count=0

    for dir in "${AUDIT_DIRS[@]}"; do
        if audit_directory "$dir"; then
            (( ok_count++ ))
        else
            (( fail_count++ ))
        fi
    done

    print_separator
    echo ""
    echo -e "  Audited : ${CLR_GREEN}${ok_count}${CLR_RESET} accessible  |  ${CLR_RED}${fail_count}${CLR_RESET} not found"

    check_vscode_config

    print_separator
    echo -e "${CLR_DIM}  Audit completed at $(date '+%H:%M:%S %Z on %d %B %Y')${CLR_RESET}\n"
}

main "$@"
