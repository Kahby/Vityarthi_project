# Open Source Software Audit — Visual Studio Code

**Name:** Amritanshu Gupta  
**Reg No:** 24BCE11114  
**Course:** Open Source Software

---

## What is this project?

This is my course project where I picked **Visual Studio Code** and did a full audit of it as an open-source software. I looked into how it's licensed (MIT), who maintains it, how it fits into the Linux ecosystem, and compared it with paid alternatives like Sublime Text and JetBrains.

Along with the written report, I also wrote **5 Bash scripts** that do different system-level tasks — things like checking what's installed on your machine, reading log files, auditing folder permissions, etc. Each script demonstrates specific shell scripting concepts we covered in class.

---

## Project Structure

```
├── scripts/
│   ├── script1.sh              — System info (kernel, CPU, RAM, etc.)
│   ├── script2.sh              — Checks if certain packages are installed
│   ├── script3.sh              — Audits directory permissions and disk usage
│   ├── script4.sh              — Searches a log file for keywords
│   ├── script5.sh              — Generates an open-source manifesto (interactive)
│   └── manifesto_frosfres.txt  — Sample output from script5
├── report/
│   ├── report.pdf              — Final report (PDF)
│   └── report.md               — Same report in Markdown
├── LICENSE
└── README.md
```

---

## About the Scripts

### Script 1 — System Identity Report

Pulls together basic info about the system you're running on — hostname, distro name, kernel version, CPU, total RAM, uptime, etc. It reads from `/etc/os-release` and `/proc/cpuinfo` to get the details. Everything is printed with colors so it's easy to read in the terminal.

### Script 2 — FOSS Package Inspector

Checks whether certain open-source tools are installed (like `git`, `python3`, `curl`, `vim`, and of course `code`). For each one, it shows the version, where the binary lives, a short description, and what license it uses. I used Bash associative arrays to store all the package info, which made the code cleaner than a bunch of if-else blocks.

You can also pass your own package names as arguments:

```bash
./script2.sh docker nginx node
```

### Script 3 — Disk & Permission Auditor

Goes through important system directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`) and shows their permissions in both symbolic and octal format, along with who owns them and how much space they use. I used the `stat` command instead of parsing `ls` output, which is more reliable. It also checks if VS Code's config folder exists at `~/.config/Code`.

### Script 4 — Log File Analyzer

Takes a log file and a keyword (defaults to "error") and tells you how many times that keyword shows up. Instead of reading the file line by line in Bash (which is slow), I used `grep -c` for counting. It also shows what percentage of lines matched and gives a breakdown of common log levels (ERROR, WARNING, INFO, etc.).

```bash
./script4.sh /var/log/syslog
./script4.sh /var/log/syslog warning
```

### Script 5 — Manifesto Generator

This one's interactive — it asks you three questions about open source and then writes a short manifesto to a text file. I used heredocs for the template and Bash namerefs for the input function, which are things we learned in class.

---

## How to Run

You'll need a Linux machine (or WSL) with Bash 4.3 or newer.

```bash
cd scripts/
chmod +x script*.sh

./script1.sh
./script2.sh
./script3.sh
./script4.sh /var/log/syslog
./script5.sh
```

---

## The Report

The full written report covers:

- What VS Code is and its history
- How the MIT License works
- The community around VS Code (GitHub stats, extensions marketplace)
- Privacy concerns with telemetry
- How it compares to Sublime Text and JetBrains IDEs
- Its footprint on a Linux system

You can read it here: [`report/report.md`](report/report.md) or check the PDF version at [`report/report.pdf`](report/report.pdf).

---

## License

MIT — see [LICENSE](LICENSE).
