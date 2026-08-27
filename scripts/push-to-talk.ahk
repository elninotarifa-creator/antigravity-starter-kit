#Requires AutoHotkey v2.0
; ============================================================
;  Push-to-talk para Antigravity / Claude Code
;  Pulsa el boton elegido -> abre el dictado por voz de Windows (Win+H).
;  El texto se escribe en el campo que tengas activo (chat de Antigravity,
;  terminal de Claude Code, o cualquier caja de texto).
;  Vuelve a pulsarlo para detener el dictado.
; ============================================================

; --- Disparador ACTIVO (por defecto: boton lateral del raton) ---
XButton1::Send("#h")

; --- Alternativas: comenta la linea de arriba y descomenta UNA de estas ---
; RCtrl::Send("#h")      ; Ctrl derecho
; CapsLock::Send("#h")   ; Bloq Mayus  (ojo: pierdes el uso normal de Bloq Mayus)
; Pause::Send("#h")      ; tecla Pausa/Inter

; Nota: "#h" significa Win+H. No cambies esa parte, es lo que abre el dictado.
