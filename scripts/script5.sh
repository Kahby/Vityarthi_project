#!/bin/bash
# ============================================================
# Script 5: Open Source Manifesto Generator
# Author : Prathamesh Kumar | Reg No: 24MIP10034
# Course : Open Source Software Audit
# Purpose: Interactively collects the user's perspective on
#          open source and generates a personalized manifesto
#          document saved to disk.
# ============================================================

# ─── ANSI Color Definitions ────────────────────────────────
readonly CLR_RESET='\033[0m'
readonly CLR_BOLD='\033[1m'
readonly CLR_CYAN='\033[1;36m'
readonly CLR_GREEN='\033[1;32m'
readonly CLR_YELLOW='\033[1;33m'
readonly CLR_WHITE='\033[1;37m'
readonly CLR_DIM='\033[2m'
readonly CLR_MAGENTA='\033[1;35m'

# ─── Helper Functions ─────────────────────────────────────

print_banner() {
    echo -e "${CLR_CYAN}"
    echo "╔══════════════════════════════════════════════════════╗"
    echo "║      OPEN SOURCE MANIFESTO GENERATOR                ║"
    echo "║            Audit Script 5 of 5                      ║"
    echo "╚══════════════════════════════════════════════════════╝"
    echo -e "${CLR_RESET}"
}

print_separator() {
    echo -e "${CLR_DIM}────────────────────────────────────────────────────────${CLR_RESET}"
}

# Prompts the user with a styled question and stores the answer.
# Args: $1 = prompt text, $2 = variable name (nameref)
ask_question() {
    local prompt="$1"
    local -n result_ref=$2   # nameref (Bash 4.3+)
    local answer=""

    while [ -z "$answer" ]; do
        echo -e -n "  ${CLR_GREEN}?${CLR_RESET} ${prompt} ${CLR_DIM}›${CLR_RESET} "
        read -r answer
        if [ -z "$answer" ]; then
            echo -e "    ${CLR_YELLOW}Please provide an answer.${CLR_RESET}"
        fi
    done
    result_ref="$answer"
}

# Generates the manifesto content and writes it to a file.
# Args: $1=tool, $2=freedom_word, $3=build_idea, $4=output_path
generate_manifesto() {
    local tool="$1"
    local freedom="$2"
    local build="$3"
    local output="$4"
    local author ; author=$(whoami)
    local gen_date ; gen_date=$(date '+%d %B %Y')

    cat > "$output" <<-MANIFESTO
═══════════════════════════════════════════════════
         OPEN SOURCE MANIFESTO
         Generated: ${gen_date}
         Author   : ${author}
═══════════════════════════════════════════════════

I use ${tool} every day as my primary tool, which
represents the transformative power of open collaboration.

For me, freedom means "${freedom}" in the digital world —
the right to study, modify, and share software without
artificial barriers.

In the future, I aim to build "${build}" and share it
openly with the community, because I believe the best
software is built together.

I believe that open source is not just a development
model — it is a philosophy of transparency, trust,
and collective empowerment.

Principles I stand by:

  1. Transparency  — Code should be open for inspection.
  2. Collaboration — Great ideas emerge from diverse minds.
  3. Access        — Technology must be available to all.
  4. Community     — Users are contributors, not consumers.

═══════════════════════════════════════════════════
MANIFESTO
}

# ─── Main ─────────────────────────────────────────────────

main() {
    print_banner

    echo -e "  ${CLR_MAGENTA}Answer a few questions to craft your personal manifesto.${CLR_RESET}\n"

    local fav_tool freedom_word build_idea

    ask_question "Name one open-source tool you use daily"   fav_tool
    ask_question "In one word, what does freedom mean to you" freedom_word
    ask_question "What would you build and share openly"     build_idea

    echo ""
    print_separator

    # Determine output file path
    local user ; user=$(whoami)
    local output_file="manifesto_${user}.txt"

    echo -e "\n  ${CLR_YELLOW}▸ Generating manifesto…${CLR_RESET}\n"

    generate_manifesto "$fav_tool" "$freedom_word" "$build_idea" "$output_file"

    echo -e "  ${CLR_GREEN}✔ Saved to:${CLR_RESET} ${CLR_BOLD}${output_file}${CLR_RESET}\n"

    print_separator
    echo -e "\n  ${CLR_YELLOW}▸ Preview${CLR_RESET}\n"
    echo -e "${CLR_WHITE}"
    cat "$output_file"
    echo -e "${CLR_RESET}"
    print_separator
    echo -e "${CLR_DIM}  Manifesto generated at $(date '+%H:%M:%S %Z on %d %B %Y')${CLR_RESET}\n"
}

main "$@"
