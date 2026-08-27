# Playwright (automatización de navegador)

Playwright permite a Antigravity / Claude Code controlar un navegador real: rellenar formularios, hacer scraping de webs con login, capturar pantallas, subir archivos, etc.

## Instalación
```sh
npm install -g playwright
npx playwright install        # descarga Chromium, Firefox y WebKit
```
(El `scripts/install.sh` ya hace esto.)

## Uso típico
- Automatizar portales que capan el scraping simple (login manual + control por Playwright).
- Conectarse a un Chrome ya abierto con perfil logueado vía CDP:
  ```
  chromium --remote-debugging-port=9222 --user-data-dir=~/mi-perfil
  ```
  y luego `chromium.connectOverCDP('http://localhost:9222')` — útil cuando el sitio bloquea logins "frescos" automatizados.
- Grabar demos en vídeo (ver skill `playwright-recording`).

## Documentación
https://playwright.dev/docs/intro
