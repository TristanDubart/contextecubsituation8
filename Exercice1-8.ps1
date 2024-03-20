#NAME : Exercice1-8.ps1
#AUTHOR : Dubart Tristan, CUB
#DATE : 20/03/2024
#
#VERSION : 1.1
#COMMENTS : Demande à l'utilisateur si il veut voir les services démarrer ou arrêtés sur le système et les exporte vers un fichier csv.

# Demander à l'utilisateur s'il veut la liste des services démarrés ou arrêtés
$choice = Read-Host "Voulez-vous la liste des services démarrés (D) ou arrêtés (A)? (Entrez 'D' ou 'A')"

if ($choice -eq 'D' -or $choice -eq 'd') {
    # Obtenir la liste des services démarrés sur le système
    $services = Get-Service | Where-Object { $_.Status -eq 'Running' }
} elseif ($choice -eq 'A' -or $choice -eq 'a') {
    # Obtenir la liste des services arrêtés sur le système
    $services = Get-Service | Where-Object { $_.Status -eq 'Stopped' }
} else {
    Write-Host "Choix invalide. Veuillez entrer 'D' pour les services démarrés ou 'A' pour les services arrêtés."
    exit
}

# Créer un tableau pour stocker les détails des services
$servicesDetails = @()

# Parcourir chaque service pour obtenir le nom, la description et le statut
foreach ($service in $services) {
    $serviceName = $service.Name
    $serviceDescription = $service.DisplayName
    $serviceStatus = $service.Status

    # Ajouter les détails à la liste des services
    $servicesDetails += New-Object PSObject -Property @{
        Nom = $serviceName
        Description = $serviceDescription
        Status = $serviceStatus
    }
}

# Exporter la liste des services dans un fichier CSV
$servicesDetails | Export-Csv -Path "services.csv" -Delimiter ";" -NoTypeInformation

Write-Host "La liste des services a été exportée dans le fichier services.csv."
