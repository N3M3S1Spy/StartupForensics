@echo off
:: Beispiel-Batch-Skript: example.bat
:: Diese Batch-Datei führt grundlegende Prüfungen und Systemwartungsaktionen durch.

:: Sicherstellen, dass das Skript als Administrator ausgeführt wird
openfiles >nul 2>&1
if %errorlevel% NEQ 0 (
    echo Bitte als Administrator ausfuehren!
    pause
    exit /b
)

:: Systeminformationen anzeigen
echo.
echo == Systeminformationen ==
echo Betriebssystem: %OS%
echo Architektur: %PROCESSOR_ARCHITECTURE%
echo Benutzername: %USERNAME%
echo Computername: %COMPUTERNAME%
echo.

:: Windows-Updates überprüfen
echo.
echo == Ueberpruefe Windows Updates ==
echo.
powershell -Command "Get-WindowsUpdate -AcceptAll -Install" >nul 2>&1
if %errorlevel% equ 0 (
    echo Windows Updates wurden erfolgreich installiert!
) else (
    echo Es gab ein Problem bei der Installation der Updates.
)

:: Taskplaner-Überprüfung (beispielsweise löschen verdächtiger Aufgaben)
echo.
echo == Ueberpruefe den Taskplaner auf verdächtige Aufgaben ==
echo.

:: (Hier können weitere spezifische Taskplaner-Überprüfungen integriert werden, z.B. durch ein Powershell-Skript)
powershell -ExecutionPolicy Bypass -File "C:\path\to\task_checker.ps1"

:: Systemdateien auf Integrität überprüfen (SFC-Scan)
echo.
echo == Systemdateien auf Integritaet ueberpruefen (SFC) ==
echo.
sfc /scannow

:: Überprüfen und Bereinigen von temporären Dateien
echo.
echo == Temporäre Dateien bereinigen ==
echo.
del /f /q %temp%\* > nul 2>&1
rd /s /q %temp%

:: Bereinigung von Windows-Updates und Cache-Dateien
echo.
echo == Bereinigen von Windows-Updates und Caches ==
echo.
cleanmgr /sagerun:1

:: Neustart des Computers anfordern
echo.
echo == Der Computer wird nun neu gestartet, um die Änderungen anzuwenden. ==
echo.
shutdown /r /t 5
