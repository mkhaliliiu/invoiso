; Inno Setup script for the customized Invoiso build.
; Place this file in the project root (next to pubspec.yaml),
; run "flutter build windows --release" first, then compile this script.

#define MyAppName "Invoiso"
#define MyAppVersion "4.4.4-custom"
#define MyAppExe "invoiso.exe"
#define BuildDir "build\windows\x64\runner\Release"

[Setup]
AppId={{6F1C2B7A-3D4E-4C8B-9A21-5E7F0D3C9B11}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher=Custom build
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputDir=installer_output
OutputBaseFilename=Invoiso_Setup_{#MyAppVersion}
SetupIconFile=windows\runner\resources\app_icon.ico
UninstallDisplayIcon={app}\{#MyAppExe}
Compression=lzma2
SolidCompression=yes
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
WizardStyle=modern

[Tasks]
Name: "desktopicon"; Description: "Create a &desktop shortcut"; GroupDescription: "Additional shortcuts:"

[Files]
; Everything Flutter produced: invoiso.exe, DLLs and the data\ folder
Source: "{#BuildDir}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; Microsoft C++ runtime, copied from THIS PC at compile time, so the app
; starts on PCs that don't have the Visual C++ Redistributable installed
Source: "C:\Windows\System32\msvcp140.dll";       DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Windows\System32\vcruntime140.dll";   DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Windows\System32\vcruntime140_1.dll"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExe}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExe}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExe}"; Description: "Launch {#MyAppName}"; Flags: nowait postinstall skipifsilent
