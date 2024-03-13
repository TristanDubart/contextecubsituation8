
#NAME : Exercice1-2.ps1
#AUTHOR : Dubart Tristan, CUB
#DATE : 13/03/2024
#
#VERSION : 1.1
#COMMENTS : Commande afficher l'ensemble des processus en cours sur le serveur
#

Get-Process | Where-Object { $_.ProcessName -eq "svchost" } | Format-Table -AutoSize
