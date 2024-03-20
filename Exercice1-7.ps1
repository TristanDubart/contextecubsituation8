#NAME : Exercice1-7.ps1
#AUTHOR : Dubart Tristan, CUB
#DATE : 20/03/2024
#
#VERSION : 1.1
#COMMENTS : Prend les services en cours sur le système et les exporte vers un fichier csv.


# Obtenir la liste des services démarrés sur le système
$services = Get-Service | Where-Object { $_.Status -eq 'Running' }

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

Write-Host "La liste des services démarrés a été exportée dans le fichier services.csv."
