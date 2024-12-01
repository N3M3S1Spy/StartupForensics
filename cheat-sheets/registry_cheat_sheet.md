# 🛠️ Registry Cheat Sheet

Dieses Cheat Sheet bietet eine umfassende Übersicht über wichtige Registry-Pfade, die für die forensische Analyse und das Verständnis von Windows-Systemen nützlich sind. Es listet gängige Speicherorte für Programme, die beim Starten ausgeführt werden, sowie andere relevante Registry-Schlüssel.

---

## 📂 **Autostart-Orte in der Registry**

### **1. Für den aktuellen Benutzer**
- **Pfade:**
  ```plaintext
  HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run
  HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce
  ```
- **Beschreibung:** Programme, die speziell für den aktuell angemeldeten Benutzer ausgeführt werden.

---

### **2. Für alle Benutzer**
- **Pfade:**
  ```plaintext
  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce
  ```
- **Beschreibung:** Programme, die für alle Benutzer auf dem System gestartet werden.

---

### **3. Shell und Userinit**
#### **Shell-Specific Startup**
- **Pfade:**
  ```plaintext
  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Userinit
  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Shell
  ```
- **Beschreibung:** Der Wert **`Userinit`** steuert das Programm, das bei der Anmeldung eines Benutzers ausgeführt wird. **`Shell`** legt fest, welches Programm als Shell ausgeführt wird (standardmäßig `explorer.exe`).

---

### **4. Policies und Active Setup**
#### **Policies Startup**
- **Pfade:**
  ```plaintext
  HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run
  HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run
  ```
- **Beschreibung:** Weniger genutzte Orte für Programme, die beim Starten ausgeführt werden.

#### **Active Setup**
- **Pfad:**
  ```plaintext
  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components
  ```
- **Beschreibung:** Programme, die für jeden Benutzer nach der Anmeldung ausgeführt werden, um benutzerspezifische Konfigurationen zu laden.

---

### **5. BootExecute**
- **Pfad:**
  ```plaintext
  HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\BootExecute
  ```
- **Beschreibung:** Steuert, welche Programme nach dem Systemstart ausgeführt werden. Standardmäßig enthält dieser Wert `autocheck autochk *`.

---

### **6. Weitere Autostart-Optionen**

#### **AppInit_DLLs**
- **Pfad:**
  ```plaintext
  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows\AppInit_DLLs
  ```
- **Beschreibung:** Lädt DLLs in Anwendungen mit Benutzeroberflächenfunktionen. Häufig verwendet von Malware, um Code zu injizieren.

#### **WMI Event Subscriptions**
- **Ort:**
  - **Beschreibung:** WMI-Subscriptions ermöglichen das Starten von Programmen bei bestimmten Systemereignissen. Eine persistente Methode, um Programme zu starten.

#### **Image File Execution Options**
- **Pfad:**
  ```plaintext
  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options
  ```
- **Beschreibung:** Kann verwendet werden, um die Ausführung bestimmter Anwendungen umzuleiten (z. B. durch Ersetzen von Dateien oder das Hinzufügen von Programmen).

#### **RunOnceEx**
- **Pfad:**
  ```plaintext
  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx
  ```
- **Beschreibung:** Wird genutzt, um Programme einmalig auszuführen, üblicherweise bei der Installation oder nach einem Neustart.

---

## 🔧 **Andere Wichtige Registry-Pfade**

### **1. Windows Services**
- **Pfad:**
  ```plaintext
  HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services
  ```
- **Beschreibung:** Hier werden Dienste registriert, die beim Systemstart ausgeführt werden können. Überprüfe die Startart und den Pfad des Dienstes.

### **2. Software-Installationen**
- **Pfad:**
  ```plaintext
  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall
  ```
- **Beschreibung:** Alle installierten Programme sind hier aufgelistet. Überprüfe, ob unbekannte Programme installiert wurden, die verdächtig erscheinen.

---

## 🛠️ **Registry-Schlüssel zur Fehlerbehebung und Wartung**

### **1. Systemwiederherstellung**
- **Pfad:**
  ```plaintext
  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore
  ```
- **Beschreibung:** Dieser Schlüssel enthält Informationen zur Systemwiederherstellung. Dies kann nützlich sein, wenn man vermutet, dass die Systemwiederherstellung manipuliert wurde.

### **2. Autoreparatur**
- **Pfad:**
  ```plaintext
  HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SafeBoot
  ```
- **Beschreibung:** Verwendet, um den Startmodus in den abgesicherten Modus zu ändern oder Reparaturprozesse zu aktivieren.

---

## 🕵️‍♂️ **Verdächtige Registry-Schlüssel erkennen**

- **Ungewöhnliche Dateinamen:** Achte auf verdächtige Dateinamen wie `svch0st.exe` (Null statt "o") oder `rundll32.exe` an unerwarteten Orten.
- **Falsche Pfade:** Prüfe, ob Programme aus ungewöhnlichen Verzeichnissen wie `C:\Windows\Temp` oder `C:\ProgramData` ausgeführt werden.
- **Unbekannte Programme:** Führe eine schnelle Online-Suche zu unbekannten Programmen durch, um deren Ursprung und Zweck zu überprüfen.

---

## 📜 **Zusammenfassung**

Die Windows-Registry ist ein mächtiges Werkzeug, das häufig von Programmen und Malware genutzt wird, um beim Systemstart automatisch ausgeführt zu werden. Durch das gezielte Überprüfen dieser Pfade kannst du sicherstellen, dass nur vertrauenswürdige Programme gestartet werden.
