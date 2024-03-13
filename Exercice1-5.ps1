#NAME : Exercice1-5.ps1
#AUTHOR : Dubart Tristan, CUB
#DATE : 13/03/2024
#
#VERSION : 1.1
#COMMENTS : Fonction avec le processus en paramètre.


function InfoProcessus($processName) 
{
    Write-Host "Affichage des processus conteant : $processName"
    # Récupérer les processus avec le nom saisi par l'utilisateur
    $selectedProcesses = Get-Process | Where-Object { $_.ProcessName -eq $processName }

    # Afficher les processus sélectionnés avec les paramètres Nom, Identifiant et Description
    $selectedProcesses | Select-Object Name, Id, Description | Format-Table -AutoSize
}

# Demander à l'utilisateur d'entrer le nom du processus à filtrer
$processName = Read-Host "Entrez le nom du processus à filtrer (ex: svchost)"
# Paramètre entré par l'utilisateur
InfoProcessus($processName)
