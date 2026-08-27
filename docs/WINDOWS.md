# Notas para Windows

El kit funciona en Windows con un par de ajustes respecto a Mac/Linux.

## Instalación

Usa el instalador de PowerShell en vez del `.sh`:
```powershell
powershell -ExecutionPolicy Bypass -File scripts\install.ps1
```
Instala `uv`, Playwright + navegadores y copia las 55 skills a `%USERPROFILE%\.claude\skills`.

## Rutas en `.claude.json` (importante)

En Windows, dentro del JSON usa barras normales `/` o barras dobles `\\` (nunca una sola `\`):

```json
"GMAIL_OAUTH_PATH": "C:/Users/TU_USUARIO/.claude/credentials/gcp-oauth.keys.json"
```

El `.claude.json` va en: `%USERPROFILE%\.claude.json` (ej. `C:\Users\TU_USUARIO\.claude.json`).

## `uv` para el MCP de WhatsApp

En Mac la plantilla usa `/opt/homebrew/bin/uv`. En Windows, tras instalar `uv`, pon la ruta que te devuelva `where uv`, por ejemplo:
```json
"whatsapp": {
  "command": "C:/Users/TU_USUARIO/.local/bin/uv.exe",
  "args": ["--directory", "C:/Users/TU_USUARIO/whatsapp-mcp/whatsapp-mcp-server", "run", "main.py"]
}
```

## Email IMAP

El wrapper `run-email.sh` es bash. En Windows tienes dos opciones:
- Instala **Git for Windows** y ejecútalo con **Git Bash**, o
- Pásalo a PowerShell (mismo concepto: lee la password de un fichero local y exporta `EMAIL_CREDENTIALS` antes de `npx -y @n24q02m/better-email-mcp`).

## Bridge de WhatsApp (Go)

Instala **Go** desde https://go.dev/dl/ y sigue `docs\WHATSAPP.md` igual (`go run main.go`). El QR se escanea desde el móvil.

## Idioma español

Sigue `docs\IDIOMA-ESPANOL.md` — el método (Ctrl+Shift+P → Configure Display Language) es idéntico en Windows.
