---
name: resumen-reunion
description: Procesa la transcripción o las notas de una reunión y genera minutas accionables con decisiones, tareas asignadas, riesgos y seguimiento. Úsalo cuando el CEO te pase un archivo de transcripción, te diga "resúmeme esta reunión", "qué se acordó", o cuando vea una nota tipo "Notas reunión [fecha]" en Drive.
---

# Resumen de reunión

Convierte audio/texto crudo en minutas que valen para enviar y archivar.

## Inputs aceptados

- Transcripción pegada en el chat
- Ruta a archivo local (.txt, .md, .vtt, .srt)
- Documento en Drive (usa `gdrive_read_file`)
- Notas manuales del CEO

Si llega audio sin transcribir, **pide la transcripción** — no podemos procesar audio directo.

## Estructura de minuta (siempre la misma)

```
📋 [Título de la reunión] — [Fecha] — [Duración]

👥 Asistentes
  · Nombre (rol)

🎯 Objetivo de la reunión
[1 frase]

✅ Decisiones tomadas
  1. ...
  2. ...

📌 Tareas asignadas
  | # | Tarea | Responsable | Vence | Estado |
  |---|-------|-------------|-------|--------|

❓ Temas abiertos
  · Pregunta + quién la responde + cuándo

⚠ Riesgos / atención
  · ...

📅 Próxima reunión
[Fecha tentativa o "no fijada"]
```

## Reglas de extracción

1. **Decisión ≠ comentario**. Solo registra una decisión si hay verbo de cierre ("acordamos", "vamos con", "queda aprobado") o silencio aceptado tras propuesta.
2. **Tarea sin responsable = pregunta abierta**. Si nadie se hizo cargo, va a "Temas abiertos", no a "Tareas".
3. **Vence "ASAP" no existe**. Si no hay fecha, anota "sin fecha" y márcalo como riesgo si es crítico.
4. **Citas literales solo para puntos polémicos**. El resto, parafrasea conciso.

## Acciones post-minuta (opcionales, solo si el CEO lo pide)

- Crear eventos en `gcal` para los seguimientos.
- Enviar la minuta por email a los asistentes (vía `ceo-inbox`, **con confirmación**).
- Registrar las tareas en la hoja "Tareas CEO" de Drive.

## Antitokens

- No pegues la transcripción de vuelta. Solo el resumen.
- Si la reunión duró >2h, ofrece "resumen de 1 página" vs "minuta completa" y deja que el CEO elija.
