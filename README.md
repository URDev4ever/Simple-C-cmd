<p align="center">
  🇺🇸 <a href="README.md"><b>English</b></a> |
  🇪🇸 <a href="README_ES.md">Español</a>
</p>

# Simple `C` Command

Small shell helper to **compile and run C programs quickly** from the terminal.

Instead of running `gcc` manually every time, this function compiles a `.c` file and immediately executes the resulting binary.

## Usage

```bash
c program.c
```

This will:

1. Compile the file with `gcc`
2. Enable useful warnings (`-Wall -Wextra`)
3. Include debug symbols (`-g`)
4. Run the compiled binary

Example:

```bash
c hello.c
```

---

# Requirements

You need:

* **gcc**
* a **POSIX shell** (bash / zsh)

Install gcc if you don't have it.

### Debian / Ubuntu / Kali

```bash
sudo apt install build-essential
```

### Arch Linux

```bash
sudo pacman -S gcc
```

### Fedora

```bash
sudo dnf install gcc
```

---

# Installation

## Option 1 — Add to your shell config (recommended)

Copy the function into your shell config file.

For **bash**:

```bash
~/.bashrc
```

For **zsh**:

```bash
~/.zshrc
```

Then paste:

```bash
c() {
    local file="$1"

    if [[ -z "$file" ]]; then
        echo "Usage: c file.c"
        return 1
    fi

    if [[ ! -f "$file" ]]; then
        echo "File not found"
        return 1
    fi

    local output="${file%.c}"

    gcc "$file" -Wall -Wextra -g -o "$output" && "./$output"
}
```

Reload your shell:

```bash
source ~/.zshrc
```

or

```bash
source ~/.bashrc
```

---

## Option 2 — Install as a command in PATH

Create a script:

```bash
sudo nano /usr/local/bin/c
```

Paste:

```bash
#!/usr/bin/env bash

file="$1"

[ -z "$file" ] && echo "Usage: c file.c" && exit 1
[ ! -f "$file" ] && echo "File not found" && exit 1

output="${file%.c}"

gcc "$file" -Wall -Wextra -g -o "$output" && "./$output"
```

Make it executable:

```bash
sudo chmod +x /usr/local/bin/c
```

Now you can run:

```bash
c program.c
```

from anywhere.

---

# Why?

Just a tiny utility to remove friction when experimenting with small C programs.

Compile → run → repeat.

---
Made with <3 by URDev
