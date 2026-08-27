# Instalador del Antigravity Starter Kit para WINDOWS (PowerShell).
# Ejecutar en PowerShell:  powershell -ExecutionPolicy Bypass -File scripts\install.ps1
$ErrorActionPreference = "Stop"

Write-Host "==> Antigravity Starter Kit - instalacion (Windows)" -ForegroundColor Cyan

# 1) Node.js (para los MCP via npx)
if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Host "Node.js no encontrado. Instalalo desde https://nodejs.org (LTS) y vuelve a ejecutar." -ForegroundColor Yellow
    exit 1
}
Write-Host "   Node: $(node -v)"

# 2) uv (para el bridge de WhatsApp y utilidades Python)
if (-not (Get-Command uv -ErrorAction SilentlyContinue)) {
    Write-Host "==> Instalando uv..."
    powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
}

# 3) Playwright + navegadores
Write-Host "==> Instalando Playwright..."
npm install -g playwright
npx playwright install
Write-Host "   Playwright listo."

# 4) Copiar skills a %USERPROFILE%\.claude\skills
$SkillsSrc = Join-Path $PSScriptRoot "..\skills"
$SkillsDst = Join-Path $env:USERPROFILE ".claude\skills"
New-Item -ItemType Directory -Force -Path $SkillsDst | Out-Null
Write-Host "==> Copiando skills a $SkillsDst ..."
Copy-Item -Path (Join-Path $SkillsSrc "*") -Destination $SkillsDst -Recurse -Force
$count = (Get-ChildItem -Path $SkillsDst -Directory).Count
Write-Host "   $count skills instaladas."

# 5) Carpeta de credenciales
$CredDir = Join-Path $env:USERPROFILE ".mcp-credentials"
New-Item -ItemType Directory -Force -Path $CredDir | Out-Null

Write-Host ""
Write-Host "==> LISTO (paso base)." -ForegroundColor Green
Write-Host @"

Siguientes pasos MANUALES (ver README.md y docs\):
  1. Copia config\claude.json.template a %USERPROFILE%\.claude.json y rellena rutas/credenciales.
     OJO Windows: las rutas usan \\ dobles o / en el JSON, p.ej. "C:/Users/TU_USUARIO/credentials/..."
  2. Genera tus credenciales Google OAuth (docs\GOOGLE.md).
  3. Consigue tu token de Apify (docs\APIFY.md) - o usa login OAuth del MCP http.
  4. Configura el email IMAP (scripts\run-email.sh.template - en Windows usa Git Bash o adapta a .ps1).
  5. Arranca el bridge de WhatsApp (docs\WHATSAPP.md).
  6. Pon Antigravity en espanol (docs\IDIOMA-ESPANOL.md).

"@
