# 🚀 Autostart Cheat Sheet

Dieses Cheat Sheet listet alle gängigen und weniger bekannten Orte auf, an denen Programme beim Start von Windows automatisch ausgeführt werden können. Es ist ideal für die schnelle Analyse von Autostart-Einträgen geeignet.

---

## 📂 **Autostart-Orte in der Registry**

### **1. Für den aktuellen Benutzer**
- **Pfade:**
  ```plaintext
  HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run
  HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce
  ```
- **Beschreibung:** Programme, die speziell für den angemeldeten Benutzer ausgeführt werden.

---

### **2. Für alle Benutzer**
- **Pfade:**
  ```plaintext
  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce
  ```
- **Beschreibung:** Programme, die für alle Benutzer auf dem System starten.

---

### **3. Zusätzliche Registry-Orte**

#### **Shell-Specific Startup**
- **Pfade:**
  ```plaintext
  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Userinit
  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Shell
  ```
- **Beschreibung:** Steuert den Start der Benutzeroberfläche und kann von Malware missbraucht werden.

#### **Policies Startup**
- **Pfade:**
  ```plaintext
  HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run
  HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run
  ```
- **Beschreibung:** Wird seltener genutzt, bietet aber einen Autostart-Mechanismus.

#### **Active Setup**
- **Pfad:**
  ```plaintext
  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components
  ```
- **Beschreibung:** Initialisiert Benutzereinstellungen beim Login.

#### **BootExecute**
- **Pfad:**
  ```plaintext
  HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\BootExecute
  ```
- **Beschreibung:** Wird in der frühen Bootphase genutzt. Standard: `autocheck autochk *`.

#### **AppInit_DLLs**
- **Pfad:**
  ```plaintext
  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows\AppInit_DLLs
  ```
- **Beschreibung:** Lädt DLLs in jeden Prozess mit GUI-Funktionen.

#### **WMI-Event-Subscriptions**
- **Ort:**
  - WMI kann persistente Aufgaben speichern, die bei bestimmten Ereignissen ausgelöst werden.
  - Überprüfen:
    ```powershell
    Get-WmiObject -Namespace "root\subscription" -Class "__EventFilter"
    ```

#### **Image Hijacking**
- **Pfad:**
  ```plaintext
  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options
  ```
- **Beschreibung:** Umleitung von ausführbaren Dateien auf alternative Programme.

#### **Winsock Providers**
- **Pfad:**
  ```plaintext
  HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WinSock2\Parameters
  ```
- **Beschreibung:** Beeinflusst Netzwerkverkehr.

#### **RunOnceEx**
- **Pfad:**
  ```plaintext
  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx
  ```
- **Beschreibung:** Einmalige Aufgaben, oft für Installationsprozesse.

---

## 📁 **Autostart-Ordner**

### **1. Benutzer-spezifischer Autostart-Ordner**
- **Pfad:**
  ```plaintext
  C:\Users\<Benutzername>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
  ```
- **Beschreibung:** Enthält Verknüpfungen zu Programmen, die nur für den aktuellen Benutzer starten.

---

### **2. Allgemeiner Autostart-Ordner**
- **Pfad:**
  ```plaintext
  C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup
  ```
- **Beschreibung:** Programme, die für alle Benutzer gestartet werden.

---

## 🕒 **Geplante Aufgaben (Task Scheduler)**

- **Ort:**
  ```plaintext
  Task Scheduler > Microsoft > Windows > ...
  ```
- **Beschreibung:** Geplante Aufgaben, die beim Systemstart oder Benutzeranmeldung ausgeführt werden können. Auch benutzerdefinierte Aufgaben prüfen.

---

## 🛠️ **Analyse-Tools**

### **1. Autoruns (Sysinternals)**
- **Download:** [Sysinternals Autoruns](https://learn.microsoft.com/en-us/sysinternals/downloads/autoruns)
- **Beschreibung:** Zeigt alle Autostart-Einträge, inklusive versteckter Orte.

### **2. PowerShell**
- Führe das folgende Skript aus, um Autostart-Einträge in der Registry zu prüfen:
  ```powershell
  $keys = @(
      "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run",
      "HKCU:\Software\Microsoft\Windows\CurrentVersion\RunOnce",
      "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run",
      "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce"
  )

  foreach ($key in $keys) {
      Write-Host "Checking: $key"
      try {
          Get-ItemProperty -Path $key
      } catch {
          Write-Host "No entries in: $key"
      }
  }
  ```

---

## 🕵️ **Verdächtige Einträge erkennen**
- **Ungewöhnliche Dateinamen:** Z. B. `svch0st.exe` (Null statt "o").
- **Falsche Pfade:** Z. B. `C:\Windows\Temp\program.exe`.
- **Unbekannte Programme:** Suche den Namen und Pfad online, um herauszufinden, ob er vertrauenswürdig ist.

---

## 🚀 **Schnelle Aktionen**

1. **Autostart-Ordner öffnen:**
   - Benutzer-spezifisch: `Win + R` > `shell:startup`.
   - Allgemein: `Win + R` > `shell:common startup`.

2. **Registry öffnen:**
   - Drücke `Win + R`, gib `regedit` ein und navigiere zu den oben genannten Pfaden.

3. **Geplante Aufgaben prüfen:**
   - Öffne den Taskplaner: `Win + S` > "Taskplaner" > Überprüfe die Aufgabenbibliothek.

---

## 📜 Schlusswort
Dieses Cheat Sheet bietet eine umfassende Übersicht über alle relevanten und versteckten Autostart-Orte. Nutze es, um verdächtige Einträge zu finden und dein System zu bereinigen.

> **Tipp:** Ergänze dieses Cheat Sheet mit den detaillierten Anleitungen im Ordner `docs/`.
