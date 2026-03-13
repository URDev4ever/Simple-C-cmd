<p align="center">
  🇺🇸 <a href="README.md"><b>English</b></a> |
  🇪🇸 <a href="README_ES.md">Español</a>
</p>

# Comando `C` Simple

Pequeño helper de shell para **compilar y ejecutar programas en C rápidamente** desde la terminal.

En lugar de ejecutar `gcc` manualmente cada vez, esta función compila un archivo `.c` y ejecuta inmediatamente el binario resultante.

## Uso

```bash
c program.c
```

Esto hará:

1. Compilar el archivo con `gcc`
2. Activar advertencias útiles (`-Wall -Wextra`)
3. Incluir símbolos de depuración (`-g`)
4. Ejecutar el binario compilado

Ejemplo:

```bash
c hello.c
```

---

# Requisitos

Necesitás:

* **gcc**
* una **shell POSIX** (bash / zsh)

Instalá gcc si no lo tenés.

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

# Instalación

## Opción 1 — Agregar a la configuración de tu shell (recomendado)

Copiá la función dentro de tu archivo de configuración de shell.

Para **bash**:

```bash
~/.bashrc
```

Para **zsh**:

```bash
~/.zshrc
```

Luego pegá:

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

Recargá tu shell:

```bash
source ~/.zshrc
```

o

```bash
source ~/.bashrc
```

---

## Opción 2 — Instalar como comando en el PATH

Creá un script:

```bash
sudo nano /usr/local/bin/c
```

Pegá:

```bash
#!/usr/bin/env bash

file="$1"

[ -z "$file" ] && echo "Usage: c file.c" && exit 1
[ ! -f "$file" ] && echo "File not found" && exit 1

output="${file%.c}"

gcc "$file" -Wall -Wextra -g -o "$output" && "./$output"
```

Hacelo ejecutable:

```bash
sudo chmod +x /usr/local/bin/c
```

Ahora podés ejecutar:

```bash
c program.c
```

desde cualquier lugar.

---

# ¿Por qué?

Solo una pequeña utilidad para eliminar fricción al experimentar con programas pequeños en C.

Compilar → ejecutar → repetir.

---

Hecho con <3 por URDev.
