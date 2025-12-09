!include "MUI2.nsh"

Name "sw"
OutFile "{}"
Unicode True

InstallDir "$ProgramFiles\sw"
InstallDirRegKey HKLM "Software\sw" ""
RequestExecutionLevel admin

;--------------------------------
;Interface Settings

!define MUI_ABORTWARNING

;--------------------------------
;Pages

!insertmacro MUI_PAGE_LICENSE "{}\LICENSE.GPLv3"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

;--------------------------------
;Languages

!insertmacro MUI_LANGUAGE "English"

;--------------------------------
;Installer Sections

Section "!CLI"
    SectionIn RO
    SetOutPath "$INSTDIR"
    File /oname=sw.exe "{}"
    DetailPrint "Running sw setup"
    nsExec::Exec '"$INSTDIR\sw.exe" setup -path'
SectionEnd
{}
Section
    WriteRegStr HKLM "Software\sw" "" $INSTDIR
    WriteUninstaller "$INSTDIR\Uninstall.exe"
SectionEnd

;--------------------------------
;Uninstaller Section

Section "Uninstall"
    ; this could be dangerous, do not use at the moment
    ;DetailPrint "Running sw setup -uninstall"
    ;nsExec::Exec '"$INSTDIR\sw.exe" setup -uninstall'

    RMDir /r "$INSTDIR\.sw" ; just in case
    Delete "$INSTDIR\sw.exe"
    ;Delete "$INSTDIR\swgui.exe"
    Delete "$INSTDIR\Uninstall.exe"
    Sleep 1000
    RMDir "$INSTDIR"
    Sleep 1000
    RMDir /r "$INSTDIR"
    DeleteRegKey /ifempty HKLM "Software\sw"
SectionEnd