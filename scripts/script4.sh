#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author : Amritanshu Gupta | Reg No: 24BCE11114
# Course : Open Source Software Audit
# Purpose: Analyzes a log file for keyword occurrences using
#          optimized grep-based counting. Provides summary
#          statistics and the most recent matching lines.
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

# ─── Configuration ────────────────────────────────────────
readonly MAX_WAIT_SECONDS=10   # maximum seconds to wait for a non-empty file
readonly TAIL_LINES=5          # number of matching lines to display

# ─── Helper Functions ─────────────────────────────────────

print_banner() {
    echo -e "${CLR_CYAN}"
    echo "╔══════════════════════════════════════════════════════╗"
    echo "║            LOG FILE ANALYZER                        ║"
    echo "║            Audit Script 4 of 5                      ║"
    echo "╚══════════════════════════════════════════════════════╝"
    echo -e "${CLR_RESET}"
}

print_separator() {
    echo -e "${CLR_DIM}────────────────────────────────────────────────────────${CLR_RESET}"
}

show_usage() {
    echo -e "  ${CLR_YELLOW}Usage:${CLR_RESET} $0 <logfile> [keyword]"
    echo -e "  ${CLR_DIM}Default keyword: \"error\"${CLR_RESET}"
    echo ""
    echo -e "  ${CLR_WHITE}Examples:${CLR_RESET}"
    echo "    $0 /var/log/syslog"
    echo "    $0 /var/log/syslog warning"
    echo ""
}

# Waits up to MAX_WAIT_SECONDS for the file to become non-empty.
# Returns 0 on success, 1 on timeout.
wait_for_content() {
    local file="$1"
    local waited=0

    while [ ! -s "$file" ]; do
        if [ "$waited" -ge "$MAX_WAIT_SECONDS" ]; then
            echo -e "  ${CLR_RED}✘ Timeout:${CLR_RESET} File remained empty after ${MAX_WAIT_SECONDS}s."
            return 1
        fi
        echo -e "  ${CLR_DIM}Waiting for content… (${waited}s / ${MAX_WAIT_SECONDS}s)${CLR_RESET}"
        sleep 2
        (( waited += 2 ))
    done
    return 0
}

# Analyzes the log file for the given keyword using grep.
# Args: $1 = file path, $2 = keyword
analyze_log() {
    local logfile="$1"
    local keyword="$2"

    # ── File Statistics ──
    local total_lines file_size
    total_lines=$(wc -l < "$logfile")
    file_size=$(du -h "$logfile" | cut -f1)

    echo -e "  ${CLR_YELLOW}▸ File Statistics${CLR_RESET}\n"
    printf "    %-16s : %s\n" "File"        "$logfile"
    printf "    %-16s : %s\n" "Size"        "$file_size"
    printf "    %-16s : %s\n" "Total Lines" "$total_lines"
    echo ""

    # ── Keyword Search (optimized with grep -c) ──
    local match_count
    match_count=$(grep -ic "$keyword" "$logfile")

    echo -e "  ${CLR_YELLOW}▸ Keyword Analysis${CLR_RESET}\n"
    printf "    %-16s : %s\n" "Keyword" "$keyword"
    printf "    %-16s : %s\n" "Occurrences" "$match_count"

    if [ "$total_lines" -gt 0 ]; then
        local percentage
        percentage=$(awk "BEGIN {printf \"%.2f\", ($match_count / $total_lines) * 100}")
        printf "    %-16s : %s%%\n" "Match Rate" "$percentage"
    fi

    echo ""
    print_separator

    # ── Display Last N Matches ──
    if [ "$match_count" -gt 0 ]; then
        echo -e "\n  ${CLR_YELLOW}▸ Last ${TAIL_LINES} Matching Lines${CLR_RESET}\n"
        grep -in "$keyword" "$logfile" | tail -n "$TAIL_LINES" | while IFS= read -r line; do
            echo -e "    ${CLR_DIM}${line}${CLR_RESET}"
        done
        echo ""
    else
        echo -e "\n  ${CLR_DIM}No lines matched the keyword \"${keyword}\".${CLR_RESET}\n"
    fi

    # ── Top-Level Summary (extra: most common log levels) ──
    echo -e "  ${CLR_YELLOW}▸ Log Level Summary${CLR_RESET}\n"
    for level in ERROR WARNING INFO DEBUG NOTICE; do
        local cnt
        cnt=$(grep -ic "$level" "$logfile" 2>/dev/null || echo 0)
        printf "    %-10s : %s\n" "$level" "$cnt"
    done
    echo ""
}

# ─── Main ─────────────────────────────────────────────────

main() {
    print_banner

    local logfile="${1}"
    local keyword="${2:-error}"

    # Validate input
    if [ -z "$logfile" ]; then
        show_usage
        exit 1
    fi

    if [ ! -f "$logfile" ]; then
        echo -e "  ${CLR_RED}✘ Error:${CLR_RESET} File not found — ${logfile}"
        echo ""
        exit 1
    fi

    # Wait for content if file is empty
    if [ ! -s "$logfile" ]; then
        wait_for_content "$logfile" || exit 1
    fi

    analyze_log "$logfile" "$keyword"

    print_separator
    echo -e "${CLR_DIM}  Analysis completed at $(date '+%H:%M:%S %Z on %d %B %Y')${CLR_RESET}\n"
}

main "$@"
