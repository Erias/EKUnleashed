[Setup]
AppName=EK Unleashed
AppPublisher=Souza Software, Inc.
AppCopyright=Copyright (C) 2014-2015 Souza Software, Inc.
DefaultDirName={pf}\EK Unleashed
DefaultGroupName=EK Unleashed
OutputDir=.\Installer Output
DisableReadyMemo=yes
DisableReadyPage=yes
SetupIconFile=.\398.ico
Compression=lzma/ultra64
SolidCompression=yes
LicenseFile=..\LICENSE
Uninstallable=yes
; Needed to modify %AppData%
PrivilegesRequired=poweruser
DisableProgramGroupPage=yes

; Shown as installed version (Programs & Features) as well as product version ('Details' tab when right-clicking setup program and choosing 'Properties')
AppVersion=2.04
; Shown in the setup program during install only
AppVerName=EK Unleashed v2.04
; Stored in the version info for the setup program itself ('Details' tab when right-clicking setup program and choosing 'Properties')
VersionInfoVersion=2.04.30515.320
; Other version info
OutputBaseFilename=EKU_2.04.30515.320__setup

; Shown only in Programs & Features
AppContact=EK Unleashed Forums
AppComments=An enhanced game client and automation tool for Elemental Kingdoms.
AppSupportURL=http://www.EKUnleashed.com/forums/
AppPublisherURL=http://www.EKUnleashed.com/
AppUpdatesURL=http://www.EKUnleashed.com/forums/viewforum.php?f=1
UninstallDisplayName=EK Unleashed
; 8.20 MB as initial install
UninstallDisplaySize=8598729
UninstallDisplayIcon={app}\EK Unleashed.exe


[Messages]
BeveledLabel=EK Unleashed v2.04 Setup

[Languages]
Name: english; MessagesFile: compiler:Default.isl

[Files]
Source: ..\EK Unleashed\bin\Release\EK Unleashed.exe; DestDir: {app}; Flags: ignoreversion
Source: ..\EK Unleashed\bin\Release\Newtonsoft.Json.dll; DestDir: {app}

Source: ..\LICENSE; DestName: License.txt; DestDir: {app}
Source: .\uninstall.ico; DestDir: {app}

[Tasks]
;Name: quicklaunchicon; Description: {cm:CreateQuickLaunchIcon}; GroupDescription: {cm:AdditionalIcons}
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons};

[Icons]
Name: {commondesktop}\EK Unleashed; Filename: {app}\EK Unleashed.exe; WorkingDir: {app}; Tasks: desktopicon
Name: {group}\EK Unleashed; Filename: {app}\EK Unleashed.exe; WorkingDir: {app}
Name: {group}\Uninstall EK Unleashed; Filename: {uninstallexe}; IconFileName: {app}\uninstall.ico
Name: {group}\License Agreement; Filename: {app}\License.txt

[Run]
Description: Start EK Unleashed; Filename: {app}\EK Unleashed.exe; Flags: nowait postinstall skipifdoesntexist

[UninstallDelete]
Type: files; Name: {app}\License.txt
Type: files; Name: {app}\EK Unleashed.exe
Type: files; Name: {app}\Newtonsoft.Json.dll
Type: files; Name: {app}\uninstall.ico
Type: filesandordirs; Name: {userappdata}\Souza Software\EK Unleashed

[Code]
procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
  if CurUninstallStep = usUninstall then begin
    if MsgBox('Do you want to delete your EK Unleashed preferences as well?', mbConfirmation, MB_YESNO) = IDYES 
    then begin
      DelTree(ExpandConstant('{userappdata}') + '\Souza Software\EK Unleashed', True, True, True)
      RegDeleteKeyIncludingSubKeys(HKEY_CURRENT_USER, 'SOFTWARE\Souza Software\EK Unleashed')
    end;
  end;
end;

