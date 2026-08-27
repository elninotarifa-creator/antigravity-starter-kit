# Configura el control por voz (dictado) para Antigravity / Claude Code en WINDOWS.
# - Comprueba/activa el dictado nativo (Win+H)
# - Instala AutoHotkey
# - Deja el "boton para hablar" (push-to-talk.ahk) corriendo al arrancar Windows
#
# Ejecutar:  powershell -ExecutionPolicy Bypass -File scripts\voz-setup.ps1
$ErrorActionPreference = "Stop"

Write-Host "==> Configuracion de control por voz (Windows)" -ForegroundColor Cyan

# 1) Micrófono: abrir ajustes de privacidad para que el usuario confirme acceso
Write-Host "==> Abriendo ajustes de microfono (deja el acceso ACTIVADO para las apps)..."
Start-Process "ms-settings:privacy-microphone"

# 2) Recordatorio del idioma
Write-Host "   Asegurate de tener 'Espanol (Espana)' en Ajustes > Hora e idioma > Idioma."

# 3) Instalar AutoHotkey v2 (para el boton push-to-talk)
if (-not (Get-Command AutoHotkey.exe -ErrorAction SilentlyContinue) -and
    -not (Test-Path "$env:ProgramFiles\AutoHotkey\v2\AutoHotkey.exe")) {
    Write-Host "==> Instalando AutoHotkey v2 con winget..."
    try {
        winget install --id AutoHotkey.AutoHotkey -e --accept-source-agreements --accept-package-agreements
    } catch {
        Write-Host "   No se pudo instalar por winget. Descargalo a mano: https://www.autohotkey.com/" -ForegroundColor Yellow
    }
}

# 4) Copiar el script push-to-talk a la carpeta de Inicio (arranca con Windows)
$ahkSrc = Join-Path $PSScriptRoot "push-to-talk.ahk"
$startup = [Environment]::GetFolderPath("Startup")
Copy-Item -Path $ahkSrc -Destination $startup -Force
Write-Host "==> push-to-talk.ahk copiado a Inicio: $startup"

# 5) Lanzarlo ya
Write-Host "==> Activando el boton de voz ahora..."
try { Start-Process -FilePath $ahkSrc } catch {
    Write-Host "   Si no arranca, haz doble clic en push-to-talk.ahk tras instalar AutoHotkey." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "==> LISTO. Como usarlo:" -ForegroundColor Green
Write-Host "   1. Haz clic en el chat de Antigravity (o en el terminal de Claude Code)."
Write-Host "   2. Pulsa el BOTON LATERAL DEL RATON (o Win+H) y habla en espanol."
Write-Host "   3. Pulsa otra vez para parar. El texto se escribe solo."
Write-Host ""
Write-Host "   Cambiar la tecla/boton: edita scripts\push-to-talk.ahk (ver docs\VOZ.md)."
