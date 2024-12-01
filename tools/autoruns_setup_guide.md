# Autoruns Setup Guide

## Übersicht

**Autoruns** ist ein mächtiges Tool von Sysinternals, mit dem Benutzer alle Autostart-Programme und -Dienste auf einem Windows-System überwachen und verwalten können. Es zeigt detaillierte Informationen über alle Autostart-Einträge, die von verschiedenen Quellen wie dem Windows-Registry, Taskplaner, Startup-Ordner und mehr stammen. Autoruns ist besonders nützlich für die Analyse von verdächtigen oder unerwünschten Programmen, die beim Starten des Systems ausgeführt werden.

In diesem Guide wird beschrieben, wie du Autoruns einrichtest und verwendest, um dein System auf unnötige oder potenziell schadhafte Programme im Autostart zu überprüfen.

## Voraussetzungen

- **Windows-Betriebssystem** (Autoruns funktioniert auf allen Versionen von Windows, von Windows XP bis Windows 11).
- **Administratorrechte**, um auf alle relevanten Bereiche des Systems zugreifen zu können.

## Schritt 1: Download und Installation von Autoruns

1. Gehe auf die [offizielle Sysinternals-Website](https://docs.microsoft.com/en-us/sysinternals/downloads/autoruns).
2. Lade die neueste Version von **Autoruns** herunter (die ZIP-Datei).
3. Extrahiere die ZIP-Datei in ein Verzeichnis deiner Wahl (z. B. `C:\Autoruns`).
4. Öffne den Ordner, der die extrahierte Datei enthält, und starte **Autoruns.exe** als Administrator.

## Schritt 2: Benutzeroberfläche von Autoruns

Die Benutzeroberfläche von Autoruns zeigt dir verschiedene Registerkarten, die verschiedene Autostart-Quellen repräsentieren:

- **Logon:** Programme, die beim Benutzeranmelden gestartet werden.
- **Explorer:** Programme, die mit dem Windows Explorer verbunden sind.
- **Services:** Windows-Dienste, die automatisch gestartet werden.
- **Scheduled Tasks:** Geplante Aufgaben, die beim Start ausgeführt werden.
- **Drivers:** Gerätetreiber, die beim Systemstart geladen werden.
- **Image Hijacks:** Programme, die Systembilder ersetzen oder manipulieren.

## Schritt 3: Überprüfen von Autostart-Programmen

1. **Autoruns starten:** Wenn du Autoruns als Administrator geöffnet hast, wird eine Liste aller Autostart-Einträge angezeigt.
2. **Durchsuchen der Registerkarten:** Jede Registerkarte enthält verschiedene Programme oder Dienste, die mit dem Autostart-Prozess verbunden sind.
   - **Autoruns durchsucht automatisch:** Das Programm überprüft die gängigen Autostart-Quellen und zeigt die Ergebnisse an, einschließlich der Pfade zu den entsprechenden Programmen und der zugehörigen Prozessoren.
3. **Einträge analysieren:** Überprüfe jeden Eintrag auf Ungewöhnlichkeiten:
   - Achte auf Programme, die du nicht installiert hast.
   - Achte auf ungewöhnliche oder verdächtige Dateipfade (z. B. Programme, die von temporären oder versteckten Ordnern geladen werden).
   - Überprüfe die **Signaturen** von ausführbaren Dateien. Verdächtige Dateien haben oft keine digitale Signatur.

## Schritt 4: Deaktivieren von verdächtigen Autostart-Einträgen

1. **Eintrag auswählen:** Klicke mit der rechten Maustaste auf einen verdächtigen Autostart-Eintrag.
2. **Deaktivieren:** Wähle **Disable** aus dem Kontextmenü, um das Programm am nächsten Systemstart zu deaktivieren.
   - Alternativ kannst du auf das Häkchen neben dem Eintrag klicken, um es zu deaktivieren.
3. **Deaktivierte Programme überprüfen:** Deaktivierte Programme sind in der Liste weiterhin sichtbar, aber sie sind durch ein Häkchen in der "Disabled"-Spalte markiert. Sie werden beim nächsten Neustart nicht ausgeführt.

## Schritt 5: Löschen von Autostart-Einträgen (Optional)

1. **Eintrag auswählen:** Wähle einen Eintrag aus, den du dauerhaft aus dem Autostart entfernen möchtest.
2. **Löschen:** Klicke mit der rechten Maustaste auf den Eintrag und wähle **Delete**.
   - **Achtung:** Lösche nur Einträge, die du sicher identifizieren kannst und deren Entfernung keine negativen Auswirkungen auf das System hat.
   
   **Hinweis:** Falls du einen Eintrag versehentlich löschst, kannst du ihn mit der Funktion **Undo** wiederherstellen.

## Schritt 6: Weitere nützliche Funktionen

### Filter und Suche

- **Suchleiste:** Verwende die Suchleiste, um gezielt nach bestimmten Programmen oder Dateien zu suchen.
- **Filter:** Klicke auf **Options > Hide Windows Entries**, um nur nicht-Windows-Prozesse anzuzeigen und so die Suche zu vereinfachen.

### Speichern und Exportieren der Ergebnisse

- **Speichern der Liste:** Du kannst eine Liste der Autostart-Programme speichern, um sie später erneut zu überprüfen. Klicke dazu auf **File > Save** und speichere die Ergebnisse im gewünschten Format (z. B. als `.arn`-Datei).
- **Exportieren der Daten:** Exportiere alle Informationen, um sie in anderen Tools oder für die Dokumentation zu verwenden.

### Erweiterte Funktionen: Log-Dateien und Debugging

- Autoruns bietet auch erweiterte Debugging-Optionen. Du kannst den **Debug-Log** aktivieren, um detaillierte Informationen über das Laden und Deaktivieren von Programmen zu erhalten. Diese Informationen können dir helfen, tiefere Probleme zu diagnostizieren.

## Schritt 7: Automatisierte Prüfungen (optional)

### Autoruns als Command-Line Tool verwenden

- Autoruns kann auch über die Kommandozeile ausgeführt werden, um automatisch Prüfungen durchzuführen. Ein einfaches Beispiel:
  
  ```batch
  autoruns.exe /accepteula /min /scan
  ```

- Du kannst auch spezifische Parameter verwenden, um nur bestimmte Registerkarten zu scannen oder Ausgaben zu speichern:

  ```batch
  autoruns.exe /accepteula /min /export C:\Autoruns_Export.txt
  ```

- Dies speichert alle Autostart-Informationen in einer Textdatei, die du später analysieren kannst.

## Schritt 8: Weitere Sicherheitsüberlegungen

- **Digitale Signaturen:** Überprüfe die digitale Signatur von Programmen, um sicherzustellen, dass sie von vertrauenswürdigen Quellen stammen.
- **Sicherheitssoftware verwenden:** Kombiniere Autoruns mit anderer Sicherheitssoftware wie Windows Defender, Malwarebytes oder anderen Antivirenlösungen, um sicherzustellen, dass keine schadhafte Software unbemerkt bleibt.

## Fazit

**Autoruns** ist ein unverzichtbares Tool zur Überwachung und Verwaltung von Autostart-Programmen auf Windows-Systemen. Es bietet detaillierte Informationen über alle Programme, die beim Systemstart ausgeführt werden, und ermöglicht es, verdächtige oder unerwünschte Programme zu deaktivieren oder zu entfernen. Durch die Kombination von Autoruns mit anderen Sicherheitsmaßnahmen kannst du dein System vor Bedrohungen schützen und die Leistung durch das Entfernen unnötiger Autostart-Programme verbessern.
