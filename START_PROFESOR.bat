@echo off
SETLOCAL
TITLE Profesor Virtual UOC - Startup
echo ==========================================
echo    PORNIRE PROFESOR VIRTUAL (UOC)
echo ==========================================
echo.

:: Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [EROARE] Python nu a fost gasit! Te rugam sa instalezi Python.
    pause
    exit /b
)

:: Check if Ollama is running
echo [-] Verificare Ollama...
powershell -Command "try { $resp = Invoke-WebRequest -Uri 'http://localhost:11434/api/tags' -UseBasicParsing; echo 'Ollama este pornit.' } catch { echo '[AVERTISMENT] Ollama nu pare sa ruleze. Asigura-te ca este pornit pentru ca agentul sa functioneze!' }"

echo.
echo [-] Pornire server local si deschidere browser...
python run_agent.py

pause
