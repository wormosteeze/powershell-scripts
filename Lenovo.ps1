#Launch Lenovo System Update
& 'C:\Program Files (x86)\Lenovo\System Update\tvsu.exe'

# Set WiFi network details
$SSID = "asdf"
$Password = "Appl3sSodaDairyF00d"

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