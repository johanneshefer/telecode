# TeleCode AI - Build and Install Script
# Run this in PowerShell WITH CURSOR CLOSED to avoid file lock errors.
# Then install the VSIX from: d:\Work\telecode\builds\telecode-ai-0.1.17.vsix

$ErrorActionPreference = "Stop"
$ProjectRoot = $PSScriptRoot

Write-Host "=== TeleCode AI Build Script ===" -ForegroundColor Cyan
Write-Host "Ensure Cursor/VS Code is CLOSED to avoid npm file locks." -ForegroundColor Yellow
Write-Host ""

Set-Location $ProjectRoot

# Clean
Write-Host "[1/5] Cleaning..." -ForegroundColor Green
if (Test-Path dist) { Remove-Item -Recurse -Force dist }
if (Test-Path builds) { Remove-Item -Recurse -Force builds }
if (Test-Path node_modules) {
    Write-Host "  Removing node_modules (may take a moment)..." -ForegroundColor Gray
    try {
        Remove-Item -Recurse -Force node_modules -ErrorAction Stop
        Write-Host "  Removed." -ForegroundColor Gray
    } catch {
        Write-Host "  WARNING: Could not remove (files in use). Trying npm install anyway..." -ForegroundColor Yellow
    }
}

# Install
Write-Host "[2/5] Installing dependencies..." -ForegroundColor Green
npm install
if ($LASTEXITCODE -ne 0) {
    Write-Host "  npm install failed. Try closing all programs and run again." -ForegroundColor Red
    exit 1
}

# Build extension
Write-Host "[3/5] Building extension..." -ForegroundColor Green
npm run build:all
if ($LASTEXITCODE -ne 0) {
    Write-Host "  Build failed." -ForegroundColor Red
    exit 1
}

# Package VSIX
Write-Host "[4/5] Packaging VSIX..." -ForegroundColor Green
New-Item -ItemType Directory -Force -Path builds | Out-Null
npx vsce package --no-dependencies --allow-missing-repository -o builds/
if ($LASTEXITCODE -ne 0) {
    Write-Host "  Packaging failed." -ForegroundColor Red
    exit 1
}

# Done
$vsix = Get-ChildItem -Path builds -Filter "*.vsix" | Select-Object -First 1
Write-Host ""
Write-Host "[5/5] DONE!" -ForegroundColor Green
Write-Host "  VSIX: $($vsix.FullName)" -ForegroundColor Cyan
Write-Host ""
Write-Host "To install in Cursor:" -ForegroundColor Yellow
Write-Host "  1. Open Cursor" -ForegroundColor White
Write-Host "  2. Press Ctrl+Shift+P, type 'Extensions: Install from VSIX'" -ForegroundColor White
Write-Host "  3. Select: $($vsix.FullName)" -ForegroundColor White
Write-Host ""
Write-Host "Or run: cursor --install-extension $($vsix.FullName)" -ForegroundColor White
Write-Host ""
