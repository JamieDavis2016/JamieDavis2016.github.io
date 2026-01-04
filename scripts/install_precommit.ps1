try {
    $root = (git rev-parse --show-toplevel).Trim()
} catch {
    Write-Error "Error: not in a git repository or git not available."
    exit 1
}

$src = Join-Path $root ".githooks\pre-commit"
$dest = Join-Path $root ".git\hooks\pre-commit"
if (-not (Test-Path $src)) {
    Write-Error "Source pre-commit wrapper not found: $src"
    exit 1
}

Copy-Item -Path $src -Destination $dest -Force
Write-Host "Installed pre-commit hook to $dest"
Write-Host "Alternatively set git config core.hooksPath .githooks to enable hooks from the repo.
To remove BOMs now run: .\scripts\remove_bom.ps1"
