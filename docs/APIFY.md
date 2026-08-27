# Apify (web scraping / Actors)

El kit conecta Apify vía su **MCP oficial HTTP** (`https://mcp.apify.com`). Dos formas de autenticarte:

## Opción A — OAuth (recomendada, sin token en disco)
Deja el bloque tal cual en `.claude.json`:
```json
"apify": { "type": "http", "url": "https://mcp.apify.com" }
```
Al primer uso, Antigravity/Claude Code te pedirá autorizar en el navegador con tu cuenta Apify.

## Opción B — Token
1. Crea cuenta en [apify.com](https://apify.com) (hay plan gratis con créditos mensuales).
2. Consíguelo en **Console > Settings > Integrations > API token**.
3. Guárdalo en tu `.env` (`APIFY_TOKEN=`) o pásalo como header del MCP.

## Qué puedes hacer
- Buscar Actors: scrapers de Google Maps, Instagram, AutoScout24, idealista, LinkedIn, etc.
- Ejecutar un Actor con input y recoger el dataset de resultados.
- Usar proxy residencial cuando un portal capa el scraping.

Docs oficiales: https://docs.apify.com/platform/integrations/mcp
