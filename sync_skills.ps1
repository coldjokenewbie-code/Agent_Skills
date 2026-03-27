# sync_skills.ps1
# 自動同步 Agent_Skills 到 Claude Code skills 目錄

$sourceDir = "C:\Users\2025.DESKTOP-7SF21LR\Documents\Agent_Skills\skills"
$targetDir = "C:\Users\2025.DESKTOP-7SF21LR\.claude\skills"

$skills = Get-ChildItem -Path $sourceDir -Directory

foreach ($skill in $skills) {
    $linkPath = Join-Path $targetDir $skill.Name
    if (!(Test-Path $linkPath)) {
        New-Item -ItemType SymbolicLink -Path $linkPath -Target $skill.FullName | Out-Null
        Write-Host "已建立 symlink: $($skill.Name)"
    }
}

Write-Host "同步完成"
