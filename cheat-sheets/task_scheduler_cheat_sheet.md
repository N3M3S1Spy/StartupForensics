# 🕒 Task Scheduler Cheat Sheet

Dieses Cheat Sheet gibt eine detaillierte Übersicht über den Windows Task Scheduler und seine Verwendungsmöglichkeiten für Autostart-Aufgaben. Es zeigt die wichtigsten Orte, an denen geplante Aufgaben hinterlegt sind, und gibt Tipps, wie man verdächtige Aufgaben erkennt.

---

## 📂 **Wichtige Orte für Geplante Aufgaben**

### **1. Aufgabenbibliothek**
- **Ort:**
  ```plaintext
  Task Scheduler > Task Scheduler Library
  ```
- **Beschreibung:** Die Aufgabenbibliothek zeigt alle geplanten Aufgaben auf dem System. Verdächtige Aufgaben können hier überprüft und untersucht werden.

### **2. Microsoft Aufgaben**
- **Ort:**
  ```plaintext
  Task Scheduler > Microsoft > Windows
  ```
- **Beschreibung:** Viele vorgefertigte Aufgaben, die von Windows selbst oder von Microsoft-Produkten hinzugefügt werden, befinden sich in diesem Verzeichnis. Hier können jedoch auch von Malware manipulierte Aufgaben erscheinen.

#### **Beispiel für eine Systemaufgabe:**
- **Pfad:** 
  ```plaintext
  Task Scheduler > Microsoft > Windows > UpdateOrchestrator
  ```
- **Beschreibung:** Aufgaben im Zusammenhang mit Windows-Updates, die sicherstellen, dass der Update-Prozess reibungslos abläuft.

---

### **3. Benutzerdefinierte Aufgaben**
- **Ort:** 
  ```plaintext
  Task Scheduler > Task Scheduler Library > (Benutzerdefinierte Ordner)
  ```
- **Beschreibung:** Hier können benutzerdefinierte Aufgaben hinterlegt werden, die spezifische Programme oder Skripte beim Systemstart oder in regelmäßigen Abständen ausführen.

---

## 🔍 **Wichtige Task Scheduler Funktionen**

### **1. Aufgaben anzeigen**
- **Methode:** Öffne den Taskplaner und navigiere zur Aufgabenbibliothek. Dort kannst du eine Liste aller geplanten Aufgaben sehen.
- **Details anzeigen:** Um Details zu einer bestimmten Aufgabe anzuzeigen, klicke mit der rechten Maustaste auf die Aufgabe und wähle **Eigenschaften**.
- **Befehl in PowerShell:**
  ```powershell
  Get-ScheduledTask
  ```

---

### **2. Eine geplante Aufgabe erstellen**
- **Methode:** 
  1. Klicke auf **Aktion** > **Aufgabe erstellen...**.
  2. Gebe der Aufgabe einen Namen, z. B. "Malware-Scan".
  3. Wähle aus, wann die Aufgabe ausgelöst werden soll (z. B. bei Anmeldung, beim Start, regelmäßig).
  4. Gib das Programm oder Skript ein, das ausgeführt werden soll.
- **Beispiel für ein Skript:** 
  - Programm: `powershell.exe`
  - Argumente: `-File "C:\path\to\malware-scan.ps1"`

---

### **3. Eine geplante Aufgabe löschen**
- **Methode:**
  1. Wähle die Aufgabe in der Aufgabenbibliothek aus.
  2. Klicke mit der rechten Maustaste und wähle **Löschen**.
- **Befehl in PowerShell:**
  ```powershell
  Unregister-ScheduledTask -TaskName "TaskName"
  ```

---

### **4. Eine geplante Aufgabe deaktivieren**
- **Methode:**
  1. Klicke mit der rechten Maustaste auf die Aufgabe und wähle **Deaktivieren**.
- **Befehl in PowerShell:**
  ```powershell
  Disable-ScheduledTask -TaskName "TaskName"
  ```

---

## 🕵️‍♂️ **Verdächtige Aufgaben erkennen**

### **1. Unbekannte oder ungewöhnliche Aufgaben**
- **Symptome:** Wenn du eine Aufgabe findest, die aus einem nicht standardmäßigen Ordner oder einem unbekannten Programm ausgeführt wird, könnte dies ein Hinweis auf Malware sein.
- **Beispiel:** Eine Aufgabe mit dem Namen `WindowsUpdate` in einem benutzerdefinierten Ordner oder ein Programm, das aus `C:\Temp` oder `C:\Windows\System32\Temp` ausgeführt wird.

### **2. Häufige Aufgaben**
- **Symptome:** Aufgaben, die häufig (z. B. jede Minute oder stündlich) ausgeführt werden, könnten verdächtig sein, insbesondere wenn sie nicht mit bekannten Systemprozessen in Verbindung stehen.

### **3. Aufgaben ohne Beschreibung oder Trigger**
- **Symptome:** Eine Aufgabe ohne ordnungsgemäße Beschreibung oder Trigger kann darauf hinweisen, dass der Ersteller der Aufgabe versucht, sie unsichtbar zu machen.

---

## 🔧 **PowerShell Befehle für Task Scheduler**

### **1. Alle geplanten Aufgaben anzeigen**
- **Befehl:**
  ```powershell
  Get-ScheduledTask
  ```

### **2. Aufgaben nach Name filtern**
- **Befehl:**
  ```powershell
  Get-ScheduledTask | Where-Object { $_.TaskName -like "*Name*" }
  ```

### **3. Details zu einer Aufgabe anzeigen**
- **Befehl:**
  ```powershell
  Get-ScheduledTaskInfo -TaskName "TaskName"
  ```

### **4. Alle Aufgaben löschen**
- **Befehl:**
  ```powershell
  Get-ScheduledTask | Unregister-ScheduledTask
  ```

---

## 📝 **Zusammenfassung**

Der Windows Task Scheduler bietet eine leistungsstarke Methode zur Automatisierung von Aufgaben, jedoch auch eine potenzielle Angriffsfläche für Malware. Durch die gezielte Untersuchung der Aufgaben und das Entfernen verdächtiger oder unbekannter Einträge kannst du dein System besser schützen.

> **Tipp:** Ergänze deine Analyse durch die regelmäßige Überprüfung von Aufgaben und verwende PowerShell für die Automatisierung von Prüfungen.
