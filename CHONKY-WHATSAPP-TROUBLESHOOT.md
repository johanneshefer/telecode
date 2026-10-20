# Chonky RemotePilot – WhatsApp QR Code Not Showing

The extension uses `qrcode-terminal`, which typically prints the QR code to **stdout**. That can appear in different places depending on how Cursor runs the extension.

## Where to look for the QR code

Try these locations in order:

### 1. Integrated Terminal
- **Ctrl+`** (or **View → Terminal**) to open a terminal.
- Run: **Ctrl+Shift+P** → `Chonky RemotePilot: Configure WhatsApp`
- Check if the QR code appears as ASCII art in the terminal.

### 2. Output panel
- **View → Output** (or **Ctrl+Shift+U**)
- In the dropdown, select **Chonky RemotePilot**
- If it’s not listed, try **Tasks** or **Extension Host**
- Run the Configure command again and watch for new output

### 3. Developer console
- **Help → Toggle Developer Tools**
- Open the **Console** tab
- Run the Configure command and look for QR output or errors

### 4. New terminal before configuring
- Open a **new** terminal: **Terminal → New Terminal**
- Run: **Ctrl+Shift+P** → `Chonky RemotePilot: Configure WhatsApp`
- The QR may be shown in that terminal

## Required order of steps

1. Open **Cursor Chat** (Composer) – the main AI chat panel.
2. Run **Chonky RemotePilot: Configure WhatsApp**.
3. Look in Terminal, Output, and Console for the QR code.
4. In Cursor Chat, type: **chonky listen** or **start remote pilot**.
5. Scan the QR code with WhatsApp (Settings → Linked Devices → Link a device).

## If still no QR code

- **Reload Cursor**: **Ctrl+Shift+P** → **Developer: Reload Window**
- **Restart Cursor**
- Check **Output → Extension Host** for errors when you run the Configure command
- Check Cursor uses the same “VS Code Chat” model that Chonky expects; some Cursor setups may differ

## Cursor vs VS Code Chat

Chonky is built for **VS Code Copilot Chat**. Cursor uses Composer, which may behave differently. If the QR never appears, Chonky may not be fully compatible with Cursor’s chat system.

## Alternative: TeleCode AI

If Chonky doesn’t work well with Cursor, the **TeleCode AI** extension in this workspace has built‑in WhatsApp support that is designed for this type of setup.
