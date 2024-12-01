# Fortgeschrittenes Task Checker Skript
# Dieses Skript prüft alle geplanten Aufgaben im Windows Task Scheduler auf verdächtige oder unerwünschte Aufgaben
# Es bietet eine Möglichkeit zur Sicherung und zum Entfernen verdächtiger Aufgaben
# Stellen Sie sicher, dass das Skript mit Administratorrechten ausgeführt wird.

# Sicherung des Taskplaners: Alle aktuellen geplanten Aufgaben werden in eine XML-Datei exportiert
$backupPath = "C:\Task_Backups\TaskBackup_" + (Get-Date -Format "yyyyMMdd_HHmmss") + ".xml"

# Funktion zur Sicherung aller geplanten Aufgaben
function Backup-Tasks {
    Write-Host "Erstelle eine Sicherungskopie des Taskplaners unter $backupPath"
    try {
        $tasks = Get-ScheduledTask
        $tasks | Export-ScheduledTask -Path $backupPath
        Write-Host "Backup der Aufgaben erfolgreich erstellt."
    } catch {
        Write-Host "Fehler beim Erstellen des Backups: $_"
    }
}

# Verdächtige Task-Trigger und Ausführungsdateien, die auf Malware hindeuten könnten
$maliciousPatterns = @(
    "C:\\Windows\\Temp", # Häufig von Malware genutzte temporäre Verzeichnisse
    "C:\\Users\\.*\\AppData\\Local\\Temp", # Häufig von Malware genutzte temporäre Verzeichnisse
    "C:\\ProgramData", # Programme oder Dateien, die nicht an ihrem Standardort sind
    "cmd.exe", # Häufig in Malware genutzt
    "powershell.exe", # Häufig in Malware genutzt
    "regsvr32.exe" # Häufig in Malware genutzt
)

# Funktion zum Entfernen verdächtiger Aufgaben
function Remove-ScheduledTask {
    param (
        [string]$taskName
    )
    
    Write-Host "Lösche verdächtige Aufgabe: $taskName"
    try {
        Unregister-ScheduledTask -TaskName $taskName -Force
        Write-Host "Aufgabe $taskName wurde erfolgreich gelöscht."
    } catch {
        Write-Host "Fehler beim Löschen der Aufgabe $taskName: $_"
    }
}

# Funktion zur Überprüfung und Analyse der geplanten Aufgaben
function Check-Tasks {
    Write-Host "Überprüfe alle geplanten Aufgaben im Task Scheduler..."
    
    # Hole alle geplanten Aufgaben
    $tasks = Get-ScheduledTask

    foreach ($task in $tasks) {
        $taskName = $task.TaskName
        Write-Host "Überprüfe Aufgabe: $taskName"
        
        try {
            # Hole die Details der Aufgabe
            $taskDetails = Get-ScheduledTaskInfo -TaskName $taskName
            
            # Überprüfe die Trigger der Aufgabe
            foreach ($trigger in $task.Triggers) {
                Write-Host "Trigger der Aufgabe: $trigger"
                
                # Überprüfe, ob der Trigger auf ungewöhnliche Zeitpläne oder verdächtige Dateien verweist
                if ($trigger.StartBoundary -match "0000-01-01T00:00:00" -or
                    $trigger.StartBoundary -match ".*T12:00:00.*" -or
                    $trigger.StartBoundary -match ".*T23:59:59.*") {
                    Write-Host "Verdächtiger Trigger gefunden: $taskName"
                    Remove-ScheduledTask -taskName $taskName
                    continue
                }
            }
            
            # Überprüfe den Action-Teil der Aufgabe
            foreach ($action in $task.Actions) {
                $actionPath = $action.Execute
                Write-Host "Überprüfe Aktion: $actionPath"
                
                # Überprüfe auf verdächtige Pfade
                if ($maliciousPatterns | Where-Object { $actionPath -match $_ }) {
                    Write-Host "Verdächtige Aktion gefunden: $taskName mit Pfad $actionPath"
                    Remove-ScheduledTask -taskName $taskName
                    continue
                }
            }
            
            # Überprüfe die Startbedingungen und andere Eigenschaften
            if ($taskDetails.LastRunTime -eq $null) {
                Write-Host "Aufgabe $taskName hat noch nicht ausgeführt und könnte möglicherweise gefährlich sein."
            }

            # Zusätzliche Kriterien für die Erkennung von Malware-Aufgaben
            if ($task.Principal.UserId -match "SYSTEM" -and
                ($taskActions -match "cmd.exe" -or $taskActions -match "powershell.exe")) {
                Write-Host "Verdächtige SYSTEM-Aufgabe gefunden: $taskName"
                Remove-ScheduledTask -taskName $taskName
            }

        } catch {
            Write-Host "Fehler beim Überprüfen von $taskName: $_"
        }
    }
}

# Hauptfunktion: Sicherung und Überprüfung der geplanten Aufgaben
function Main {
    # Sicherung der aktuellen Aufgaben
    Backup-Tasks

    # Überprüfung der Aufgaben
    Check-Tasks
}

# Skript ausführen
Main

Write-Host "Die Überprüfung und Bereinigung der geplanten Aufgaben wurde abgeschlossen."
