# Open Source Software Audit Report

## Visual Studio Code

---

**Name:** Amritanshu Gupta  
**Reg No:** 24BCE11114  
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

Open-source software has changed the way we build and share technology. The idea is simple — anyone can look at the code, modify it, and distribute it. This model has given us Linux, Git, Firefox, and thousands of other tools that developers rely on every day.

For this project, I chose to audit **Visual Studio Code (VS Code)**, which is one of the most popular code editors out there right now. It's built by Microsoft, but the source code is open and available on GitHub. I wanted to understand how it's licensed, how the community around it works, what it looks like on a Linux system, and how it stacks up against paid editors.

I also wrote five Bash scripts as part of this audit. Each one does something practical — from gathering system info to analyzing log files — and they demonstrate different shell scripting concepts we've covered in class.

---

## 2. About Visual Studio Code

VS Code is a free code editor made by Microsoft. It runs on Windows, macOS, and Linux, and it's built on a framework called Electron (which basically wraps Chromium and Node.js into a desktop app). Despite being an Electron app, it's surprisingly fast for most use cases.

Here's a quick summary:

| | |
|---|---|
| **Type** | Source code editor |
| **Made by** | Microsoft |
| **Built with** | TypeScript, JavaScript, CSS |
| **Framework** | Electron |
| **License** | MIT (for the source code) |
| **Platforms** | Windows, macOS, Linux |
| **First released** | April 2015 |
| **GitHub repo** | [microsoft/vscode](https://github.com/microsoft/vscode) |

What makes it stand out is the extension system. There are over 40,000 extensions in the marketplace — you can add support for pretty much any programming language, connect to remote servers, use AI code completion, and a lot more. Some of the features I use personally include IntelliSense (auto-completion), the built-in terminal, and Git integration.

---

## 3. History and Origin

VS Code was announced at Microsoft's Build conference in April 2015. At that point, Microsoft was starting to shift its approach toward open source — which was a big deal, since for years they had been seen as anti-open-source.

The editor was open-sourced on GitHub in November 2015 under the MIT License, and it's been growing steadily since then.

Some key milestones:

- **2015** — First announced, then open-sourced on GitHub
- **2016** — Version 1.0 came out, extensions API was formalized
- **2017** — Remote development support started showing up
- **2018** — Live Share launched (real-time collaboration)
- **2019** — Became the #1 developer tool in the Stack Overflow survey
- **2020** — GitHub Codespaces brought VS Code to the browser
- **2021** — vscode.dev launched, so you could use it directly in a browser tab
- **2022–2026** — AI features (GitHub Copilot), performance improvements, continued growth

The reason it grew so fast is a combination of things: it's fast enough for daily use, the extension ecosystem is massive, and Microsoft has been genuinely investing in keeping it open.

---

## 4. Licensing

This is an interesting topic because there's a subtle distinction most people miss.

**The source code** on GitHub is released under the **MIT License**. This is one of the most permissive licenses — you can use, modify, and redistribute the code for any purpose, including commercial use. There's no copyleft requirement, so you don't have to open-source your modifications.

**The official binary**, however — the one you download from code.visualstudio.com — is distributed under Microsoft's own proprietary license. It includes telemetry (usage tracking) and Microsoft branding. So the binary and the source code technically have different licenses.

If that bothers you, there's a project called **VSCodium** that builds VS Code directly from the MIT-licensed source code, without Microsoft's telemetry or branding. It's functionally identical.

For context, here's how the MIT License compares to other common open-source licenses:

| License | How permissive | Copyleft? | Used by |
|---------|---------------|-----------|---------|
| MIT | Very | No | VS Code, React, Node.js |
| Apache 2.0 | High | No | Android, Kubernetes |
| GPL v2 | Moderate | Yes (strong) | Linux Kernel, Git |
| GPL v3 | Moderate | Yes (strong) | GCC, Bash |
| MPL 2.0 | Moderate | Yes (weak) | Firefox |

---

## 5. Community and Ecosystem

VS Code has one of the largest open-source communities for any developer tool. As of 2026, the GitHub repository has around 170,000 stars, over 30,000 forks, and more than 2,000 people have contributed code to it. Issues are tracked publicly, and Microsoft publishes monthly iteration plans so you can see what they're working on next.

The extensions marketplace is a huge part of why VS Code is so popular. With 40,000+ extensions, you can customize it for basically any workflow. Some popular ones include:

- **Languages**: Python, C/C++, Java, Go, Rust
- **Themes**: One Dark Pro, Dracula, Catppuccin
- **Tools**: Prettier, ESLint, GitLens, Docker, Remote SSH
- **AI**: GitHub Copilot, Tabnine, Codeium

The development process is fairly transparent. Anyone can submit a pull request, feature requests are discussed publicly on GitHub Issues, and there's an Insiders build that lets you try new features before they hit the stable release.

---

## 6. Installation on Linux

Installing VS Code on Ubuntu or any Debian-based distro involves adding Microsoft's package repository:

```bash
# Add the GPG key
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg

# Add the repo
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/packages.microsoft.gpg] \
  https://packages.microsoft.com/repos/code stable main" | \
  sudo tee /etc/apt/sources.list.d/vscode.list

# Install
sudo apt update
sudo apt install code
```

Or if you prefer Snap:

```bash
sudo snap install code --classic
```

After installation, you can verify it's working with:

```bash
code --version
which code
```

---

## 7. Ethical Considerations

There are a few things worth thinking about when it comes to VS Code and ethics.

**Telemetry and privacy** — The official VS Code binary sends usage data back to Microsoft. They say it's for improving the product, and you can turn it off in settings (`"telemetry.telemetryLevel": "off"`), but the fact that it's on by default is a valid concern. If privacy matters to you, VSCodium is the way to go.

**Corporate control of open source** — VS Code is technically open source, but Microsoft controls the direction of the project, the marketplace, and the binary distribution. The community can contribute, but ultimate decision-making power sits with Microsoft. This isn't necessarily bad, but it's worth being aware of.

Here's how I see the trade-offs:

| | Good side | Concern |
|---|---|---|
| Development | Full-time engineers work on it | Corporate priorities come first |
| Licensing | Source code is MIT | Binary has proprietary terms |
| Ecosystem | Huge marketplace | Potential lock-in via Microsoft extensions |
| Community | Open contributions welcome | Microsoft has final say |

**Accessibility** — On the positive side, VS Code supports screen readers, high-contrast themes, and full keyboard navigation. This makes it more inclusive than many alternatives.

---

## 8. Comparison with Proprietary Alternatives

I compared VS Code with two popular paid options — Sublime Text and JetBrains IDEs (like IntelliJ, PyCharm, etc.):

| | VS Code | Sublime Text | JetBrains |
|---|---|---|---|
| License | MIT (source) | Proprietary | Proprietary |
| Cost | Free | $99 one-time | $149–$649/year |
| Extensions | 40,000+ | ~5,000 | ~3,000 |
| Performance | Good (Electron) | Excellent (native) | Good (JVM-based) |
| Language support | Via extensions | Via packages | Deep, built-in |
| Remote dev | SSH, containers, WSL | Limited | SSH, Docker |
| Collaboration | Live Share | None | Code With Me |
| AI | GitHub Copilot | Limited | AI Assistant |

Sublime Text is faster because it's a native app, and JetBrains IDEs are smarter out of the box for specific languages (like Java or Python). But VS Code hits the sweet spot for most people — it's free, works with everything through extensions, and has the biggest community behind it.

---

## 9. Linux Footprint Analysis

Here's what VS Code looks like on a Linux system in terms of resource usage:

**Disk usage:**

| | |
|---|---|
| Package size (.deb) | ~95 MB |
| Installed size | ~350 MB |
| Config directory | `~/.config/Code/` |
| Extensions | `~/.vscode/extensions/` |

**Running processes:**

VS Code is an Electron app, so it spawns multiple processes. A typical session might look like:

| Process | What it does | RAM (approx.) |
|---|---|---|
| Main process | Window management | ~100 MB |
| Extension Host | Runs your extensions | 150–500 MB |
| File Watcher | Watches for file changes | ~30 MB |
| GPU Process | Hardware acceleration | ~50 MB |

It's not the lightest editor out there, but it's manageable on any modern machine. The third script in this project (`script3.sh`) audits system directories and checks the VS Code config folder, which ties into this analysis.

---

## 10. Scripts Overview

I wrote five Bash scripts for this project. Here's a brief look at what each one does and what scripting concepts it demonstrates.

### Script 1 — System Identity Report

Collects system info like hostname, distro, kernel version, CPU model, total RAM, and uptime. I used `/etc/os-release` for distro detection (with `lsb_release` as a fallback), and `/proc/cpuinfo` and `/proc/meminfo` for hardware info. The output is color-coded using ANSI escape sequences.

**Concepts:** variables, command substitution, functions, sourcing files, ANSI colors.

### Script 2 — FOSS Package Inspector

Checks whether specific open-source tools are installed and shows their version, location, description, and license. I stored all the package metadata in Bash associative arrays, which is cleaner than writing separate if-else blocks for each package. You can pass custom package names as command-line arguments.

**Concepts:** associative arrays, `command -v`, case statements, argument handling.

### Script 3 — Disk & Permission Auditor

Audits five key system directories for their permissions, ownership, and disk usage. I used the `stat` command for getting both symbolic and octal permissions, which is more reliable than parsing `ls -l` output. It also checks whether VS Code's config directory exists and reports how many files are in it.

**Concepts:** `stat` command, arrays, `for` loops, `printf` formatting, `find`.

### Script 4 — Log File Analyzer

Takes a log file and a keyword, then counts how many lines contain that keyword. Instead of reading the file line by line in Bash (which is extremely slow for large files), I used `grep -c` for counting. It also calculates what percentage of lines matched and gives a breakdown by log level (ERROR, WARNING, INFO, DEBUG, NOTICE).

**Concepts:** `grep` optimization, `awk` for math, input validation, while loops with timeout.

### Script 5 — Manifesto Generator

An interactive script that asks three questions about your views on open source and generates a personalized manifesto. I used a heredoc for the template and Bash namerefs (`local -n`) for the input-handling function, which lets you pass variable names into functions by reference.

**Concepts:** `read` for user input, namerefs, heredocs, file I/O.

---

## 11. Conclusion

After going through this audit, here's what I took away:

1. **VS Code's licensing is clever** — the MIT License on the source code makes it genuinely open, but the official binary adds proprietary elements. It's a good example of how "open source" isn't always black and white.

2. **The community is massive** — 170K+ GitHub stars, 2,000+ contributors, and 40,000+ extensions. That kind of ecosystem is hard to compete with.

3. **Privacy is a real concern** — the telemetry in the official binary is opt-out, not opt-in. VSCodium exists as an alternative, but most people don't know about it.

4. **It works well on Linux** — the installation is straightforward, the footprint is reasonable, and it integrates with Linux development tools without any issues.

5. **The scripts were a good exercise** — writing them gave me hands-on experience with things like associative arrays, `stat`, `grep` optimization, heredocs, and namerefs, which go beyond basic shell scripting.

Overall, VS Code is a solid example of open-source software done right — even if the corporate backing adds some complexity to the picture.

---

## 12. References

1. Visual Studio Code documentation — [https://code.visualstudio.com/docs](https://code.visualstudio.com/docs)
2. VS Code GitHub repository — [https://github.com/microsoft/vscode](https://github.com/microsoft/vscode)
3. The MIT License — [https://opensource.org/licenses/MIT](https://opensource.org/licenses/MIT)
4. Stack Overflow Developer Survey — [https://survey.stackoverflow.co/](https://survey.stackoverflow.co/)
5. VSCodium — [https://vscodium.com/](https://vscodium.com/)
6. What is Free Software (FSF) — [https://www.gnu.org/philosophy/free-sw.html](https://www.gnu.org/philosophy/free-sw.html)
7. Electron framework — [https://www.electronjs.org/](https://www.electronjs.org/)

---

*Report by Amritanshu Gupta (24BCE11114) — Open Source Software course.*
