#NAME : Exercice1-4.ps1
#AUTHOR : Dubart Tristan, CUB
#DATE : 13/03/2024
#
#VERSION : 1.1
#COMMENTS : Affiche les processus, mais en demandant à l'utilisateur ce qu'il veut filtrer pour l'affichage
#


# Demander à l'utilisateur d'entrer le nom du processus à filtrer
$processName = Read-Host "Entrez le nom du processus à filtrer (ex: svchost)"

# Récupérer les processus avec le nom saisi par l'utilisateur
$selectedProcesses = Get-Process | Where-Object { $_.ProcessName -eq $processName }

# Afficher les processus sélectionnés avec les paramètres Nom, Identifiant et Description
$selectedProcesses | Select-Object Name, Id, Description | Format-Table -AutoSize
