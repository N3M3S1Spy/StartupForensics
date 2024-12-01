@echo off
:: Beispiel-Batch-Skript: example.bat
:: Dieses Skript führt fortschrittliche Prüfungen und Systemwartungsaktionen durch.
:: Es nutzt Powershell-Skripte und erweiterte Techniken zur Sicherheits- und Systemüberprüfung.

:: Sicherstellen, dass das Skript als Administrator ausgeführt wird
openfiles >nul 2>&1
if %errorlevel% NEQ 0 (
    echo Bitte als Administrator ausfuehren!
    pause
    exit /b
)

:: Log-Datei zur Aufzeichnung der Aktivitäten
set LOGFILE=C:\Task_Backups\advanced_cleanup_log.txt
echo %date% %time% - Starte Systemwartung > %LOGFILE%

:: Systeminformationen und Sicherheitseinstellungen aufzeichnen
echo %date% %time% - Erhalte Systeminformationen >> %LOGFILE%
systeminfo >> %LOGFILE%

:: Aktivieren des Verbose-Loggings in PowerShell und Skript-Fehlerbehandlung
powershell -Command "$ErrorActionPreference = 'Stop';"

:: Windows Updates durchführen und Fehlerprotokollierung aktivieren
echo %date% %time% - Starte Windows Update >> %LOGFILE%
powershell -Command "try { Get-WindowsUpdate -AcceptAll -Install -Force | Out-File -Append $env:LOGFILE } catch { $_ | Out-File -Append $env:LOGFILE }"

:: Taskplaner-Überprüfung und Entfernung verdächtiger Aufgaben
echo %date% %time% - Ueberpruefe den Taskplaner auf verdächtige Aufgaben >> %LOGFILE%
powershell -ExecutionPolicy Bypass -File "C:\path\to\task_checker.ps1" >> %LOGFILE% 2>&1

:: Überprüfen und Reparieren von Systemdateien (SFC) und Fehlerprotokollierung
echo %date% %time% - Starte Systemdateiprüfung (SFC) >> %LOGFILE%
sfc /scannow >> %LOGFILE% 2>&1

:: Fortgeschrittene Malware-Überprüfung mit Windows Defender und Logs
echo %date% %time% - Starte Windows Defender Vollscan >> %LOGFILE%
powershell -Command "Start-MpScan -ScanType FullScan | Out-File -Append $env:LOGFILE"

:: Bereinigung von temporären Dateien und Benutzer-Caches
echo %date% %time% - Bereinige temporäre Dateien und Caches >> %LOGFILE%
del /f /q %temp%\* >> %LOGFILE% 2>&1
rd /s /q %temp% >> %LOGFILE% 2>&1

:: Bereinigung von Windows Update-Cache und Caches
echo %date% %time% - Bereinige Windows Update-Cache >> %LOGFILE%
powershell -Command "Get-ChildItem 'C:\Windows\SoftwareDistribution\Download' -Recurse | Remove-Item -Recurse -Force" >> %LOGFILE%

:: Bereinigung des Prefetch-Ordners (potentiell nützliche Spurenauslöschung)
echo %date% %time% - Bereinige Prefetch-Ordner >> %LOGFILE%
del /f /q C:\Windows\Prefetch\* >> %LOGFILE% 2>&1

:: Deaktivieren von Systemwiederherstellungen und deaktivieren von Systemintegritätsprüfungen (optional, falls Sicherheit erforderlich)
:: Diese Technik kann bei Malware-Entfernungen hilfreich sein, sollte jedoch mit Vorsicht eingesetzt werden.
:: echo %date% %time% - Deaktivierung der Systemwiederherstellung und Überprüfung deaktivieren >> %LOGFILE%
:: powershell -Command "Disable-ComputerRestore -Drive 'C:'" >> %LOGFILE%
:: powershell -Command "Set-ExecutionPolicy Restricted -Force" >> %LOGFILE%

:: Weitere fortschrittliche Malware-Prävention (Überprüfung und Sperrung verdächtiger Ports)
echo %date% %time% - Überprüfe offene Ports auf verdächtige Verbindungen >> %LOGFILE%
powershell -Command "Get-NetTCPConnection | Where-Object { $_.State -eq 'Listen' } | Out-File -Append $env:LOGFILE"

:: Deaktivieren von Schwachstellen (z. B. SMBv1, wenn aktiviert)
echo %date% %time% - Deaktivierung von SMBv1 (Wenn nicht bereits deaktiviert) >> %LOGFILE%
powershell -Command "Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force" >> %LOGFILE%

:: Bereinigung von Windows-Registrierungs-Daten (advanced clean)
echo %date% %time% - Start der Registrierung-Bereinigung >> %LOGFILE%
powershell -Command "
    $regKeys = Get-ChildItem 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run'
    foreach ($key in $regKeys) {
        if ($key.Name -match '.*Malware.*') { 
            Remove-Item $key.PSPath -Force
            Write-Host 'Bereinigt Registrierungseintrag: ' $key.PSPath
        }
    }
" >> %LOGFILE%

:: Neustart des Computers für Abschluss der Änderungen
echo %date% %time% - Der Computer wird nun neu gestartet, um Änderungen anzuwenden. >> %LOGFILE%
shutdown /r /t 5

:: Ende des Skripts
echo %date% %time% - Systemwartung abgeschlossen >> %LOGFILE%
pause
exit /b
