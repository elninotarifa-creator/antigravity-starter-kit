# Hablar por voz a Antigravity y Claude Code (Windows)

Objetivo: pulsar **un botón**, hablar en español, y que el texto se escriba solo en el chat de Antigravity o en el terminal de Claude Code. Funciona en cualquier campo de texto donde tengas el cursor.

Hay dos vías. La **A** es la recomendada (cero instalación).

---

## Opción A — Dictado nativo de Windows (Win + H) ✅ recomendada

Windows 11 trae dictado por voz integrado. Escribe directamente donde tengas el cursor.

1. Haz clic en el **cuadro de chat de Antigravity** (o en el terminal de Claude Code) para que ahí esté el cursor.
2. Pulsa **`Win + H`**.
3. Aparece la barra de dictado. **Habla en español** y el texto se escribe solo.
4. Pulsa `Win + H` otra vez (o di "detener dictado") para parar.

**Ponerlo en español:**
- Ajustes → *Hora e idioma* → *Idioma y región* → añade **Español (España)** si no está.
- En la barra de dictado, el idioma sigue al idioma de teclado activo (cámbialo con `Win + Barra espaciadora`).

**Que el micrófono esté permitido:**
- Ajustes → *Privacidad y seguridad* → *Micrófono* → activado para las apps.

> Requiere conexión a internet (usa el reconocimiento de voz de Microsoft). Es el más rápido de montar.

### Convertirlo en UN BOTÓN físico
Con el script `scripts/push-to-talk.ahk` (AutoHotkey) puedes disparar el dictado con **un solo botón** (por defecto, el **botón lateral del ratón**), sin acordarte del atajo. Ver "Instalación del botón" abajo.

---

## Opción B — Whisper local (privado, offline)

Si prefiere que la voz **no salga del ordenador** (100% local, sin internet), usa una app open source de dictado con Whisper y tecla rápida:

- **WhisperKey** — https://whisperkey.org (gratis, local, multiplataforma, pega en el campo activo)
- **OpenWhispr** — https://github.com/OpenWhispr/openwhispr (local con Whisper/Parakeet, hotkey)
- **faster-whisper-hotkey** — https://pypi.org/project/faster-whisper-hotkey/ (`pip install faster-whisper-hotkey`; mantienes pulsada PAUSA/F4/F8/INSERT mientras hablas)

Todas funcionan igual: eliges idioma **español**, asignas una **tecla**, y al hablar escriben en Antigravity/Claude Code. La primera vez descargan el modelo (mejor calidad = `medium` o `large-v3`; para PC modesto = `small`).

---

## Instalación del botón (AutoHotkey)

Para dejar el dictado en un botón cómodo:

1. Ejecuta el instalador de voz (instala AutoHotkey y deja el botón activo al arrancar Windows):
   ```powershell
   powershell -ExecutionPolicy Bypass -File scripts\voz-setup.ps1
   ```
2. A partir de ahí: pon el cursor en el chat de Antigravity y **pulsa el botón lateral del ratón** → habla → vuelve a pulsarlo para parar.

**Cambiar la tecla/botón:** abre `scripts/push-to-talk.ahk` con el Bloc de notas y descomenta la línea que prefieras (Ctrl derecho, Bloq Mayús, etc.).

---

## Resumen rápido

| Quiero… | Usa |
|---|---|
| Lo más rápido, sin instalar nada | **Win + H** (Opción A) |
| Un botón físico para hablar | `voz-setup.ps1` + `push-to-talk.ahk` |
| Que la voz no salga del PC (privado) | **Whisper local** (Opción B) |
