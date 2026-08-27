#!/bin/bash
# Instalador del Antigravity Starter Kit (macOS / Linux).
# Instala dependencias base, Playwright y copia las skills a ~/.claude/skills.
set -e

echo "==> Antigravity Starter Kit — instalacion"

# 1) Node.js (para los MCP via npx)
if ! command -v node >/dev/null 2>&1; then
  echo "Node.js no encontrado. Instalalo desde https://nodejs.org (LTS) y vuelve a ejecutar."
  exit 1
fi
echo "   Node: $(node -v)"

# 2) uv (para el bridge de WhatsApp y utilidades Python)
if ! command -v uv >/dev/null 2>&1; then
  echo "==> Instalando uv..."
  curl -LsSf https://astral.sh/uv/install.sh | sh
fi

# 3) Playwright + navegadores
echo "==> Instalando Playwright..."
npm install -g playwright >/dev/null 2>&1 || npm install -g playwright
npx playwright install
echo "   Playwright listo."

# 4) Copiar skills a ~/.claude/skills
SKILLS_SRC="$(cd "$(dirname "$0")/../skills" && pwd)"
SKILLS_DST="$HOME/.claude/skills"
mkdir -p "$SKILLS_DST"
echo "==> Copiando skills a $SKILLS_DST ..."
cp -R "$SKILLS_SRC"/* "$SKILLS_DST"/
echo "   $(ls -d "$SKILLS_DST"/*/ | wc -l | tr -d ' ') skills instaladas."

# 5) Preparar carpeta de credenciales
mkdir -p "$HOME/.mcp-credentials"
chmod 700 "$HOME/.mcp-credentials"

cat <<'EOF'

==> LISTO (paso base).

Siguientes pasos MANUALES (ver README.md y docs/):
  1. Copia config/claude.json.template a ~/.claude.json y rellena tus rutas/credenciales.
  2. Genera tus credenciales Google OAuth (docs/GOOGLE.md).
  3. Consigue tu token de Apify (docs/APIFY.md) — o usa login OAuth del MCP http.
  4. Configura el email IMAP (scripts/run-email.sh.template).
  5. Arranca el bridge de WhatsApp (docs/WHATSAPP.md).

EOF
