---
name: secretos-keychain
description: Lee, guarda y borra credenciales del CEO en el llavero de macOS (Apple Keychain) usando el comando `security`. Úsalo cuando el CEO diga "guarda esta clave", "dame mi API key de X", "borra la contraseña de Y", o cuando un agente necesite una credencial para llamar a una API externa.
---

# Gestor de secretos en Apple Keychain

Apple Keychain es el llavero nativo de macOS. Acceso vía el comando `security`. **Las contraseñas no viven en archivos planos** — quedan cifradas en el llavero del sistema.

## Convención de nombres

Usamos siempre el mismo `account` para distinguir secretos del CEO:

- `account` = `ceo`
- `service` = identificador del secreto (ej. `stripe-api-key`, `openai-api-key`, `google-workspace-admin`, `meta-business-token`)

## Operaciones

### Guardar (o actualizar) un secreto

```bash
security add-generic-password -a "ceo" -s "<service>" -w "<valor>" -U
```

`-U` actualiza si ya existe. Si el CEO te pega un valor en chat, **guárdalo inmediatamente y luego borra el valor de tu respuesta** (no repitas el secreto en la respuesta).

### Leer un secreto

```bash
security find-generic-password -a "ceo" -s "<service>" -w
```

`-w` devuelve solo la contraseña, sin metadata. Útil para tubería:

```bash
export STRIPE_KEY=$(security find-generic-password -a "ceo" -s "stripe-api-key" -w)
```

### Listar todos los secretos del CEO

```bash
security dump-keychain | grep -A1 '"acct"<blob>="ceo"' | grep '"svce"'
```

### Borrar un secreto

```bash
security delete-generic-password -a "ceo" -s "<service>"
```

## Reglas duras

1. **NUNCA imprimas el valor del secreto en la respuesta al usuario.** Confirma "guardado: stripe-api-key" — no "guardado: sk_live_xxx".
2. **NUNCA escribas secretos en archivos** (.env, código, memoria, etc.). Solo en Keychain.
3. **NUNCA pidas al CEO que te pegue una contraseña en chat si puedes evitarlo.** Sugiere que la guarde él mismo: `security add-generic-password -a "ceo" -s "<service>" -w` (sin `-w VALOR` te pide la contraseña interactivamente y no queda en el historial).
4. Si el CEO te pide leer un secreto, **léelo y úsalo, no se lo muestres** salvo que insista explícitamente.
5. Antes de borrar, confirma cuál.

## Limitaciones

- **Solo funciona en este Mac.** No se sincroniza automáticamente a otros Macs salvo que tenga iCloud Keychain activado y los secretos sean tipo Internet (no generic password).
- **No multidispositivo a iPhone** para genéricos.
- Si necesita compartir secretos entre equipo o entre dispositivos → migrar a 1Password o Bitwarden.

## Catálogo recomendado de servicios

Cuando el CEO añada un secreto, sugiere usar uno de estos nombres si encaja:

| Service | Para qué |
|---|---|
| `stripe-api-key` | Stripe |
| `openai-api-key` | OpenAI |
| `anthropic-api-key` | Anthropic |
| `meta-business-token` | Meta Business / Ads |
| `google-workspace-admin` | Google Admin |
| `mailchimp-api-key` | Mailchimp |
| `linkedin-ads-token` | LinkedIn Ads |
| `cloudflare-api-token` | Cloudflare |
| `aws-access-key` / `aws-secret-key` | AWS |
| `nextaviation-imap-pass` | IMAP nextaviation.es |
