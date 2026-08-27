---
name: briefing-diario
description: Genera el briefing matutino del CEO. Cruza correo no leído de las últimas 24h, eventos del día en ambos calendarios, tareas pendientes y alertas financieras si las hay. Úsalo cuando el CEO diga "briefing", "qué tengo hoy", "buenos días", "resumen de la mañana".
---

# Briefing diario del CEO

Objetivo: en **≤ 60 segundos de lectura**, el CEO sabe qué pasa hoy y qué requiere su atención.

## Procedimiento

Ejecuta estos pasos en paralelo donde sea posible:

1. **Agenda del día** (vía agente `ceo-agenda`):
   - `gcal-eln` + `gcal-soporte`, rango = hoy 00:00 → 23:59.
   - Marca primer evento, conflictos y reuniones con preparación pendiente.

2. **Correo prioritario** (vía agente `ceo-inbox`):
   - Las 3 cuentas: `gmail-eln`, `gmail-soporte`, `email-jaime`.
   - Filtra `is:unread newer_than:1d`.
   - Devuelve solo 🔴 urgentes y 🟡 importantes (máx 5 totales).

3. **Pendientes** (si el CEO usa una hoja "Tareas" en Drive):
   - `gdrive_search` por "Tareas CEO" o lo que él indique.
   - Top 3 tareas con vencimiento ≤ 48h.

4. **Alerta financiera** (opcional, solo si hay hoja "KPIs diarios"):
   - Pregunta al CEO si quiere incluir esto la primera vez. Si dice sí, persistir en memoria como preferencia.

## Formato de salida

```
☀ Briefing — [fecha en español]

📅 HOY ([N] eventos)
  HH:MM · título · ⚠ si necesita prep
  HH:MM · ...

📧 BANDEJA (X 🔴 · Y 🟡)
  🔴 remitente — asunto (acción)
  🟡 ...

✅ PENDIENTES
  · tarea (vence DD/MM)
  · ...

⚡ Hoy debes
  1. [acción más importante en 1 línea]
  2. ...
  3. ...
```

## Reglas

- **Máx 1 pantalla**. Si hay más cosas, ofrece "¿Quieres ver el detalle de X?".
- **No envíes correos ni crees eventos** durante el briefing — es solo lectura.
- Si una de las fuentes falla (OAuth caducado, etc.), informa en una línea y sigue con el resto.
