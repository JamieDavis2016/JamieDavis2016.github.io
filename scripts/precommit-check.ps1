param(
    [string]$Path = "./"
)

# Scan recursively for .md files with a UTF-8 BOM and fail if any are found
$files = Get-ChildItem -Path $Path -Recurse -Filter "*.md" -File -ErrorAction SilentlyContinue
$found = $false
foreach ($f in $files) {
    try {
        $bytes = [System.IO.File]::ReadAllBytes($f.FullName)
        if ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF) {
            Write-Host "BOM detected:" $f.FullName
            $found = $true
        }
    } catch {
        Write-Host "Warning: cannot read file" $f.FullName
    }
}

if ($found) {
    Write-Error "Commit aborted: UTF-8 BOM(s) detected in repository. Run scripts\remove_bom.ps1 to fix."
    exit 1
} else {
    Write-Host "No UTF-8 BOMs found."
    exit 0
}
