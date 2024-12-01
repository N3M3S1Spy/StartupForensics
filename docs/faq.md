# ❓ Häufig gestellte Fragen (FAQ)

Hier findest du Antworten auf häufige Fragen rund um **StartupForensics** und die Analyse von Windows-Startup-Einträgen.

---

## 🛠️ Allgemeine Fragen

### **Was ist StartupForensics?**
StartupForensics ist ein Toolkit für die Analyse und Bereinigung von Windows-Startup-Einträgen. Es hilft, unerwünschte Autostart-Programme zu identifizieren und zu entfernen.

---

### **Warum ist mein Computer langsam beim Starten?**
Langsame Startzeiten können durch viele Autostart-Programme verursacht werden. Viele Programme fügen sich automatisch in die Registry oder andere Autostart-Orte ein, was die Ladezeit erhöht.

---

### **Wie gefährlich sind verdächtige Autostart-Einträge?**
Einträge in Autostart-Orten können:
- **Unschädlich** sein (z. B. Treiber oder legitime Programme).
- **Nervig** sein (z. B. unnötige Hintergrundprogramme).
- **Gefährlich** sein (z. B. Malware oder Trojaner, die sich bei jedem Start aktivieren).

---

### **Welche Autostart-Orte sollte ich immer überprüfen?**
Die wichtigsten Orte sind:
- **Registry**: `HKEY_CURRENT_USER\...\Run` und `HKEY_LOCAL_MACHINE\...\Run`.
- **Taskplaner**: Geplante Aufgaben, die beim Systemstart ausgeführt werden.
- **Autostart-Ordner**: `C:\Users\<Benutzername>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`.

Siehe auch das [Autostart Cheat Sheet](../cheat-sheets/autostart_cheat_sheet.md).

---

## 🔧 Tools und Skripte

### **Welche Tools sind empfehlenswert?**
Einige der besten Tools zur Analyse und Bereinigung:
1. **Autoruns (Sysinternals):** Zeigt alle Autostart-Einträge übersichtlich an.
2. **PowerShell:** Für automatisierte Analysen (siehe unsere [Skripte](../scripts/)).
3. **CCleaner:** Für einfache Autostart-Verwaltung (vorsichtig nutzen).

---

### **Kann ich StartupForensics auf Windows 10/11 verwenden?**
Ja, alle Anleitungen, Skripte und Tools sind mit Windows 10 und 11 kompatibel.

---

### **Wie führe ich ein PowerShell-Skript aus?**
1. Öffne PowerShell als Administrator.
2. Setze die Ausführungsrichtlinie auf "Bypass":
   ```powershell
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
   ```
3. Führe das Skript aus:
   ```powershell
   .\cleanup_registry.ps1
   ```

---

### **Was mache ich, wenn mein Computer nach der Bereinigung nicht mehr startet?**
1. Starte den Computer im **abgesicherten Modus**:
   - Drücke während des Bootvorgangs `F8` (oder halte `Shift` und klicke auf "Neustart").
2. Stelle die Registry mithilfe deiner Sicherungsdatei wieder her.
3. Nutze einen Systemwiederherstellungspunkt (falls verfügbar).

---

## 🔍 Verdächtige Einträge

### **Wie erkenne ich, ob ein Eintrag gefährlich ist?**
Prüfe Folgendes:
1. **Programmpfad**: Legitime Programme befinden sich in bekannten Ordnern (z. B. `C:\Program Files`).
2. **Dateiname**: Ungewöhnliche oder generische Namen wie `abc123.exe` oder `svchost.exe` im falschen Verzeichnis sind verdächtig.
3. **Recherche**: Suche den Namen und den Pfad online, um weitere Informationen zu erhalten.

---

### **Wie entferne ich Malware aus Autostart-Einträgen?**
1. Nutze ein Tool wie **Autoruns**, um den Eintrag zu deaktivieren.
2. Entferne die Datei an ihrem Speicherort.
3. Scanne dein System mit einem Antivirenprogramm.

---

### **Was ist der Unterschied zwischen `Run` und `RunOnce` in der Registry?**
- **`Run`**: Programme, die bei jedem Start ausgeführt werden.
- **`RunOnce`**: Programme, die nur einmal ausgeführt werden und sich danach automatisch entfernen.

---

## 🤝 Mitmachen

### **Wie kann ich zum Projekt beitragen?**
Du kannst:
1. Neue Anleitungen oder Skripte erstellen.
2. Fehler oder Sicherheitslücken melden (über Issues in GitHub).
3. Feedback und Vorschläge für Verbesserungen einreichen.

---

### **Wo melde ich Probleme oder Vorschläge?**
Öffne ein Issue im [GitHub-Repository](https://github.com/N3M3S1Spy/StartupForensics).

---

## 📜 Schlusswort
Noch Fragen? Stelle sie in unserem Issue-Bereich oder kontaktiere uns direkt über das Repository! Gemeinsam machen wir Windows-Startups sicherer. 🚀
