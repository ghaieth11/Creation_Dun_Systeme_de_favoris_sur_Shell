# Système de Favoris en Ligne de Commande

## 1. Introduction
Ce projet vise à créer un système de gestion des favoris afin de faciliter la navigation entre différents répertoires dans un environnement de ligne de commande. Il permet d'enregistrer, parcourir, supprimer et lister des favoris, offrant ainsi un gain de temps considérable pour les utilisateurs.

## 2. Explication du Programme

### 2.1 Contenu du Programme
Le système de favoris se compose des fichiers suivants :

- **fav.sh** : Script Bash qui implémente les différentes fonctions de gestion des favoris.
- **.fav_bash** : Fichier caché contenant les noms et chemins des favoris enregistrés.
- **INSTALL/README** : Fichier expliquant comment installer et utiliser le programme.

### 2.2 Explication du Script

Le script **fav.sh** contient quatre fonctions principales :

#### `S` : Enregistrer un nouveau favori
Cette fonction associe un nom à un répertoire courant et enregistre cette information dans le fichier caché **.fav_bash** sous le format :
nom_du_favori -> chemin_absolu_du_repertoire

shell
Copy code
- Si le favori existe déjà, l'utilisateur en est informé.
- La redirection `>>` est utilisée pour ajouter le favori à la fin du fichier.

#### `C` : Changer de répertoire vers un favori enregistré
Cette fonction permet de changer de répertoire vers un favori précédemment enregistré :
- Recherche dans **.fav_bash** le chemin correspondant au nom du favori (via `grep`).
- Si le chemin est trouvé, on change de répertoire avec `cd`, sinon un message d'erreur est affiché.

#### `R` : Supprimer un favori
Cette fonction permet de supprimer un favori de la liste en utilisant la commande `sed` pour retirer la ligne correspondante dans **.fav_bash**.

#### `L` : Lister les favoris
Cette fonction affiche tous les favoris enregistrés en lisant le fichier **.fav_bash** et en n'affichant que les noms des favoris (via `cut`).

## 3. Exemples d'Utilisation

Voici quelques exemples d'utilisation des fonctions du script **fav.sh** :

```bash
# Enregistrer un favori
./fav.sh S mon_favori

# Changer vers un répertoire favori
./fav.sh C mon_favori

# Supprimer un favori
./fav.sh R mon_favori

# Lister les favoris
./fav.sh L
