# Antigravity Starter Kit

Kit para montar desde cero un entorno de **Antigravity IDE + Claude Code** con todo el ecosistema de herramientas: **MCP de correo, Drive, Calendar, WhatsApp, Apify, Arcads**, **Playwright** para automatización de navegador y **55 skills** listas para usar.

> Pensado para que cualquiera pueda replicar el entorno en una máquina nueva.
> **No contiene ninguna credencial** — todo son plantillas con placeholders. Cada usuario genera las suyas.

---

## Qué incluye

| Bloque | Contenido |
|---|---|
| **MCP servers** | Gmail ×2, Google Drive ×2, Google Calendar ×2, Email IMAP/SMTP, WhatsApp, Apify, Arcads |
| **Playwright** | Automatización de navegador (scraping con login, capturas, demos) |
| **Skills** | 55 skills (creatividad, vídeo, IA, marketing, dev web, finanzas, SEO…) |
| **Config** | Plantillas sanitizadas de `.claude.json`, `.env`, OAuth de Google |
| **Docs** | Guías paso a paso por herramienta |

---

## Requisitos previos

- **macOS** (Apple Silicon recomendado) o Linux.
- [**Antigravity IDE**](https://antigravity.google) instalado.
- [**Claude Code**](https://docs.claude.com/en/docs/claude-code) (`npm install -g @anthropic-ai/claude-code`) y una cuenta de Anthropic.
- **Node.js LTS** y **Go** (solo para el bridge de WhatsApp).

---

## Instalación rápida

```sh
git clone <URL-DE-ESTE-REPO> antigravity-starter-kit
cd antigravity-starter-kit
bash scripts/install.sh
```

El script instala `uv`, **Playwright** + navegadores, y copia las **55 skills** a `~/.claude/skills`.

Después, configuración manual (una vez):

1. **MCP** → copia `config/claude.json.template` a `~/.claude.json` y rellena rutas/credenciales.
2. **Google** (Gmail/Drive/Calendar) → [`docs/GOOGLE.md`](docs/GOOGLE.md)
3. **Apify** → [`docs/APIFY.md`](docs/APIFY.md)
4. **WhatsApp** → [`docs/WHATSAPP.md`](docs/WHATSAPP.md)
5. **Email IMAP** → `scripts/run-email.sh.template`
6. **Playwright** → [`docs/PLAYWRIGHT.md`](docs/PLAYWRIGHT.md)

---

## Estructura

```
antigravity-starter-kit/
├── README.md
├── scripts/
│   ├── install.sh                 # instalador (Playwright + skills + deps)
│   └── run-email.sh.template      # wrapper del MCP de email IMAP
├── config/
│   ├── claude.json.template       # plantilla de ~/.claude.json (10 MCP)
│   ├── .env.example
│   └── gcp-oauth.keys.example.json
├── docs/
│   ├── GOOGLE.md · APIFY.md · WHATSAPP.md · PLAYWRIGHT.md
├── skills/                        # 55 skills (ver SKILLS.md)
└── SKILLS.md
```

---

## Seguridad

- El `.gitignore` bloquea `.env`, `*.pass`, `*-credentials.json`, `*-token.json`, `gcp-oauth.keys.json` y el `.claude.json` real.
- Las contraseñas de correo van en un fichero local `chmod 600`, **nunca** en el JSON de config.
- Cada usuario usa **sus propias** cuentas y tokens. Este repo no da acceso a nada de nadie.

---

## Créditos

Construido sobre proyectos open source: [whatsapp-mcp](https://github.com/lharries/whatsapp-mcp), los MCP de [@gongrzhe](https://www.npmjs.com/package/@gongrzhe/server-gmail-autoauth-mcp), [@isaacphi/mcp-gdrive](https://www.npmjs.com/package/@isaacphi/mcp-gdrive), [@cocal/google-calendar-mcp](https://www.npmjs.com/package/@cocal/google-calendar-mcp), [Apify MCP](https://docs.apify.com/platform/integrations/mcp) y [Playwright](https://playwright.dev).
