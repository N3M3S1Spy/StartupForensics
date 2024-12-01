# Tools List

## Übersicht

In diesem Dokument findest du eine detaillierte Liste von Tools, die dir helfen können, Autostart-Programme, verdächtige Prozesse, Registry-Einträge, geplante Aufgaben und mehr zu analysieren und zu verwalten. Diese Tools sind besonders nützlich in Sicherheitsforensik- und Systemhärtungsprozessen.

## 1. Autoruns (Sysinternals)

- **Beschreibung:** Autoruns ist ein leistungsstarkes Tool von Sysinternals, das alle Autostart-Programme und -Dienste auf einem Windows-System aufzeigt und es ermöglicht, diese zu deaktivieren oder zu entfernen.
- **Verwendung:** Besonders nützlich für die Analyse von Autostart-Programmen aus verschiedenen Quellen wie dem Windows-Registry, dem Taskplaner, Startup-Ordnern und mehr.
- **Download:** [Autoruns von Sysinternals](https://docs.microsoft.com/en-us/sysinternals/downloads/autoruns)
- **Besondere Funktionen:**
  - Vollständige Übersicht über Autostart-Programme.
  - Unterstützung für das Deaktivieren und Löschen von Autostart-Einträgen.
  - Erkennung von verdächtigen Prozessen und Dateipfaden.

## 2. Process Explorer (Sysinternals)

- **Beschreibung:** Ein weiteres Tool von Sysinternals, das detaillierte Informationen über alle aktuell laufenden Prozesse auf deinem System bietet.
- **Verwendung:** Ideal für die Überprüfung von Systemprozessen, die beim Starten des Systems oder zu einem späteren Zeitpunkt ausgeführt werden.
- **Download:** [Process Explorer von Sysinternals](https://docs.microsoft.com/en-us/sysinternals/downloads/process-explorer)
- **Besondere Funktionen:**
  - Zeigt detaillierte Prozessinformationen und Hierarchien an.
  - Ermöglicht die Suche nach versteckten Prozessen oder Prozessen, die von Malware manipuliert werden.

## 3. HijackThis

- **Beschreibung:** Ein klassisches Tool, das häufig von Sicherheitsexperten verwendet wird, um verdächtige Autostart-Einträge zu identifizieren.
- **Verwendung:** Scannt die Registry und andere Bereiche des Systems nach verdächtigen Autostart-Einträgen.
- **Download:** [HijackThis](https://www.trendmicro.com/en_us/forHome/products/hijackthis.html)
- **Besondere Funktionen:**
  - Bietet detaillierte Log-Dateien über Autostart-Einträge.
  - Hilfreich für die Identifizierung und das Entfernen von bösartigen Einträgen.

## 4. CCleaner

- **Beschreibung:** Ein Tool zur Systemoptimierung, das auch Autostart-Programme analysieren und entfernen kann.
- **Verwendung:** Ideal für das Entfernen von unerwünschten Programmen, die beim Systemstart geladen werden.
- **Download:** [CCleaner](https://www.ccleaner.com/)
- **Besondere Funktionen:**
  - Entfernen von temporären Dateien und Bereinigung der Registry.
  - Verwaltung von Autostart-Programmen und Diensten.

## 5. Task Scheduler (Windows)

- **Beschreibung:** Der integrierte Taskplaner von Windows ermöglicht es, geplante Aufgaben zu erstellen und zu überwachen.
- **Verwendung:** Nutze den Taskplaner, um alle geplanten Aufgaben zu überprüfen, die beim Systemstart oder zu bestimmten Zeitpunkten ausgeführt werden.
- **Zugriff:** Öffne den Taskplaner über das Startmenü und suche nach Aufgaben, die unerwünschte Programme starten.
- **Besondere Funktionen:**
  - Überwachung geplanter Aufgaben, die bei Anmeldung oder beim Systemstart ausgeführt werden.
  - Filterung und Bearbeitung von geplanten Aufgaben.

## 6. Windows Event Viewer

- **Beschreibung:** Der Ereignisanzeige-Viewer von Windows ermöglicht die Überwachung von Systemereignissen und Fehlern, die bei der Ausführung von Programmen oder beim Starten des Systems auftreten.
- **Verwendung:** Nützlich zur Identifizierung von verdächtigen Systemereignissen oder ungewöhnlichem Verhalten.
- **Zugriff:** Öffne den Event Viewer, indem du `eventvwr.msc` im Ausführen-Dialog eingibst.
- **Besondere Funktionen:**
  - Anzeigen von Systemprotokollen und Anwendungen, die beim Systemstart oder während der Nutzung gestartet wurden.
  - Filterung von Protokollen nach bestimmten Ereignissen, z. B. Fehler oder Warnungen.

## 7. Process Monitor (Sysinternals)

- **Beschreibung:** Process Monitor ist ein weiteres Tool von Sysinternals, das die Echtzeitüberwachung von Datei-, Registry- und Prozessaktivitäten ermöglicht.
- **Verwendung:** Besonders nützlich für das Überwachen von Prozessen, die beim Starten eines Programms oder nach Änderungen am System ausgeführt werden.
- **Download:** [Process Monitor von Sysinternals](https://docs.microsoft.com/en-us/sysinternals/downloads/procmon)
- **Besondere Funktionen:**
  - Erfasst detaillierte Aktivitätsprotokolle in Echtzeit.
  - Filterung nach Prozessen, Dateipfaden und Registry-Schlüsseln.

## 8. Autoruns Alternative: StartupDelayer

- **Beschreibung:** StartupDelayer bietet eine detaillierte Übersicht über alle Programme, die beim Starten von Windows geladen werden, und ermöglicht eine präzise Steuerung des Startvorgangs.
- **Verwendung:** Ideal, um die Ladezeiten zu optimieren, indem man Autostart-Programme verzögert.
- **Download:** [StartupDelayer](https://www.r2.com.au/software.php)
- **Besondere Funktionen:**
  - Verzögert das Starten von Programmen, um die Leistung zu verbessern.
  - Übersichtliche Benutzeroberfläche zur Verwaltung von Autostart-Einträgen.

## 9. Malwarebytes

- **Beschreibung:** Ein populäres Tool zur Bekämpfung von Malware und verdächtigen Programmen, das auch Autostart-Programme überwachen kann.
- **Verwendung:** Ideal zur Erkennung und Entfernung von Malware, die sich in den Autostart-Einträgen versteckt.
- **Download:** [Malwarebytes](https://www.malwarebytes.com/)
- **Besondere Funktionen:**
  - Echtzeit-Schutz vor Malware und Ransomware.
  - Scannen von Autostart-Einträgen und Taskplaner.

## 10. Microsoft Autoruns (mit erweiterten Funktionen)

- **Beschreibung:** Eine erweiterte Version von Autoruns, die zusätzliche Funktionen für die Integration von Drittanbietertools und erweiterte Scanfunktionen bietet.
- **Verwendung:** Besonders nützlich für Sicherheitsforscher und fortgeschrittene Benutzer, die detaillierte Analysen von Systemprozessen benötigen.
- **Download:** [Microsoft Autoruns (erweitert)](https://docs.microsoft.com/en-us/sysinternals/downloads/autoruns)
- **Besondere Funktionen:**
  - Detaillierte Scans und umfassende Filtermöglichkeiten.
  - Automatische Erkennung von Systemmanipulationen durch Malware.

## 11. FSS (Farbar Recovery Scan Tool)

- **Beschreibung:** Ein diagnostisches Tool, das detaillierte Informationen zu den Systemprozessen und Einstellungen liefert.
- **Verwendung:** Hilft bei der Überprüfung von Systemkonfigurationen und Autostart-Programmen, die durch Malware beeinflusst wurden.
- **Download:** [Farbar Recovery Scan Tool (FSS)](https://www.bleepingcomputer.com/download/farbar-recovery-scan-tool/)
- **Besondere Funktionen:**
  - Erzeugt detaillierte Log-Dateien zu Systemprozessen und Konfigurationen.
  - Hilfreich bei der Entfernung von persistenten Bedrohungen.

## Fazit

Die Verwendung von Tools zur Überwachung und Verwaltung von Autostart-Programmen ist entscheidend für die Aufrechterhaltung der Systemintegrität und Sicherheit. Die oben aufgeführten Tools bieten eine breite Palette an Funktionen, von der einfachen Verwaltung von Autostart-Einträgen bis hin zur detaillierten Forensikanalyse und der Entfernung von Malware. Je nach deinen Anforderungen kannst du ein Tool oder eine Kombination von Tools auswählen, um die Sicherheit deines Systems zu verbessern.
