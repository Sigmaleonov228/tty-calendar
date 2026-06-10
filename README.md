tty-clock 🕐
A minimal bash script that prints the current time and a calendar for the current month — right in your terminal. No dependencies, no loops, no interactivity. Just run it and read it.
  ┌─────────────────────────────────┐
  │        18:42:07                 │
  │
  │  Date   Wednesday, 10 June 2026
  │  Zone   UTC
  │  Week   W24
  │  Day    161 / 365
  └─────────────────────────────────┘

  June 2026

  Mo  Tu  We  Th  Fr  Sa  Su
  ───────────────────────────
   1   2   3   4   5   6   7
   8   9  10  11  12  13  14
  15  16  17  18  19  20  21
  22  23  24  25  26  27  28
  29  30
Features

Current time (HH:MM:SS)
Date, timezone, ISO week number, day of year
Current month calendar with today highlighted
Weekends shown in a different color
Pure bash — no Python, no ncurses, no extra packages

Usage
bashchmod +x tty_clock.sh
./tty_clock.sh
Or drop it somewhere on your $PATH:
bashsudo cp tty_clock.sh /usr/local/bin/tty-clock
tty-clock
Want it on every new shell? Add to your ~/.bashrc or ~/.zshrc:
bashtty-clock
Requirements

bash 4+
date (GNU coreutils) — standard on any Linux system

Tested on Ubuntu, Debian, Arch, and Fedora.
License
MIT
