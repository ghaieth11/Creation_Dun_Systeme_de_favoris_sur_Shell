# Installation et Utilisation du script favoris.sh

## Introduction
Le script `fav.sh` est un petit utilitaire en ligne de commande pour gérer des favoris de répertoires dans un terminal Unix. Ce guide explique comment installer et utiliser ce script.

## Installation
1. Téléchargez ou copiez le fichier `fav.sh` sur votre système.
2. Ouvrez un terminal et accédez au répertoire où se trouve le fichier `fav.sh`.
3. Rendez le script exécutable en utilisant la commande suivante :
    ```
    chmod +x favoris.sh
    ```

## Utilisation
Le script `favoris.sh` prend en charge les options suivantes (le ./fav.sh n'est pas nécessaire si vous utilisez source):

- **S (Save) :** Pour sauvegarder un répertoire favori :
    ```
    ./fav.sh S nom_du_favori
    ```

- **C (Change) :** Pour changer de répertoire vers un favori existant :
    ```
    ./fav.sh C nom_du_favori 
    ```

- **R (Remove) :** Pour supprimer un favori :
    ```
    ./fav.sh R nom_du_favori
    ```

- **L (List) :** Pour lister tous les favoris enregistrés :
    ```
    ./fav.sh L
    ```


