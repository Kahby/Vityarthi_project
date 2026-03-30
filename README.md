# 🔍 Open Source Software Audit — Visual Studio Code

> **Course Project** | Open Source Software  
> **Student:** Amritanshu Gupta — `24BCE11114`

---

## 📋 Overview

This project performs a comprehensive audit of **Visual Studio Code (VS Code)** as an open-source software system. It investigates its origin, licensing model (MIT License), Linux footprint, ecosystem, and compares it with proprietary alternatives. The audit is carried out through a series of Bash scripts and accompanied by a detailed written report.

---

## 🗂️ Project Structure

```
oss-audit-24BCE11114/
├── scripts/
│   ├── script1.sh              # System Identity Report
│   ├── script2.sh              # FOSS Package Inspector
│   ├── script3.sh              # Disk & Permission Auditor
│   ├── script4.sh              # Log File Analyzer
│   ├── script5.sh              # Open Source Manifesto Generator
│   └── manifesto_frosfres.txt  # Sample generated manifesto
├── report/
│   ├── report.pdf              # Final audit report (PDF)
│   └── report.md               # Audit report source (Markdown)
├── implementation_plan.md
├── README.md
└── LICENSE
```

---

## ✨ Features

| Script | Title | Highlights |
|--------|-------|------------|
| `script1.sh` | **System Identity Report** | Kernel, CPU, RAM, distro detection via `/etc/os-release`, ANSI-colored output |
| `script2.sh` | **FOSS Package Inspector** | Associative-array knowledge base, multi-package inspection, license lookup |
| `script3.sh` | **Disk & Permission Auditor** | `stat`-based octal + symbolic permissions, formatted table, VS Code config scan |
| `script4.sh` | **Log File Analyzer** | `grep`-optimized search (no line-by-line loop), match-rate %, log-level summary |
| `script5.sh` | **Manifesto Generator** | Interactive prompts with validation, heredoc-templated output, principles section |

---

## 🚀 Getting Started

### Prerequisites

- **Linux system** (Ubuntu / Omarchy / WSL)
- **Bash 4.3+** (required for associative arrays and namerefs)
- Standard GNU coreutils (`stat`, `grep`, `awk`, `du`, etc.)

### Running the Scripts

```bash
# 1. Navigate to the scripts directory
cd scripts/

# 2. Make all scripts executable
chmod +x script*.sh

# 3. Run individual scripts
./script1.sh                          # System identity
./script2.sh                          # Inspect default packages
./script2.sh docker nginx node        # Inspect custom packages
./script3.sh                          # Directory audit
./script4.sh /var/log/syslog          # Analyze log with default keyword "error"
./script4.sh /var/log/syslog warning  # Analyze log with custom keyword
./script5.sh                          # Generate manifesto (interactive)
```

---

## 📝 Script Details

### Script 1 — System Identity Report

Collects and displays comprehensive host system information including kernel version, CPU model, total memory, distribution name, architecture, uptime, and the current user. Uses `/etc/os-release` with `lsb_release` fallback for robust distro detection.

### Script 2 — FOSS Package Inspector

Inspects a list of FOSS packages using Bash **associative arrays** as a built-in knowledge base. For each package, it reports installation status, version, binary location, a description, and the license. Accepts custom package names as command-line arguments.

### Script 3 — Disk & Permission Auditor

Audits critical system directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`) by using the `stat` command for precise symbolic and octal permission parsing. Results are displayed in a formatted table. Also checks and reports on the VS Code configuration directory.

### Script 4 — Log File Analyzer

Analyzes a log file for a given keyword using **`grep -c`** for optimized counting (avoiding slow line-by-line Bash loops). Reports file size, total lines, keyword occurrences, and the match rate as a percentage. Includes a bonus log-level summary (ERROR, WARNING, INFO, DEBUG, NOTICE).

### Script 5 — Open Source Manifesto Generator

Interactively prompts the user with three questions and generates a personalized open-source manifesto using a **heredoc template**. The manifesto includes a principles section and is saved as a text file.

---

## 📄 Report

The full audit report is available in two formats:

- **PDF:** [`report/report.pdf`](report/report.pdf)
- **Markdown:** [`report/report.md`](report/report.md)

The report covers VS Code's history, licensing (MIT), community and ecosystem, ethical considerations, comparison with proprietary editors, and the Linux development environment.

---

## ⚖️ License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

*Built with ❤️ for Open Source — Amritanshu Gupta (24BCE11114)*
