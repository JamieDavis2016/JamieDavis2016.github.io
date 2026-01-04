param(
    [string]$Path = "./_sessions"
)

Write-Host "Scanning for UTF-8 BOMs under: $Path"
$files = Get-ChildItem -Path $Path -Recurse -Filter "*.md" -File -ErrorAction SilentlyContinue
$count = 0
foreach ($f in $files) {
    try {
        $bytes = [System.IO.File]::ReadAllBytes($f.FullName)
        if ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF) {
            $new = $bytes[3..($bytes.Length - 1)]
            [System.IO.File]::WriteAllBytes($f.FullName, $new)
            Write-Host "Removed BOM:" $f.FullName
            $count++
        }
    } catch {
        Write-Host "Warning: cannot process" $f.FullName
    }
}

Write-Host "Done. BOMs removed:" $count
