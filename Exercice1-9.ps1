#NAME : Exercice1-9.ps1
#AUTHOR : Dubart Tristan, CUB
#DATE : 20/03/2024
#
#VERSION : 1.1
#COMMENTS : Prend les éléments d'un fichier, retire les informations demander et les affiches en vert.


# Spécifiez le chemin du fichier CSV
$cheminDuFichier = "c:\git_cub\contextecubsituation8\services.csv"

$MonFichier = Import-Csv -Path $cheminDuFichier -Delimiter ","

foreach ($Ligne in $MonFichier)
{
if ($Ligne.Nom -like "*system*") 
{
Write-Host -ForegroundColor Green $Ligne.Nom $Ligne.Status
}
else
{
Write-Host $Ligne.Nom
}
}






