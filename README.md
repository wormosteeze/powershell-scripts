<h1>Powershell </h1>

<h2>Description</h2>
This is a collection of tools used to speed up and simplify quick, repetitive tasks I perform throughout my day.
<br />

<h2>Languages and Utilities Used</h2>

- <b>Windows Command Prompt</b>

<h2>Environments Used </h2>

- <b>Windows 11</b>

<h2>What the scripts do:</h2>

These PowerShell scripts auto-launch from a batch file which launches the correct script based on manufacturer info (see: [post-img](https://github.com/wormosteeze/post-img)). There is a wifi-only option which is the same as each of these, but without the driver update portions held in the beginning of each script.<br/>
- <b>[Lenovo.ps1](https://github.com/wormosteeze/powershell-scripts/blob/main/Lenovo.ps1)</b>
  - launches the Lenovo System Update to check for available driver updates
  - adds wifi profiles; those listed are only examples; multiple profiles can be included
  - self-deletes to avoid cleartext wifi info being stored on the device
- <b>[Dell.ps1](https://github.com/wormosteeze/powershell-scripts/blob/main/Dell.ps1)</b>
  - identical to Lenovo.ps1, but launches the Dell support website for driver updates
- <b>[rundel.bat](https://github.com/wormosteeze/powershell-scripts/blob/main/rundel.bat)</b>
  - this is the script that is launched by the post-img batch file to start the wifi join scripts
  - waits for 5 seconds for the profiles to install
  - ejects the USB drive the scripts are launched from
  - deletes the containing folder
