# WhatsApp Setup – Configured for You

## What Was Done

1. **TeleCode AI WhatsApp enabled** in Cursor settings  
   - `telecode.whatsapp.enabled: true`  
   - `telecode.whatsapp.allowSelfCommands: true`  
   - `telecode.whatsapp.accessMode: "self"` (only you can command)

2. **Shortcuts added**
   - **Ctrl+Alt+W** – Chonky RemotePilot: Configure WhatsApp  
   - **Ctrl+Shift+Alt+W** – TeleCode AI: Open Chat  

---

## Option A: Chonky RemotePilot (Installed)

1. Press **Ctrl+Alt+W** to run Configure WhatsApp (or **Ctrl+Shift+P** → "Configure WhatsApp")
2. **Open the Integrated Terminal first** (**Ctrl+`**) – the QR often appears there
3. Run Configure WhatsApp again
4. In Cursor Chat (Composer), type: **chonky listen**
5. Scan the QR with WhatsApp (Settings → Linked Devices)
6. Send a message to yourself on WhatsApp and enter the 6-digit code

---

## Option B: TeleCode AI (QR in Chat – requires install)

TeleCode shows the QR **inside the Chat panel**. To use it:

1. Build and install TeleCode from this workspace: run `.\build-and-install.ps1` with Cursor closed
2. Or press **F5** in this workspace to run it in development mode
3. Click **TeleCode AI** in the Activity Bar → **Start TeleCode**
4. The QR will appear directly in the Chat logs – easy to scan

---

## Notes

- For **TeleCode AI**, the extension must be installed and running. If you are in the TeleCode workspace, use **Run → Run Extension** (F5) to load it for development.
- For **Chonky**, it connects to Cursor’s AI Chat (Composer), not TeleCode’s agent.
