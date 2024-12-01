# Scripts Documentation

Dieser Ordner enthält PowerShell- und Batch-Skripte, die für die Analyse, Bereinigung und Überwachung von verdächtigen Aktivitäten auf einem Windows-System entwickelt wurden. Die Skripte sind darauf ausgelegt, Autostart-Einträge, Registrierungswerte und geplante Aufgaben zu prüfen und zu bereinigen.

---

## Übersicht der Skripte

### 1. **advanced_cleanup_registry.ps1**
- **Beschreibung**:  
  Ein fortschrittliches PowerShell-Skript, das umfassende Bereinigungsaufgaben in der Registrierung durchführt und dabei modernste Techniken anwendet.
- **Funktionen**:
  - Automatisierte Suche nach Anomalien in Autostart-Bereichen.
  - Sicherungen der Registrierung vor Änderungen.
  - Optimierte Bereinigung auf Grundlage von Sicherheitsrichtlinien.
- **Anwendung**:
  ```powershell
  powershell -ExecutionPolicy Bypass -File advanced_cleanup_registry.ps1
  ```
- **Hinweis**: Dieses Skript ist für fortgeschrittene Benutzer gedacht und sollte mit Vorsicht verwendet werden.

---

### 2. **task_checker.ps1**
- **Beschreibung**:  
  Dieses PowerShell-Skript analysiert geplante Aufgaben (Tasks) auf dem System und identifiziert potenziell schädliche oder unbekannte Aufgaben.
- **Funktionen**:
  - Listet alle geplanten Aufgaben auf.
  - Vergleicht sie mit einer Liste bekannter verdächtiger Aufgaben.
  - Generiert einen Bericht mit den Ergebnissen.
- **Anwendung**:
  ```powershell
  powershell -ExecutionPolicy Bypass -File task_checker.ps1
  ```
- **Hinweis**: Überprüfen Sie die Ausgabe sorgfältig, bevor Sie Änderungen an den Aufgaben vornehmen.

---

### 3. **example.bat**
- **Beschreibung**:  
  Ein Beispiel-Batch-Skript, das als Vorlage für benutzerdefinierte Automatisierungsaufgaben verwendet werden kann.
- **Funktionen**:
  - Führt grundlegende Prüfungen durch (z. B. Systeminformationen abrufen).
  - Zeigt, wie benutzerdefinierte Batch-Befehle in Workflows integriert werden können.
- **Anwendung**:
  ```cmd
  example.bat
  ```
- **Empfehlung**: Passen Sie das Skript an Ihre spezifischen Bedürfnisse an, bevor Sie es ausführen.

---

## Voraussetzungen
1. **PowerShell**: Mindestens Version 5.1 ist erforderlich, um PowerShell-Skripte auszuführen.
2. **Administratorrechte**: Einige Skripte benötigen erhöhte Rechte, um auf Systembereiche zugreifen zu können.
3. **Backup**: Erstellen Sie vor der Ausführung der Skripte ein vollständiges System-Backup, um unerwünschte Änderungen rückgängig machen zu können.

---

## Sicherheitsmaßnahmen
- Überprüfen Sie den Code der Skripte, bevor Sie sie ausführen.
- Führen Sie die Skripte auf einer Testumgebung aus, um die Auswirkungen zu beurteilen.
- Stellen Sie sicher, dass Ihr Antivirenprogramm aktuell ist, um mögliche Bedrohungen zu erkennen.

---

## Support
Falls Sie Fragen oder Probleme bei der Verwendung dieser Skripte haben, können Sie ein [Issue](https://github.com/) im Repository erstellen. Bitte geben Sie genaue Details zu Ihrem Problem an, um eine schnelle Unterstützung zu gewährleisten.

---

## Lizenz
Dieses Projekt steht unter der [MIT-Lizenz](../LICENSE), die die Nutzung, Änderung und Weitergabe der Skripte erlaubt.

---

Vielen Dank für die Nutzung der Tools aus dem `StartupForensics`-Projekt!
```

### Wichtige Hinweise:
- Die **Backup-Empfehlung** und Sicherheitsmaßnahmen sind essenziell, um potenzielle Risiken durch die Skriptanwendung zu minimieren.
- Die **Support-Sektion** hilft Nutzern bei der Fehlersuche und Verbesserung der Skripte.
