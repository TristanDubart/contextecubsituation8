#NAME : Exercice1-6.ps1
#AUTHOR : Dubart Tristan, CUB
#DATE : 13/03/2024
#
#VERSION : 1.1
#COMMENTS : Fonction avec le processus en paramètre. Et sauvegarde dans un format .txt et .csv

function InfoProcessus($processName)
{
    Write-Host "Affichage des processus contenant : $processName"
    # Récupérer les processus avec le nom saisi par l'utilisateur
    $selectedProcesses = Get-Process | Where-Object { $_.ProcessName -eq $processName }

    # Afficher les processus sélectionnés avec les paramètres Nom, Identifiant et Description
    $selectedProcesses | Select-Object Name, Id, Description | Format-Table -AutoSize

    # Enregistrer les informations dans un fichier texte
    $selectedProcesses | Select-Object Name, Id, Description | Out-File -FilePath "sauvegarde.txt" -Append

    # Enregistrer les informations dans un fichier CSV
    $selectedProcesses | Select-Object Name, Id, Description | Export-Csv -Path "sauvegarde.csv" -Append -NoTypeInformation
}

# Demander à l'utilisateur d'entrer le nom du processus à filtrer
$processName = Read-Host "Entrez le nom du processus à filtrer (ex: svchost)"
# Paramètre entré par l'utilisateur
InfoProcessus -processName $processName
