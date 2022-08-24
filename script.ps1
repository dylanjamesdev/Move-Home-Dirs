
####################################################################
#    Powershell Script to move home folders to a network drive.    #
#                    Created by: github/dylanjamesdev              #
####################################################################


## Paths to move specific home folders to. EDIT.
$desktopPath = 'U:\Desktop';
$documentsPath = 'U:\Documents';
$picturesPath = 'U:\Photos'

## Registry keys to edit
$key1 = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders";
$key2 = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders";

## Logger
function talk ($text) {
    Write-Output $text
}

## Set Desktop
set-ItemProperty -path $key1 -name Desktop $desktopPath
set-ItemProperty -path $key2 -name Desktop $desktopPath
talk('[Desktop] moved to server successfully')

## Set Documents
set-ItemProperty -path $key1 -name Documents $documentsPath
set-ItemProperty -path $key2 -name Documents $documentsPath
talk('[Documents] moved to server successfully')

## Set Photos
Set-ItemProperty -path $key1 -name Pictures $picturesPath
Set-ItemProperty -path $key2 -name Pictures $picturesPath
talk('[Pictures] moved to server successfully')

## Alert User
[reflection.assembly]::loadwithpartialname('System.Windows.Forms')
[reflection.assembly]::loadwithpartialname('System.Drawing')
$notify = new-object system.windows.forms.notifyicon
$notify.icon = [System.Drawing.SystemIcons]::Information
$notify.visible = $true
$notify.showballoontip(30,'WARNING','If your desktop is not mapped to the network drive, logout/login or restart the device.',[system.windows.forms.tooltipicon]::None)
