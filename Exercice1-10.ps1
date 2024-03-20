#NAME : Exercice1-10.ps1
#AUTHOR : Dubart Tristan, CUB
#DATE : 20/03/2024
#
#VERSION : 1.1
#COMMENTS : Demande a l'utilisateur la valeur qu'il veut afficher en vert.

# Spécifiez le chemin du fichier CSV
$cheminDuFichier = "c:\git_cub\contextecubsituation8\services.csv"

# Importer le fichier CSV dans une variable
$MonFichier = Import-Csv -Path $cheminDuFichier -Delimiter ","

# Demander à l'utilisateur ce qu'il veut afficher en vert
$motCle = Read-Host "Entrez le mot-clé que vous souhaitez afficher en vert"

# Parcourir chaque ligne et afficher en vert celles contenant le mot-clé spécifié
foreach ($Ligne in $MonFichier)
{
    if ($Ligne.Nom -like "*$motCle*") 
    {
        Write-Host -ForegroundColor Green $Ligne.Nom $Ligne.Status
    }
    else
    {
        Write-Host $Ligne.Nom
    }
}
