# WhatsApp MCP (bridge)

Permite leer y enviar mensajes de WhatsApp desde Antigravity / Claude Code. Se apoya en el proyecto open source [`whatsapp-mcp`](https://github.com/lharries/whatsapp-mcp) (bridge Go con `whatsmeow` + servidor MCP Python).

## Instalación

```sh
git clone https://github.com/lharries/whatsapp-mcp ~/whatsapp-mcp
cd ~/whatsapp-mcp/whatsapp-bridge

# 1) Arranca el bridge Go (genera un QR la primera vez)
go run main.go
# Escanea el QR con: WhatsApp movil > Dispositivos vinculados > Vincular dispositivo
```

El bridge:
- Mantiene la sesión en una **SQLite local** (mensajes e historial).
- Expone una API REST en `http://localhost:8080` para enviar mensajes.

## Conectar el MCP

En tu `.claude.json`, el servidor `whatsapp` apunta al `whatsapp-mcp-server`:
```json
"whatsapp": {
  "command": "/opt/homebrew/bin/uv",
  "args": ["--directory", "/RUTA/A/whatsapp-mcp/whatsapp-mcp-server", "run", "main.py"]
}
```
Ajusta la ruta `--directory` a donde lo hayas clonado.

## Notas
- El bridge Go tiene que estar **corriendo** para que haya mensajes que leer/enviar.
- Enviar mensaje por REST directo:
  `curl -X POST http://localhost:8080/api/send -H "Content-Type: application/json" -d '{"recipient":"34XXXXXXXXX","message":"hola"}'`
- La sesión se puede caer si se reinicia la máquina; vuelve a arrancar el bridge Go.
