# StartupForensics

## 🔍 Überblick
**StartupForensics** ist ein Toolkit für die Untersuchung, Analyse und Bereinigung von Windows-Autostart-Einträgen. Es richtet sich an IT-Sicherheitsforscher, Systemadministratoren und Power-User, die unerwünschte oder verdächtige Startprogramme aufspüren und entfernen möchten.

---

## 📂 Inhaltsverzeichnis
1. [Ziele](#🎯 Ziele)
2. [Funktionen](#🔧 Funktionen)
3. [Installation](#installation)
4. [Anleitungen und Tools](#anleitungen-und-tools)
5. [Mitmachen](#mitmachen)
6. [Lizenz](#lizenz)

---

## 🎯 Ziele
- **Identifikation und Analyse:** Unerwünschte Autostart-Einträge aufspüren.
- **Verständnis schaffen:** Eine strukturierte Übersicht aller Windows-Startup-Orte.
- **Bereinigung:** Tools und Skripte zur Entfernung verdächtiger Einträge.

---

## 🔧 Funktionen
- **Cheat-Sheets:** Schnelle Referenzen zu Autostart-Orten (Registry, Task Scheduler, Dienste).
- **Beispielskripte:** PowerShell-Skripte zur automatisierten Analyse und Bereinigung.
- **Anleitungen:** Schritt-für-Schritt-Guides zur Identifikation von schädlichen Startprogrammen.
- **Tools-Empfehlungen:** Tipps zu Sysinternals-Tools wie Autoruns.

---

## 🚀 Installation
Klonen des Repositories:
```bash
git clone https://github.com/dein-benutzername/StartupForensics.git
```

Navigiere in das Verzeichnis:
```bash
cd StartupForensics
```

---

## 📘 Anleitungen und Tools
- **[Autostart Cheat Sheet](cheat-sheets/autostart_cheat_sheet.md):** Alle relevanten Autostart-Orte und ihre Verwaltung.
- **[Task Scheduler Cheat Sheet](cheat-sheets/task_scheduler_cheat_sheet.md):** Überblick über verdächtige Aufgaben im Windows-Taskplaner.
- **[Beispielskripte](scripts/):**
  - `cleanup_registry.ps1`: Entfernt bekannte bösartige Registry-Einträge.
  - `task_checker.ps1`: Listet und analysiert geplante Aufgaben.

---

## 🤝 Mitmachen
Beitragen ist willkommen! Folgende Möglichkeiten gibt es:
- Neue Anleitungen oder Skripte hinzufügen.
- Vorschläge für weitere Startup-Orte einbringen.
- Fehler melden (Issues).

Weitere Details findest du in der Datei [CONTRIBUTING.md](CONTRIBUTING.md).

---

## 📜 Lizenz
Dieses Projekt steht unter der MIT-Lizenz. Details findest du in der Datei [LICENSE](LICENSE).
