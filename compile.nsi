; MyAppInstaller.nsi

; Set the name of the installer
Outfile "MyAppInstaller.exe"

; Request application privileges for Windows Vista and later
RequestExecutionLevel admin

; Set the installation directory
InstallDir "$PROGRAMFILES\MyApp"

; Default section
Section

    ; Set output path for installed files
    SetOutPath $INSTDIR

    ; Copy files from source directory to installation directory
    File /r "C:\Users\carte\Desktop\code\PlatformerTut\bin\release\*.*"

    ; Create shortcuts
    CreateShortCut "$DESKTOP\main.lnk" "$INSTDIR\release\main.exe"
    CreateShortCut "$SMPROGRAMS\main\main.lnk" "$INSTDIR\release\main.exe"

SectionEnd

; Uninstaller section
Section "Uninstall"

    ; SetShellVarContext to ensure uninstaller works properly
    SetShellVarContext all

    ; Remove installed files
    Delete "$INSTDIR\*.*"

    ; Remove shortcuts
    Delete "$DESKTOP\main.lnk"
    Delete "$SMPROGRAMS\main\main.lnk"

    ; Remove installation directory
    RMDir "$INSTDIR"

SectionEnd

; Name for uninstaller
Name "MyApp Uninstaller"

; Function to display an error message
Function ShowError
    MessageBox MB_ICONSTOP|MB_OK "An error occurred during installation. Please try again or contact support."
FunctionEnd

; Function to handle the installer initialization
Function .onInit
    SetShellVarContext all ; Set the context for ProgramFiles directory
    WriteUninstaller "$INSTDIR\uninstall.exe" ; Create the uninstaller
FunctionEnd

; Function to handle the installer completion
Function .onInstSuccess
    Call ShowError
FunctionEnd
