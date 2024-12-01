# 🛠️ Registry Cleanup Guide

## 🔍 Überblick
Die Windows-Registry ist ein kritischer Bestandteil des Betriebssystems. Viele Programme (und Malware) nutzen Registry-Schlüssel, um automatisch beim Systemstart ausgeführt zu werden. Dieses Dokument hilft dir, verdächtige Einträge zu identifizieren und sicher zu bereinigen.

---

## ⚠️ **Warnung**
Das Bearbeiten der Registry kann schwerwiegende Auswirkungen auf dein System haben, wenn es falsch gemacht wird. Stelle sicher, dass du:
1. **Einen Wiederherstellungspunkt erstellst**:
   - `Win + S` > "Wiederherstellungspunkt erstellen" > [Erstellen].
2. **Die Registry vor Änderungen sicherst**:
   - `Win + R` > `regedit` > Datei > Exportieren.

---

## 📂 Wichtige Autostart-Orte in der Registry
Hier sind die häufigsten Registry-Schlüssel, die Programme für Autostart verwenden:

### Für den aktuellen Benutzer:
```plaintext
HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run
HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce
```

### Für alle Benutzer:
```plaintext
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce
```

### Weitere Orte (selten):
```plaintext
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services
HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run
```

---

## 🕵️ Verdächtige Einträge erkennen
Achte bei der Analyse auf:
- **Unbekannte Programme**: Überprüfe den Namen und die Datei mit einer Suchmaschine.
- **Ungültige Pfade**: Zeigt der Pfad auf eine nicht existierende Datei?
- **Verschleierte Namen**: Z. B. `svchost.exe` im falschen Verzeichnis.
- **Hex-Werte**: Einträge, die keine klaren Zeichenfolgen oder Pfade sind.

---

## 🚀 Schritt-für-Schritt-Anleitung
### 1. Registry-Editor öffnen
- Drücke `Win + R` und gib `regedit` ein.

### 2. Navigiere zu den Autostart-Schlüsseln
- Kopiere die oben genannten Pfade und füge sie in die Adressleiste ein.

### 3. Einträge überprüfen
- Rechtsklicke auf einen Eintrag > **Bearbeiten**.
- Überprüfe den Wert (Pfad/Programmname).

### 4. Verdächtige Einträge entfernen
- Rechtsklicke auf den Eintrag > **Löschen**.
- **Tipp:** Dokumentiere, was du löschst, falls es Probleme gibt.

---

## 🛡️ Automatisierte Analyse mit PowerShell
### Skript: `cleanup_registry.ps1`
Das folgende PowerShell-Skript listet alle Einträge in den Autostart-Schlüsseln auf:

```powershell
$keys = @(
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\RunOnce",
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run",
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce"
)

foreach ($key in $keys) {
    Write-Host "Checking Registry Key: $key" -ForegroundColor Cyan
    try {
        Get-ItemProperty -Path $key | ForEach-Object {
            $_ | Get-Member -MemberType NoteProperty | ForEach-Object {
                Write-Host "`t$($_.Name) = $($_.Definition)" -ForegroundColor Yellow
            }
        }
    } catch {
        Write-Host "Failed to access $key" -ForegroundColor Red
    }
}
```

- Speichere das Skript als `cleanup_registry.ps1` und führe es in PowerShell aus:
  ```bash
  powershell -ExecutionPolicy Bypass -File cleanup_registry.ps1
  ```

---

## 🛠️ Tools zur Unterstützung
1. **[Autoruns von Sysinternals](https://learn.microsoft.com/en-us/sysinternals/downloads/autoruns):** Zeigt alle Autostart-Einträge übersichtlich an.
2. **[CCleaner](https://www.ccleaner.com/):** Bietet einfache Autostart-Verwaltung (aber vorsichtig verwenden).

---

## ❓ Häufige Fragen
### Was passiert, wenn ich etwas Falsches lösche?
- Stelle die Registry mit der exportierten Datei wieder her: Doppelklicke auf die Sicherungsdatei und bestätige.

### Wie erkenne ich legitime Einträge?
- Suche den Programmnamen oder den Pfad in einer Suchmaschine.
- Bekannte Einträge wie Antivirus-Programme oder Treiberprozesse sind normalerweise sicher.

---

## 📜 Fazit
Die Bereinigung der Registry ist ein mächtiges Werkzeug, um Startup-Probleme zu lösen und potenzielle Sicherheitsrisiken zu minimieren. Gehe jedoch vorsichtig vor und setze auf automatisierte Tools, um Fehler zu vermeiden.
