# Open Source Software Audit Report

## Visual Studio Code (VS Code)

---

**Student Name:** Prathamesh Kumar  
**Registration No.:** 24MIP10034  
**Course:** Open Source Software  
**Date:** March 2026

---

## Table of Contents

1. [Introduction](#1-introduction)
2. [About Visual Studio Code](#2-about-visual-studio-code)
3. [History and Origin](#3-history-and-origin)
4. [Licensing](#4-licensing)
5. [Community and Ecosystem](#5-community-and-ecosystem)
6. [Installation on Linux](#6-installation-on-linux)
7. [Ethical Considerations](#7-ethical-considerations)
8. [Comparison with Proprietary Alternatives](#8-comparison-with-proprietary-alternatives)
9. [Linux Footprint Analysis](#9-linux-footprint-analysis)
10. [Scripts Overview](#10-scripts-overview)
11. [Conclusion](#11-conclusion)
12. [References](#12-references)

---

## 1. Introduction

Open-source software (OSS) has fundamentally reshaped the technology landscape by enabling transparency, collaboration, and collective ownership of code. This report audits **Visual Studio Code (VS Code)**, one of the most widely used open-source code editors in the world, examining its origins, licensing, ecosystem, ethical implications, and its footprint within a Linux environment.

The audit is supplemented by five Bash scripts that demonstrate practical system administration concepts — from gathering system identity to analyzing log files — all within the context of an open-source Linux system running VS Code.

---

## 2. About Visual Studio Code

Visual Studio Code is a **free, open-source** code editor developed by **Microsoft**. It is built on the **Electron** framework (which uses Chromium and Node.js) and is designed to be lightweight yet powerful.

### Key Characteristics

| Attribute | Detail |
|-----------|--------|
| **Type** | Source-code editor |
| **Developer** | Microsoft |
| **Written in** | TypeScript, JavaScript, CSS |
| **Framework** | Electron |
| **License** | MIT License (source code) |
| **Platforms** | Windows, macOS, Linux |
| **First Release** | April 29, 2015 |
| **Repository** | [github.com/microsoft/vscode](https://github.com/microsoft/vscode) |

### Notable Features

- **IntelliSense** — context-aware code completion powered by language servers.
- **Integrated Terminal** — run shell commands directly inside the editor.
- **Git Integration** — built-in source control management for Git repositories.
- **Extensions Marketplace** — over 40,000 extensions for languages, themes, debuggers, and tools.
- **Remote Development** — SSH, containers, and WSL support for remote coding.
- **Live Share** — real-time collaborative editing with peers.

---

## 3. History and Origin

VS Code was first announced at the **Build 2015** developer conference on April 29, 2015, and was initially released as a **preview**. In November 2015, it was made open-source under the MIT License and published on GitHub.

### Timeline

| Year | Milestone |
|------|-----------|
| 2015 | Announced at Build conference; open-sourced on GitHub |
| 2016 | Version 1.0 released (stable); extensions API formalized |
| 2017 | Remote development extensions introduced; marketplace growth |
| 2018 | Live Share launched for real-time collaboration |
| 2019 | VS Code becomes the **#1 developer tool** (Stack Overflow survey) |
| 2020 | GitHub Codespaces integrates VS Code in the browser |
| 2021 | vscode.dev launched — full editor running in a web browser |
| 2022–2026 | Continued AI integration (GitHub Copilot), improved performance |

VS Code's rapid adoption is attributed to its **speed**, **extensibility**, and Microsoft's commitment to keeping the core open-source.

---

## 4. Licensing

### Source Code License — MIT

The VS Code source code is released under the **MIT License**, one of the most permissive open-source licenses available.

> **MIT License Summary:**  
> - ✅ Commercial use  
> - ✅ Modification  
> - ✅ Distribution  
> - ✅ Private use  
> - ❌ Liability  
> - ❌ Warranty

### Binary Distribution

It is important to note that the **official binary releases** of VS Code distributed by Microsoft contain **proprietary telemetry** and are governed by the [Microsoft Software License](https://code.visualstudio.com/License/). The fully open-source alternative is **VSCodium**, which builds from the same MIT-licensed source without Microsoft's branding or telemetry.

### Comparison of Open-Source Licenses

| License | Permissiveness | Copyleft | Notable Users |
|---------|---------------|----------|---------------|
| MIT | Very High | No | VS Code, Node.js, React |
| Apache 2.0 | High | No | Android, Kubernetes, TensorFlow |
| GPL v2 | Moderate | Strong | Linux Kernel, Git |
| GPL v3 | Moderate | Strong | GCC, Bash |
| MPL 2.0 | Moderate | Weak | Firefox, Thunderbird |

---

## 5. Community and Ecosystem

### GitHub Metrics (as of 2026)

| Metric | Value |
|--------|-------|
| ⭐ Stars | ~170,000+ |
| 🍴 Forks | ~30,000+ |
| 👥 Contributors | ~2,000+ |
| 📝 Issues (total) | ~200,000+ |
| 🔧 Monthly releases | Regular (first week of each month) |

### Extensions Ecosystem

The VS Code Marketplace hosts over **40,000 extensions**, making it one of the largest editor extension ecosystems. Popular categories include:

- **Languages:** Python, C/C++, Java, Go, Rust, JavaScript/TypeScript
- **Themes:** One Dark Pro, Dracula, GitHub Theme, Catppuccin
- **Productivity:** Prettier, ESLint, GitLens, Docker, Remote SSH
- **AI:** GitHub Copilot, Tabnine, Codeium

### Community Contributions

VS Code accepts community contributions through GitHub pull requests. The project follows a transparent development process with:
- Public **iteration plans** published monthly
- **Feature requests** tracked via GitHub Issues
- **Insiders build** for early access and testing

---

## 6. Installation on Linux

### Ubuntu / Debian-based Systems

```bash
# Download and install the GPG key
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg

# Add the repository
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/packages.microsoft.gpg] \
  https://packages.microsoft.com/repos/code stable main" | \
  sudo tee /etc/apt/sources.list.d/vscode.list

# Update and install
sudo apt update
sudo apt install code
```

### Snap (universal)

```bash
sudo snap install code --classic
```

### Verification

```bash
code --version
which code
```

---

## 7. Ethical Considerations

### Telemetry and Privacy

The official VS Code binary includes **telemetry** that sends usage data to Microsoft. While this data is used to improve the product, it raises privacy concerns in the open-source community.

**Mitigation options:**
1. Disable telemetry: `"telemetry.telemetryLevel": "off"` in settings.
2. Use **VSCodium** — a community-maintained build without telemetry.

### Corporate Stewardship of Open Source

VS Code demonstrates the complex relationship between corporations and open source:

| Aspect | Positive | Concern |
|--------|----------|---------|
| Development | Full-time engineers maintain the project | Corporate priorities may override community needs |
| Licensing | MIT-licensed source code | Binary distribution has proprietary terms |
| Ecosystem | Rich marketplace and integrations | Lock-in through Microsoft-specific extensions |
| Community | Open contribution model | Governance is ultimately Microsoft-controlled |

### Digital Inclusivity

VS Code supports **accessibility features** including screen reader compatibility, high-contrast themes, and keyboard-only navigation — contributing positively to digital inclusivity in software development.

---

## 8. Comparison with Proprietary Alternatives

| Feature | VS Code (OSS) | Sublime Text | JetBrains IDEs |
|---------|---------------|-------------|-----------------|
| **License** | MIT (source) | Proprietary | Proprietary |
| **Cost** | Free | $99 (one-time) | $149–$649/year |
| **Extensions** | 40,000+ | ~5,000 | ~3,000 |
| **Performance** | Good (Electron) | Excellent (native) | Good (JVM) |
| **Language Support** | Via extensions | Via packages | Built-in (per IDE) |
| **Remote Dev** | SSH, Containers, WSL | Limited | SSH, Docker |
| **Collaboration** | Live Share | None | Code With Me |
| **AI Integration** | GitHub Copilot | Limited | AI Assistant |
| **Community** | Massive, open | Commercial | Commercial |

### Key Takeaway

VS Code offers the best **value proposition** for most developers: it is free, highly extensible, and backed by an active open-source community. While Sublime Text excels in raw performance and JetBrains IDEs offer deeper language-specific intelligence, VS Code's open nature and extensibility make it the most versatile choice.

---

## 9. Linux Footprint Analysis

### Installation Footprint

| Metric | Value |
|--------|-------|
| Package size (`.deb`) | ~95 MB |
| Installed size | ~350 MB |
| Dependencies | ~15 shared libraries |
| Configuration directory | `~/.config/Code/` |
| Extensions directory | `~/.vscode/extensions/` |
| Cache | `~/.config/Code/Cache/` |

### Process Footprint

VS Code runs multiple Electron processes:

| Process | Purpose | Typical RAM |
|---------|---------|------------|
| `code` (main) | Window management | ~100 MB |
| Extension Host | Runs extensions | ~150–500 MB |
| File Watcher | Monitors file changes | ~30 MB |
| GPU Process | Hardware acceleration | ~50 MB |

### Disk Usage Audit (Script 3 Results)

The third script (`script3.sh`) audits critical system directories and checks VS Code's configuration directory, reporting permissions (symbolic + octal), owner, group, and disk usage for each.

---

## 10. Scripts Overview

Five Bash scripts were developed as part of this audit, each demonstrating specific shell scripting concepts:

### Script 1 — System Identity Report

**Purpose:** Gathers comprehensive host system information.

**Concepts demonstrated:**
- Variable assignment and command substitution
- Sourcing files (`/etc/os-release`)
- ANSI escape codes for colored output
- Function-based code organization

### Script 2 — FOSS Package Inspector

**Purpose:** Inspects installation status and details of FOSS packages.

**Concepts demonstrated:**
- **Associative arrays** (Bash 4.0+) for a knowledge base
- `command -v` for portable command existence checking
- `case` statements and conditional logic
- Command-line argument handling

### Script 3 — Disk & Permission Auditor

**Purpose:** Audits system directory permissions and disk usage.

**Concepts demonstrated:**
- **`stat`** command for precise permission parsing (octal + symbolic)
- Array iteration with `for` loops
- `printf` for formatted table output
- `find` for recursive file counting

### Script 4 — Log File Analyzer

**Purpose:** Analyzes log files for keyword occurrences.

**Concepts demonstrated:**
- **Optimized searching** with `grep -c` (vs. line-by-line loop)
- `awk` for arithmetic (percentage calculation)
- Input validation and error handling
- `while` loop with timeout for empty-file waiting

### Script 5 — Open Source Manifesto Generator

**Purpose:** Generates a personalized open-source manifesto.

**Concepts demonstrated:**
- **`read -p`** for interactive user input
- **Namerefs** (`local -n`, Bash 4.3+) for pass-by-reference
- **Heredoc** (`<<-MANIFESTO`) for multi-line template generation
- File I/O with redirection

---

## 11. Conclusion

Visual Studio Code stands as a remarkable example of how open-source software can achieve mainstream success while maintaining its open nature. Key findings from this audit:

1. **Licensing:** The MIT License on the source code ensures maximum freedom for developers, though the official binary adds proprietary elements.

2. **Community:** With 170,000+ GitHub stars and 2,000+ contributors, VS Code has one of the most vibrant open-source communities in the world.

3. **Ecosystem:** The marketplace with 40,000+ extensions demonstrates the power of open platforms in fostering innovation.

4. **Ethics:** The telemetry question highlights the tension between corporate-backed open source and user privacy, with OSS-friendly alternatives like VSCodium addressing the gap.

5. **Linux Integration:** VS Code integrates well into the Linux ecosystem, with a manageable footprint and full compatibility with Linux-native development tools.

The five audit scripts demonstrate practical Bash scripting in a Linux environment, covering system introspection, package management, file permissions, log analysis, and interactive I/O — all essential skills for working effectively in the open-source ecosystem.

---

## 12. References

1. Microsoft. (2025). *Visual Studio Code Documentation.* [https://code.visualstudio.com/docs](https://code.visualstudio.com/docs)
2. GitHub. (2025). *microsoft/vscode Repository.* [https://github.com/microsoft/vscode](https://github.com/microsoft/vscode)
3. Open Source Initiative. (2025). *The MIT License.* [https://opensource.org/licenses/MIT](https://opensource.org/licenses/MIT)
4. Stack Overflow. (2024). *Developer Survey Results — Integrated Development Environment.* [https://survey.stackoverflow.co/](https://survey.stackoverflow.co/)
5. VSCodium. (2025). *Free/Libre Open Source Software Binaries of VS Code.* [https://vscodium.com/](https://vscodium.com/)
6. Free Software Foundation. (2025). *What is Free Software?* [https://www.gnu.org/philosophy/free-sw.html](https://www.gnu.org/philosophy/free-sw.html)
7. Electron. (2025). *Build cross-platform desktop apps.* [https://www.electronjs.org/](https://www.electronjs.org/)

---

*Report prepared by Prathamesh Kumar (24MIP10034) for the Open Source Software course audit.*
