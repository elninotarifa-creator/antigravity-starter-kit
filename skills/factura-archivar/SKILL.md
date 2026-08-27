---
name: factura-archivar
description: Archiva una factura recibida por email o como PDF en el registro de facturas del CEO. Extrae emisor, número, fecha, importe, IVA, concepto y categoría; valida coherencia; añade la fila en la hoja de Drive y guarda el PDF en la carpeta correspondiente. Úsalo cuando el CEO diga "archiva esta factura", "registra esto", o reenvíe un PDF.
---

# Archivar factura

Convierte una factura en una fila bien estructurada del registro.

## Procedimiento

1. **Obtener el PDF**
   - Si viene como adjunto de email: `download_attachment` desde la cuenta correcta.
   - Si está en Drive: `gdrive_read_file`.
   - Si es local: lectura directa.

2. **Extraer campos obligatorios**
   ```
   - Emisor (razón social) + CIF
   - Número de factura
   - Fecha de emisión
   - Fecha de vencimiento (si aparece)
   - Base imponible
   - IVA (% y €)
   - IRPF (si aplica)
   - Total
   - Concepto (1 línea)
   - Categoría → elegir de la lista del CEO o preguntar
   ```

3. **Validaciones automáticas**
   - Total = Base + IVA - IRPF (margen ±0,02 €). Si no cuadra, **avisar y no archivar**.
   - CIF tiene formato válido (1 letra + 7 dígitos + control, o variantes).
   - Número de factura no duplicado en el registro (búsqueda previa en la hoja).

4. **Pregunta antes de escribir**
   ```
   Voy a archivar:
   - Emisor · Número · Fecha · Total · Categoría
   - Cuenta: [eln / soporte]
   ¿Confirmas?
   ```

5. **Escritura**
   - `gsheets_update_cell` en la hoja "Facturas [año]".
   - Una fila nueva en la primera fila vacía.
   - Si el CEO te indica carpeta de Drive para el PDF, lo apunta (el MCP actual no sube archivos a Drive — avísale).

## Categorías por defecto

`Software · Marketing · Viajes · Oficina · Asesoría · Servicios profesionales · Hosting/dominios · Hardware · Otros`

Si una factura no encaja, pregunta antes de inventar categoría nueva.

## Casos especiales

- **Factura rectificativa**: marca con flag, referencia la factura original.
- **Factura en otra moneda**: registra original + conversión al EUR a tipo del BCE del día de emisión (pregunta el tipo si no lo tienes).
- **Sin IVA (intracomunitaria)**: anótalo en columna "Notas".

## Antitokens
- No pegues el PDF entero. Solo los campos extraídos.
- Si la factura es ilegible (escaneo malo), pídela en mejor calidad antes de gastar tokens analizándola.
