#Download Dell Service Assistant
Start-Process "https://downloads.dell.com/serviceability/eSupport/SupportAssistLauncher.exe"
Start-Sleep -Seconds 2

#Launch Dell Service Assistant
Start-Process "$HOME\Downloads\SupportAssistLauncher.exe"

#Open Dell drivers web page
Start-Process "https://www.dell.com/support/home/en-us"

# Set WiFi network details
$SSID = "asdf"
$Password = "AaSsDdFf11asdf"

# Create a WiFi profile
$wifiProfile = @{
    Name = $SSID
    SSID = $SSID
    Password = $Password
    Passphrase = ConvertTo-SecureString -String $Password -AsPlainText -Force
    ProfileSecurity = "WPA2PSK"
}

# Export WiFi profile to XML
$wifiProfileXML = @"
<WLANProfile xmlns="http://www.microsoft.com/networking/WLAN/profile/v1">
    <name>$($wifiProfile.Name)</name>
    <SSIDConfig>
        <SSID>
            <name>$($wifiProfile.SSID)</name>
        </SSID>
    </SSIDConfig>
    <connectionType>ESS</connectionType>
    <connectionMode>auto</connectionMode>
    <MSM>
        <security>
            <authEncryption>
                <authentication>WPA2PSK</authentication>
                <encryption>AES</encryption>
                <useOneX>false</useOneX>
            </authEncryption>
            <sharedKey>
                <keyType>passPhrase</keyType>
                <protected>false</protected>
                <keyMaterial>$($wifiProfile.Password)</keyMaterial>
            </sharedKey>
        </security>
    </MSM>
</WLANProfile>
"@

# Save WiFi profile to XML file
$wifiProfilePath = "$env:TEMP\$($wifiProfile.Name).xml"
$wifiProfileXML | Out-File -FilePath $wifiProfilePath -Encoding utf8

# Import WiFi profile
netsh wlan add profile filename="$wifiProfilePath"

# Connect to the WiFi network
netsh wlan connect name="$SSID"

Start-Sleep 2

# Eject the USB drive
$driveEject = (New-Object -comObject Shell.Application).Namespace(17).ParseName("D:\").InvokeVerb("Eject")

Remove-Item $PSCommandPath -Force 
""
"Process complete. . . Please close this window."
""