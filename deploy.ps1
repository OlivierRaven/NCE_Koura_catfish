# copy manuscript output
Copy-Item -Recurse -Force "_manuscript\*" "docs\"

# create figure directory and copy from freeze
New-Item -ItemType Directory -Force "docs\analysis_files\figure-html" | Out-Null
Copy-Item -Force ".quarto\_freeze\analysis\figure-html\*" "docs\analysis_files\figure-html\"

# copy site_libs if they exist in root
if (Test-Path "site_libs") {
    Copy-Item -Recurse -Force "site_libs" "docs\"
}

# add nojekyll
New-Item -Force "docs\.nojekyll" -ItemType File | Out-Null

Write-Host "Done - docs folder updated"