@{
# Module de script ou fichier de module binaire associé à ce manifeste
RootModule = 'SimplePSLog.psm1'

# Numéro de version de ce module.
ModuleVersion = '1.0.0'

# ID utilisé pour identifier de manière unique ce module
GUID = 'a6b6f68a-7bca-4094-be39-b78b104eb330'

# Auteur de ce module
Author = 'Bastien.WERHANN'

# Société ou fournisseur de ce module
CompanyName = 'bastien-w'

# Déclaration de copyright pour ce module
Copyright = '(c) 2023 Bastien.WERHANN. Tous droits réservés.'

FunctionsToExport = @()

# Applets de commande à exporter à partir de ce module. Pour de meilleures performances, n’utilisez pas de caractères génériques et ne supprimez pas l’entrée. Utilisez un tableau vide si vous n’avez aucune applet de commande à exporter.
CmdletsToExport = @()

# Variables à exporter à partir de ce module
VariablesToExport = '*'

# Alias à exporter à partir de ce module. Pour de meilleures performances, n’utilisez pas de caractères génériques et ne supprimez pas l’entrée. Utilisez un tableau vide si vous n’avez aucun alias à exporter.
AliasesToExport = @()

# Données privées à transmettre au module spécifié dans RootModule/ModuleToProcess. Cela peut également inclure une table de hachage PSData avec des métadonnées de modules supplémentaires utilisées par PowerShell.
PrivateData = @{

    PSData = @{
        # URL vers le site web principal de ce projet.
        ProjectUri = 'https://github.com/bastien-w/SimplePSLog'
    } # Fin de la table de hachage PSData

} # Fin de la table de hachage PrivateData
}

