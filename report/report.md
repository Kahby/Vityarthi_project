# Open Source Software Audit Report

## VLC Media Player

---

**Name:** Amritanshu Gupta  
**Reg No:** 24BCE11114  
**Course:** Open Source Software  
**Date:** March 2026

---

## Table of Contents

1. [Introduction](#1-introduction)
2. [About VLC Media Player](#2-about-vlc-media-player)
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

Open-source software has changed the way we build and share technology. The idea is simple — anyone can look at the code, modify it, and distribute it. This model has given us Linux, Firefox, LibreOffice, and thousands of other tools that people rely on every day.

For this project, I chose to audit **VLC Media Player**, which is probably the most well-known open-source media player in the world. It's developed by the VideoLAN project, a group that started as a student project in France and grew into one of the most downloaded software applications ever. I wanted to understand how VLC is licensed, how the community behind it works, what it looks like on a Linux system, and how it holds up against proprietary media players.

I also wrote five Bash scripts as part of this audit. Each one does something practical — from gathering system info to analyzing log files — and they demonstrate different shell scripting concepts we've covered in class.

---

## 2. About VLC Media Player

VLC is a **free, open-source** multimedia player developed by the **VideoLAN** project. It runs on basically every platform you can think of — Windows, macOS, Linux, Android, iOS, and even some less common ones like FreeBSD and Haiku. The thing that makes VLC special is that it plays almost any media format out of the box, without needing extra codecs or plugins.

Here's a quick summary:

| | |
|---|---|
| **Type** | Multimedia player and framework |
| **Developed by** | VideoLAN (non-profit) |
| **Written in** | C, C++, Objective-C |
| **License** | GNU GPL v2 (or later) |
| **Platforms** | Windows, macOS, Linux, Android, iOS, and more |
| **First released** | February 1, 2001 |
| **Website** | [videolan.org](https://www.videolan.org/) |

Some things VLC can do that people don't always realize:

- **Plays everything** — MKV, MP4, AVI, FLAC, MP3, DVD, Blu-ray, network streams, you name it.
- **No codec packs needed** — all codecs are built in; you don't need to install anything extra.
- **Network streaming** — can stream media over HTTP, RTSP, and other protocols.
- **Media conversion** — can convert between different audio and video formats.
- **No ads, no tracking** — completely free with no telemetry, ads, or upsells.
- **Subtitle support** — handles SRT, ASS, embedded subtitles, and can even download them automatically.

---

## 3. History and Origin

VLC has a pretty interesting backstory. It started in 1996 as a student project at **École Centrale Paris** (a French engineering school). The original goal was to stream videos across the school's campus network — "VideoLAN" literally stands for "Video Local Area Network."

The project was initially written by students as academic work, and the first public release happened in February 2001 when the code was open-sourced under the GPL.

Key milestones:

- **1996** — Started as a student networking project at École Centrale Paris
- **2001** — First public GPL release (version 0.2.0)
- **2005** — Reorganized under the VideoLAN non-profit organization
- **2006** — Version 0.8.5 brought major stability improvements
- **2009** — Version 1.0.0 released (first stable major version after 8 years of development)
- **2012** — Version 2.0 launched with a new interface and better codec support
- **2013** — Hit 1 billion downloads on the official website
- **2018** — Version 3.0 added Chromecast support, HDR, and 360° video
- **2019** — Hit 3 billion total downloads
- **2024–2026** — VLC 4.0 in development with a redesigned media library and interface

What's remarkable is that VLC has always been community-driven. There's no corporation behind it — it's maintained by the VideoLAN non-profit and contributors from around the world. Jean-Baptiste Kempf, who's been the lead developer for years, frequently talks about how they've turned down acquisition offers to keep VLC free and independent.

---

## 4. Licensing

VLC is released under the **GNU General Public License version 2** (GPL v2), with the option to use any later version of the GPL.

The GPL is a **copyleft** license, which means if you modify VLC and distribute your modified version, you have to release your source code under the same license. This is fundamentally different from permissive licenses like MIT — the GPL is designed to make sure the software stays free forever.

Here's what the GPL v2 allows and requires:

- ✅ You can use VLC for any purpose
- ✅ You can modify the source code
- ✅ You can distribute copies
- ✅ Commercial use is fine
- ⚠️ Modified versions must also use GPL v2
- ⚠️ You must include the source code when distributing
- ❌ No warranty

One interesting licensing challenge VLC faced was around **patent-encumbered codecs** like H.264 and AAC. In some countries, these codecs are covered by software patents, which creates a weird legal gray area for open-source projects that include them. VLC's position has always been that software patents shouldn't restrict free software, and they've included these codecs from the start. This is actually one of the reasons VLC became so popular — on Windows, you used to have to install separate codec packs to play common video formats, but VLC just worked.

For comparison, here's how the GPL sits among other common licenses:

| License | Permissiveness | Copyleft? | Used by |
|---------|---------------|-----------|---------|
| GPL v2 | Moderate | Yes (strong) | VLC, Linux Kernel, Git |
| GPL v3 | Moderate | Yes (strong) | GCC, Bash |
| LGPL v2.1 | Higher than GPL | Yes (weak) | FFmpeg libraries, Qt |
| MIT | Very high | No | Node.js, React |
| Apache 2.0 | High | No | Android, Kubernetes |

---

## 5. Community and Ecosystem

Unlike a lot of major open-source projects, VLC isn't backed by a big tech company. The **VideoLAN** organization is a French non-profit, and development is driven by volunteers and a small number of paid developers funded through donations.

Some numbers:

| | |
|---|---|
| Total downloads | 3+ billion |
| Supported platforms | 15+ |
| Supported formats | 100+ audio/video formats |
| Contributors | ~700+ over the project's lifetime |
| Code repository | [code.videolan.org](https://code.videolan.org/videolan/vlc) |

The community is organized around:

- **code.videolan.org** — their self-hosted GitLab instance (they don't use GitHub as the primary repo)
- **Mailing lists** — where most development discussion happens
- **IRC / Matrix** — for real-time chat
- **VideoLAN Dev Days** — an annual developer conference, usually held in Paris

VLC also acts as a **media framework**, not just a player. Developers can use the **libVLC** library to embed media playback into their own applications. This is how projects like streamlink, OBS, and various custom video players work under the hood.

Another thing worth mentioning is that VideoLAN also maintains other related projects:
- **x264** — one of the best open-source H.264 encoders
- **x265** — H.265/HEVC encoder
- **dav1d** — AV1 decoder (very fast, used by Firefox and Chrome)

---

## 6. Installation on Linux

Installing VLC on Ubuntu or any Debian-based distro is straightforward since it's in the official repositories:

```bash
sudo apt update
sudo apt install vlc
```

For the latest version, you can use the Snap package:

```bash
sudo snap install vlc
```

Or Flatpak:

```bash
flatpak install flathub org.videolan.VLC
```

After installing, verify it's working:

```bash
vlc --version
which vlc
```

You can also run VLC from the command line to play files or streams:

```bash
vlc video.mp4
vlc https://example.com/stream.m3u8
cvlc --no-video audio.mp3    # headless mode, no GUI
```

---

## 7. Ethical Considerations

VLC is actually a pretty clean example when it comes to ethics in open source, especially compared to some corporate-backed projects.

**No telemetry at all** — VLC doesn't collect any usage data. None. No analytics, no crash reports sent home, no tracking. This is a deliberate choice by the VideoLAN team. Jean-Baptiste Kempf has publicly said they've been offered money to bundle adware or add tracking, and they've always refused.

**No ads, no upsells** — VLC is completely free with no premium tier. What you download is the full product. Compare that with some "free" media players that show ads or push you toward a paid version.

**Patent issues** — As I mentioned in the licensing section, VLC includes codecs that are covered by software patents in some jurisdictions. This is ethically interesting — VLC's stance is that users shouldn't need to pay royalties to play common media formats, even though organizations like MPEG LA hold patents on H.264. In practice, VLC has never been successfully sued over this.

**Independence** — The VideoLAN project has turned down multiple acquisition offers from companies that wanted to buy VLC and monetize it. Keeping it as a non-profit ensures that the software serves users rather than shareholders.

| | Good side | Something to think about |
|---|---|---|
| Privacy | Zero telemetry, zero tracking | — |
| Cost | Completely free, no premium tier | Relies on donations to stay funded |
| Independence | Non-profit, no corporate control | Smaller development team than corporate projects |
| Patents | Includes all codecs freely | Legal gray area in some countries |

---

## 8. Comparison with Proprietary Alternatives

I compared VLC with two common proprietary alternatives — Windows Media Player and Apple's ecosystem (iTunes / Apple Music / QuickTime):

| | VLC | Windows Media Player | iTunes / Apple Music |
|---|---|---|---|
| License | GPL v2 (open source) | Proprietary (bundled with Windows) | Proprietary |
| Cost | Free | Free (with Windows) | Free / subscription |
| Supported formats | 100+ (basically everything) | Limited (needs codecs) | Limited (Apple-focused) |
| Codecs included | Yes, all built in | No, needs codec packs | Partial |
| Cross-platform | Windows, Mac, Linux, Android, iOS | Windows only | Mac, Windows, iOS |
| Streaming | HTTP, RTSP, network streams | Basic | Apple ecosystem only |
| Ads / tracking | None | Some integration with MS services | Heavy Apple ecosystem push |
| Subtitle support | Excellent (SRT, ASS, auto-download) | Basic | Basic |
| Media conversion | Yes | No | Limited |
| Customization | Skins, extensions, full source access | Minimal | None |

VLC wins on pretty much every front except tight OS integration. Windows Media Player is fine for basic playback on Windows, and Apple's tools work well within the Apple ecosystem, but neither comes close to VLC's format support, cross-platform availability, or respect for user privacy.

There's also **MPV**, which is another open-source player worth mentioning. MPV is lighter and more keyboard-driven than VLC — it's popular with power users. But VLC has a much more accessible GUI and broader platform support, which is why it has 3 billion downloads and MPV doesn't.

---

## 9. Linux Footprint Analysis

Here's what VLC looks like on a Linux system:

**Disk usage:**

| | |
|---|---|
| Package size (apt) | ~30 MB (plus ~60 MB of dependencies) |
| Installed size | ~150 MB total |
| Config directory | `~/.config/vlc/` |
| Cache | `~/.cache/vlc/` |
| Plugins | `/usr/lib/x86_64-linux-gnu/vlc/plugins/` |

**Dependencies:**

VLC pulls in quite a few libraries because it supports so many formats. Key dependencies include:
- `libavcodec` / `libavformat` (from FFmpeg) — for codec support
- `libfreetype` — for subtitle rendering
- `libasound` / `libpulse` — for audio output
- `libx11` / `libxcb` — for display on X11
- `libdvdread` / `libdvdnav` — for DVD playback

**Running processes:**

VLC is a native application (written in C/C++), so it's much lighter than Electron-based apps:

| Process | What it does | RAM (approx.) |
|---|---|---|
| `vlc` (main) | GUI and playback engine | 80–200 MB depending on media |
| Audio output | ALSA/PulseAudio interface | Shared with main process |

The third script in this project (`script3.sh`) audits system directories and checks VLC's config folder at `~/.config/vlc/`, which ties into this analysis.

---

## 10. Scripts Overview

I wrote five Bash scripts for this project. Here's what each one does and what scripting concepts it covers.

### Script 1 — System Identity Report

Collects system info like hostname, distro, kernel version, CPU model, total RAM, and uptime. I used `/etc/os-release` for distro detection (with `lsb_release` as a fallback), and `/proc/cpuinfo` and `/proc/meminfo` for hardware info. The output is color-coded using ANSI escape sequences.

**Concepts:** variables, command substitution, functions, sourcing files, ANSI colors.

### Script 2 — FOSS Package Inspector

Checks whether specific open-source tools are installed and shows their version, location, description, and license. I stored all the package metadata in Bash associative arrays, which is cleaner than writing separate if-else blocks for each package. The default list includes `vlc`, `git`, `python3`, `curl`, and `ffmpeg`, but you can pass custom package names as arguments.

**Concepts:** associative arrays, `command -v`, case statements, argument handling.

### Script 3 — Disk & Permission Auditor

Audits five key system directories for their permissions, ownership, and disk usage. I used the `stat` command for getting both symbolic and octal permissions, which is more reliable than parsing `ls -l` output. It also checks whether VLC's config directory (`~/.config/vlc`) exists and reports how many files are in it.

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

1. **VLC's licensing protects freedom** — the GPL v2 ensures that any modifications to VLC must also be open source. Unlike permissive licenses, the copyleft requirement means VLC can't be turned into a proprietary product.

2. **Independence matters** — the fact that VideoLAN is a non-profit that has turned down buyout offers says a lot. VLC exists to serve users, not to generate revenue, and you can feel that in the way the software is designed (no ads, no tracking, no premium upsells).

3. **3 billion downloads is no joke** — VLC is one of the most downloaded software applications in history, which shows that open-source software can absolutely compete with (and beat) proprietary alternatives in mainstream consumer use.

4. **The codec situation is unusual** — VLC's decision to include patent-encumbered codecs is pragmatic and user-friendly, but it sits in a legal gray area that most other open-source projects avoid.

5. **It's lightweight on Linux** — compared to Electron-based apps, VLC's native codebase means it uses significantly less memory and disk space, while supporting far more functionality.

6. **The scripts were a good exercise** — writing them gave me hands-on experience with associative arrays, `stat`, `grep` optimization, heredocs, and namerefs, which go beyond basic shell scripting.

VLC is a great example of what open-source software can be — fast, reliable, feature-complete, completely free, and built by a community that puts users first.

---

## 12. References

1. VideoLAN official website — [https://www.videolan.org/](https://www.videolan.org/)
2. VLC source code — [https://code.videolan.org/videolan/vlc](https://code.videolan.org/videolan/vlc)
3. GNU GPL v2 License — [https://www.gnu.org/licenses/old-licenses/gpl-2.0.html](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html)
4. VideoLAN wiki — [https://wiki.videolan.org/](https://wiki.videolan.org/)
5. Jean-Baptiste Kempf on VLC — [https://www.jbkempf.com/](https://www.jbkempf.com/)
6. Free Software Foundation — [https://www.gnu.org/philosophy/free-sw.html](https://www.gnu.org/philosophy/free-sw.html)
7. FFmpeg project — [https://ffmpeg.org/](https://ffmpeg.org/)

---

*Report by Amritanshu Gupta (24BCE11114) — Open Source Software course.*
