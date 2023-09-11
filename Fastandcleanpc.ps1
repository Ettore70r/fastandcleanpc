# Definizione delle cartelle da pulire
$foldersToClean = @(
    "$env:TEMP\*",
    "$env:USERPROFILE\AppData\Local\Temp\*",
    "$env:USERPROFILE\AppData\Local\Microsoft\Windows\INetCache\*",
    "$env:USERPROFILE\Downloads\*"
)

# Pulizia dei file nelle cartelle specificate
foreach ($folder in $foldersToClean) {
    Remove-Item -Path $folder -Recurse -Force -ErrorAction SilentlyContinue
}

# Pulizia del registro di sistema
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" -Name '*' -ErrorAction SilentlyContinue

# Svuotamento della cache DNS
ipconfig /flushdns

# Svuotamento del cestino
Clear-RecycleBin -Force

# Esecuzione della deframmentazione del disco
Defrag C: -V

# Esecuzione del controllo degli errori del disco
chkdsk C: /f

# Esecuzione della pulizia del disco
Start-Process -FilePath "cleanmgr.exe" -ArgumentList "/sagerun:1" -Wait
