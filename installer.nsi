/*
    Profesor Virtual UOC - Installer Script
*/

!define APP_NAME "Profesor Virtual UOC"
!define COMP_NAME "Universitatea Ovidius Constanta"
!define DESCRIPTION "Agent AI portabil pentru profesori si studenti"
!define VERSION "1.0.0"
!define OUTPUT_NAME "ProfesorVirtualUOC_Setup.exe"

!define ICON_FILE "icon.ico"
!define RUN_AGENT_PY "run_agent.py"
!define START_BAT "START_PROFESOR.bat"
!define INDEX_HTML "index.html"
!define ICON_PNG "icon.png"

; Use the modern UI
!include "MUI2.nsh"

Name "${APP_NAME}"
OutFile "${OUTPUT_NAME}"
InstallDir "$PROGRAMFILES\${APP_NAME}"
Icon "${ICON_FILE}"
UninstallIcon "${ICON_FILE}"

; Request application privileges for Windows Vista and higher
RequestExecutionLevel admin

; Interface Settings
!define MUI_ABORTWARNING

; Pages
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

; Languages
!insertmacro MUI_LANGUAGE "Romanian"

Section "Install"
    SetOutPath "$INSTDIR"
    
    ; Add files
    File "${INDEX_HTML}"
    File "${RUN_AGENT_PY}"
    File "${START_BAT}"
    File "${ICON_PNG}"
    File "${ICON_FILE}"

    ; Create Shortcuts
    CreateDirectory "$SMPROGRAMS\${APP_NAME}"
    CreateShortcut "$SMPROGRAMS\${APP_NAME}\${APP_NAME}.lnk" "$INSTDIR\${START_BAT}" "" "$INSTDIR\${ICON_FILE}"
    CreateShortcut "$DESKTOP\${APP_NAME}.lnk" "$INSTDIR\${START_BAT}" "" "$INSTDIR\${ICON_FILE}"
    
    ; Write the uninstall keys for Windows
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" "DisplayName" "${APP_NAME}"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" "UninstallString" '"$INSTDIR\uninstall.exe"'
    WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" "NoModify" 1
    WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" "NoRepair" 1
    WriteUninstaller "uninstall.exe"
SectionEnd

Section "Uninstall"
    ; Remove Shortcuts
    Delete "$SMPROGRAMS\${APP_NAME}\${APP_NAME}.lnk"
    RMDir "$SMPROGRAMS\${APP_NAME}"
    Delete "$DESKTOP\${APP_NAME}.lnk"

    ; Remove Files
    Delete "$INSTDIR\${INDEX_HTML}"
    Delete "$INSTDIR\${RUN_AGENT_PY}"
    Delete "$INSTDIR\${START_BAT}"
    Delete "$INSTDIR\${ICON_PNG}"
    Delete "$INSTDIR\${ICON_FILE}"
    Delete "$INSTDIR\uninstall.exe"

    RMDir "$INSTDIR"
SectionEnd
