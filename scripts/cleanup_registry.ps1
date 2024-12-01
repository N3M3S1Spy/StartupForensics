# Fortgeschrittenes Cleanup Registry Skript
# Das Skript sichert zuerst die Registry und entfernt dann verdächtige oder unerwünschte Einträge
# Stellen Sie sicher, dass Sie das Skript mit Administratorrechten ausführen.

$backupPath = "C:\Registry_Backups\RegistryBackup_" + (Get-Date -Format "yyyyMMdd_HHmmss") + ".reg"

# Sicherung der aktuellen Registry vor Änderungen
Write-Host "Erstelle eine Sicherungskopie der aktuellen Registry unter $backupPath"
reg export "HKEY_LOCAL_MACHINE" $backupPath /y
reg export "HKEY_CURRENT_USER" $backupPath /y

# Definition der verdächtigen Registry-Schlüssel und Werte
$registryPaths = @(
    "HKCU\Software\Microsoft\Windows\CurrentVersion\Run",
    "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run",
    "HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce",
    "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce",
    "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Shell",
    "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Userinit",
    "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\BootExecute",
    "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Windows\AppInit_DLLs",
    "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run",
    "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run"
)

# Funktion zum Löschen von Registry-Schlüsseln
function Remove-RegistryKey {
    param (
        [string]$keyPath,
        [string]$keyName
    )
    
    Write-Host "Lösche den Schlüssel $keyPath\$keyName"
    try {
        Remove-ItemProperty -Path $keyPath -Name $keyName -Force
        Write-Host "Schlüssel $keyPath\$keyName wurde erfolgreich gelöscht"
    } catch {
        Write-Host "Fehler beim Löschen von $keyPath\$keyName: $_"
    }
}

# Überprüfung und Bereinigung der Registry
foreach ($path in $registryPaths) {
    # Hole alle Schlüssel und Werte in diesem Registry-Pfad
    $keys = Get-ItemProperty -Path $path -ErrorAction SilentlyContinue
    if ($keys) {
        foreach ($key in $keys.PSObject.Properties) {
            $keyName = $key.Name
            $keyValue = $key.Value
            
            # Überprüfe auf verdächtige Einträge: Zum Beispiel unerwünschte Programme oder Pfade
            if ($keyValue -match "C:\\Windows\\Temp" -or $keyValue -match "C:\\ProgramData" -or $keyValue -match "C:\\Users\\.*\\AppData\\Local\\Temp") {
                Write-Host "Verdächtiger Wert gefunden: $keyName - $keyValue"
                Remove-RegistryKey -keyPath $path -keyName $keyName
            }
        }
    } else {
        Write-Host "Kein Eintrag gefunden unter $path"
    }
}

# Überprüfung von BootExecute
$bootExecutePath = "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\BootExecute"
$bootExecuteValue = (Get-ItemProperty -Path $bootExecutePath -Name "BootExecute" -ErrorAction SilentlyContinue).BootExecute

if ($bootExecuteValue -match "autocheck autochk *") {
    Write-Host "Der Standardwert von BootExecute ist intakt."
} else {
    Write-Host "Änderung von BootExecute festgestellt. Lösche den benutzerdefinierten Wert."
    Remove-RegistryKey -keyPath $bootExecutePath -keyName "BootExecute"
}

# Überprüfung der Image File Execution Options (IFEO)
$ifeoPath = "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options"
$ifeoKeys = Get-Item -Path $ifeoPath -ErrorAction SilentlyContinue
if ($ifeoKeys) {
    foreach ($key in $ifeoKeys.PSChildName) {
        $ifeoKeyPath = "$ifeoPath\$key"
        $ifeoKeyValue = (Get-ItemProperty -Path $ifeoKeyPath -ErrorAction SilentlyContinue).Debugger
        if ($ifeoKeyValue -match "C:\\Windows\\System32\\cmd.exe" -or $ifeoKeyValue -match "C:\\Windows\\System32\\powershell.exe") {
            Write-Host "Gefährlicher Wert in Image File Execution Options: $key - $ifeoKeyValue"
            Remove-Item -Path $ifeoKeyPath -Recurse -Force
            Write-Host "Gefährlicher Schlüssel $key wurde gelöscht."
        }
    }
}

# Weitere verdächtige Werte aus der Registry entfernen
$runOncePath = "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce"
$runOnceKeys = Get-ItemProperty -Path $runOncePath -ErrorAction SilentlyContinue

if ($runOnceKeys) {
    foreach ($key in $runOnceKeys.PSObject.Properties) {
        $keyName = $key.Name
        $keyValue = $key.Value

        # Beispiel für verdächtige Pfade
        if ($keyValue -match "C:\\Windows\\Temp" -or $keyValue -match "C:\\Program Files\\.*\\malware.exe") {
            Write-Host "Verdächtiger Wert in RunOnce gefunden: $keyName - $keyValue"
            Remove-RegistryKey -keyPath $runOncePath -keyName $keyName
        }
    }
}

Write-Host "Die Registry Bereinigung wurde abgeschlossen."

# Hinweis: Wenn Sie auf Fehler stoßen, prüfen Sie manuell die entsprechenden Registry-Schlüssel und stellen Sie sicher, dass sie gültig sind.
