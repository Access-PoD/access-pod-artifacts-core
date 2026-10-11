param(
  [Parameter(Mandatory=$true)]
  [string]$Path
)

if (-not (Test-Path $Path)) {
  Write-Error "File not found: $Path"
  exit 1
}

# Load JSON
$json = Get-Content -Raw -Path $Path | ConvertFrom-Json -Depth 50

# Add or update session_status
$json | Add-Member -MemberType NoteProperty -Name session_status -Value @{
  state = "active"
  intended_reuse = "learning_and_operational_comparison"
  notes = "First populated ID_2 session; baseline for future stress runs."
} -Force

# Backup
$backup = "$Path.bak." + (Get-Date -Format "yyyyMMdd-HHmmss")
Copy-Item -Path $Path -Destination $backup -Force | Out-Null

# Save
$json | ConvertTo-Json -Depth 50 | Set-Content -Path $Path -Encoding UTF8

Write-Host "session_status added."
Write-Host "Saved:   $Path"
Write-Host "Backup:  $backup"
