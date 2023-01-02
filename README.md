# Easy PSTools/PSEXEC Installer

downloads the latest pstools.zip from Microsoft and extracts the contents to WINDIR (C:\Windows in most cases).

to download and run it automagically, open a new powershell with **administrator** permissions and run the following:

## whole PsTools suite
```powershell
iex (iwr https://raw.githubusercontent.com/kantholy/pstools/main/Install-PsTools.ps1).Content
```

## PsExec only
```powershell
iex (iwr https://raw.githubusercontent.com/kantholy/pstools/main/Install-PsExec.ps1).Content
```