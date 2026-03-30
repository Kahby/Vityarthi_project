#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Author : Amritanshu Gupta | Reg No: 24BCE11114
# Course : Open Source Software Audit
# Purpose: Gathers and displays host system identity info
#          including kernel, distro, uptime, and architecture.
# ============================================================

# ─── ANSI Color Definitions ────────────────────────────────
readonly CLR_RESET='\033[0m'
readonly CLR_BOLD='\033[1m'
readonly CLR_CYAN='\033[1;36m'
readonly CLR_GREEN='\033[1;32m'
readonly CLR_YELLOW='\033[1;33m'
readonly CLR_MAGENTA='\033[1;35m'
readonly CLR_WHITE='\033[1;37m'
readonly CLR_DIM='\033[2m'

# ─── Configuration ─────────────────────────────────────────
readonly STUDENT_NAME="Amritanshu Gupta"
readonly REG_NO="24BCE11114"
readonly SOFTWARE_CHOICE="VLC Media Player"

# ─── Helper Functions ──────────────────────────────────────

print_banner() {
    echo -e "${CLR_CYAN}"
    echo "╔══════════════════════════════════════════════════════╗"
    echo "║        OPEN SOURCE SOFTWARE — SYSTEM IDENTITY       ║"
    echo "║            Audit Script 1 of 5                      ║"
    echo "╚══════════════════════════════════════════════════════╝"
    echo -e "${CLR_RESET}"
}

print_separator() {
    echo -e "${CLR_DIM}────────────────────────────────────────────────────────${CLR_RESET}"
}

# Prints a labeled key-value line with consistent formatting.
# Args: $1 = label, $2 = value
print_field() {
    local label="$1"
    local value="$2"
    printf "  ${CLR_GREEN}%-20s${CLR_RESET} : ${CLR_WHITE}%s${CLR_RESET}\n" "$label" "$value"
}

# ─── Data-Collection Functions ─────────────────────────────

get_distro_name() {
    # Prefer /etc/os-release (works on most modern distros)
    if [ -f /etc/os-release ]; then
        source /etc/os-release 2>/dev/null
        echo "${PRETTY_NAME:-Unknown}"
    elif command -v lsb_release &>/dev/null; then
        lsb_release -d 2>/dev/null | cut -f2
    else
        echo "Unknown distribution"
    fi
}

get_cpu_info() {
    local model
    model=$(grep -m1 'model name' /proc/cpuinfo 2>/dev/null | cut -d':' -f2 | xargs)
    echo "${model:-N/A}"
}

get_total_memory() {
    local mem_kb
    mem_kb=$(grep -m1 'MemTotal' /proc/meminfo 2>/dev/null | awk '{print $2}')
    if [ -n "$mem_kb" ]; then
        echo "$(( mem_kb / 1024 )) MB"
    else
        echo "N/A"
    fi
}

get_shell_version() {
    echo "${BASH_VERSION:-N/A}"
}

# ─── Main Execution ───────────────────────────────────────

main() {
    print_banner

    echo -e "  ${CLR_MAGENTA}Student${CLR_RESET}  : ${CLR_BOLD}${STUDENT_NAME}${CLR_RESET}  (${REG_NO})"
    echo -e "  ${CLR_MAGENTA}Software${CLR_RESET} : ${CLR_BOLD}${SOFTWARE_CHOICE}${CLR_RESET}"
    print_separator

    echo -e "\n  ${CLR_YELLOW}▸ System Details${CLR_RESET}\n"

    local kernel   ; kernel=$(uname -r)
    local arch     ; arch=$(uname -m)
    local hostname ; hostname=$(hostname)
    local user     ; user=$(whoami)
    local home_dir ; home_dir="$HOME"
    local uptime   ; uptime=$(uptime -p 2>/dev/null || echo "N/A")
    local datetime ; datetime=$(date '+%A, %d %B %Y — %H:%M:%S %Z')
    local distro   ; distro=$(get_distro_name)
    local cpu      ; cpu=$(get_cpu_info)
    local memory   ; memory=$(get_total_memory)
    local shell_v  ; shell_v=$(get_shell_version)

    print_field "Hostname"       "$hostname"
    print_field "User"           "$user"
    print_field "Home Directory" "$home_dir"
    print_field "Distribution"   "$distro"
    print_field "Kernel"         "$kernel"
    print_field "Architecture"   "$arch"
    print_field "CPU"            "$cpu"
    print_field "Total Memory"   "$memory"
    print_field "Bash Version"   "$shell_v"
    print_field "Uptime"         "$uptime"
    print_field "Date & Time"    "$datetime"

    print_separator
    echo -e "\n  ${CLR_YELLOW}▸ Licensing Note${CLR_RESET}\n"
    echo -e "  The Linux kernel is released under the ${CLR_BOLD}GNU GPL v2${CLR_RESET} license."
    echo -e "  VLC Media Player is distributed under the ${CLR_BOLD}GNU GPL v2${CLR_RESET} license.\n"

    print_separator
    echo -e "${CLR_DIM}  Report generated on ${datetime}${CLR_RESET}\n"
}

main "$@"
