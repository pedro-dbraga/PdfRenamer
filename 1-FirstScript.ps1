# PDFs folder path

do {

	$Folder = Read-Host "Type herer pdf's folder path - ex: C:\Users\Username\Desktop\workspace\pdfs "
	if (!(Test-Path "$Folder")) {
    		Write-Host "ERROR: MAYBE THIS ISN'T THE RIGHT PATH." -ForegroundColor Red
	}
} while (!(Test-Path "$Folder"))

Write-Host "Path: $Folder" -ForegroundColor Green

# Names

do {

	$NameFile = Read-Host "Type herer studens name file path - ex: C:\Users\Username\Desktop\workspace\students.txt "
	if (!(Test-Path $NameFile)) {
    		Write-Host "ERROR: MAYBE THIS ISN'T THE RIGHT PATH." -ForegroundColor Red
	}
} while (!(Test-Path $NameFile))

Write-Host "Path: $NameFile" -ForegroundColor Green

# JobFolder

do {

	$Workspace = Read-Host "Type herer your workspace folder path - ex: C:\Users\Username\Desktop\workspace "
	if (!(Test-Path $Workspace)) {
    		Write-Host "ERROR: MAYBE THIS ISN'T THE RIGHT PATH." -ForegroundColor Red
	}
} while (!(Test-Path $Workspace))

Write-Host "Path: $Workspace" -ForegroundColor Green

# Read and save names in a list
$NewNames = Get-Content $NameFile | ForEach-Object { "$Folder\$_.pdf" }

# List every file in pdf folder
$OldNames = Get-ChildItem -Path $Folder -Filter "*.pdf" | Select-Object -ExpandProperty Name

# Create a list to export to CSV
$CSVData = @()

for ($i = 0; $i -lt $OldNames.Count; $i++) {
    $CSVData += [PSCustomObject]@{
        old_names = "$Folder\$($OldNames[$i])"
        new_names = $NewNames[$i]
    }
}

# Save the CSV file
$CSVData | Export-Csv -Path "$Workspace\new_list.csv" -NoTypeInformation -Delimiter ";"

Write-Host "Archive new_list.csv created!" -ForegroundColor Green
Pause

do {
	$listpath = "$Workspace\new_list.csv"
	if (!(Test-Path $listpath)){
		Write_Host "Error: MEYBE THIS ISN'T THE RIGHT PATH!" -ForegroundColor Red
	}
} while (!(Test-Path $listpath))

Write-Host "Path: $listpath" -Foreground Green

$lista = Import-Csv "$listpath" -Delimiter ';'

foreach ($arquivo in $lista) {

    if (Test-Path $arquivo.old_names) {

        Rename-Item -Path $arquivo.old_names -NewName $arquivo.new_names
        Write-Host "File Renamed: $($arquivo.old_names) para $arquivo.new_names"
    } else {
        Write-Host "File not found: $($arquivo.old_names)" -ForegroundColor Red
    }
}

Write-Host "End?" -ForegroundColor Blue

Pause
Exit

