# Credenciales Google (Gmail · Drive · Calendar)

Los MCP de Gmail, Drive y Calendar usan **OAuth propio de cada usuario**. Cada persona genera las suyas — no se comparten.

## 1. Crear el OAuth Client ID

1. Entra en [Google Cloud Console](https://console.cloud.google.com/).
2. Crea un proyecto (o usa uno existente).
3. **APIs & Services > Enabled APIs** → activa: **Gmail API**, **Google Drive API**, **Google Calendar API**.
4. **APIs & Services > OAuth consent screen** → tipo *External*, añade tu correo como *Test user*.
5. **APIs & Services > Credentials > Create Credentials > OAuth client ID** → tipo **Desktop app**.
6. Descarga el JSON y guárdalo como `gcp-oauth.keys.json` (usa `config/gcp-oauth.keys.example.json` como referencia). **No lo subas a git.**

## 2. Autorizar cada cuenta

- **Gmail** (`@gongrzhe/server-gmail-autoauth-mcp`): la primera vez que arranca el MCP abre el navegador y te pide login; guarda el token en `GMAIL_CREDENTIALS_PATH`.
- **Drive** (`@isaacphi/mcp-gdrive`): pon `CLIENT_ID`/`CLIENT_SECRET` en el `.claude.json` y deja `GDRIVE_CREDS_DIR` a una carpeta vacía; autoriza al primer arranque.
- **Calendar** (`@cocal/google-calendar-mcp`): ejecuta `npx @cocal/google-calendar-mcp auth` para generar el token.

> Si tienes 2 cuentas Google (ej. personal + trabajo), duplica el bloque de cada MCP con rutas de credenciales distintas, como en la plantilla.

## Nota sobre caducidad

Mientras la *OAuth consent screen* esté en modo **Testing**, los refresh token de Calendar caducan a los **7 días**. Para uso continuo, publica la app (modo *In production*) o re-autoriza periódicamente.
