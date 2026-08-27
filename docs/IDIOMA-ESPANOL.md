# Poner Antigravity en español (Windows)

Antigravity es un IDE basado en VS Code, así que la interfaz se traduce igual: con un **pack de idioma** + ajuste de `locale`. El idioma tiene **3 capas independientes**; para tenerlo 100% en español hay que tocar las tres.

---

## Capa 1 — Interfaz (menús, botones, ajustes)

**Opción rápida (recomendada):**
1. Abre Antigravity.
2. Pulsa **`Ctrl + Shift + P`** (paleta de comandos).
3. Escribe **`Configure Display Language`** y pulsa Enter.
4. Elige **Español (es)**. Si no aparece, pulsa **"Install additional languages…"**, busca **"Spanish Language Pack"** (Spanish Language Pack for Visual Studio Code), instálalo y vuelve a elegirlo.
5. Reinicia Antigravity cuando lo pida. La interfaz queda en español.

**Opción manual (si la paleta falla):**
1. `Ctrl + Shift + P` → **`Configure Runtime Arguments`** (abre `argv.json`).
2. Añade esta línea:
   ```json
   { "locale": "es" }
   ```
3. Guarda y reinicia.
   - En Windows ese archivo está en: `%USERPROFILE%\.antigravity\argv.json`
     (si no existe, créalo con ese contenido).

---

## Capa 2 — Respuestas de la IA (el agente) en español

La interfaz en español **no** obliga al agente a responder en español. Para eso:

1. Abre los **Settings** de Antigravity (icono del engranaje) o `Ctrl + ,`.
2. Busca las **Reglas / Rules / Memories** del agente (según versión: "Rules", "Custom instructions" o "AI → Rules").
3. Añade una regla permanente:
   ```
   Responde siempre en español. Todos los mensajes, explicaciones y resúmenes en español,
   salvo identificadores de código y comandos de terminal.
   ```
> Alternativa: en Claude Code, añade esa instrucción a tu `~/.claude/CLAUDE.md` (Windows: `%USERPROFILE%\.claude\CLAUDE.md`). Así el asistente responde en español en cualquier proyecto.

---

## Capa 3 — Comentarios de código en español (opcional)

Si quieres que el agente **escriba comentarios y documentación en español**, añádelo a la misma regla:
```
Escribe los comentarios y la documentación de código en español (los nombres de
variables/funciones se mantienen en inglés si esa es la convención del repo).
```

---

## Resumen

| Capa | Dónde | Qué poner |
|---|---|---|
| Interfaz | `Ctrl+Shift+P` → Configure Display Language | Español (es) + Spanish Language Pack |
| Respuestas IA | Settings → Rules / `CLAUDE.md` | "Responde siempre en español" |
| Comentarios | misma regla | "Comentarios en español" |

Con las tres, Antigravity queda **completamente en español**: menús, respuestas del asistente y comentarios.
