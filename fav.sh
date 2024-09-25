#!/bin/bash

FAV="$HOME/Projet_Linux/.fav_bash"

# Fonction pour enregistrer un nouveau favori
function S() {
    favori="$1" #le nom du favori est le premier argument
    cheminAbsDuRep="$(pwd)" #on accède au chemin absolu du répertoire
    verif=$(cut -d ' ' -f 1 "$FAV" | grep -w "$favori") #on extrait les favoris avant de faire la recherche car le nom du favori pourrait coincider avec une partie du chemin d'un fichier, on utilise égalemnt la commande -w pour différencier deux nom qui commence de la même manière (ex : MAM3 et MAM34)
    if [ -n "$verif" ]; then #si verif n'est pas vide c'est que le favori existe déjà
        echo "Le favori existe déjà"
    else #si il n'est pas vide on l'ajoute dans le fichier caché
        echo "$favori -> $cheminAbsDuRep" >> "$FAV" 
        echo "Le répertoire $cheminAbsDuRep est sauvegardé dans vos favoris."
    fi
}


# Fonction pour se déplacer vers un favori enregistré
function C(){
    cible=$(grep "$1" "$FAV" | cut -d' ' -f 3) #on accède au chemin du favori qui est passé en argument n°1 
    if [ -n "$cible" ]; then
        cd "$cible" || exit
        echo "Vous êtes maintenant dans le répertoire $cible."
    else
        echo "Le favori '$1' n'existe pas."
    fi
}

# Fonction pour supprimer un favori de la liste des favoris enregistrés
function R() {
    favori="$1"
    verif=$(cut -d ' ' -f 1 "$FAV" | grep -w "$favori")
    if [ -n "$verif" ]; then
        sed -i "/^$favori ->/d" "$FAV" #on supprime la ligne du favori correspondant en respectant le format
        echo "Le favori '$favori' est supprimé de votre liste." 
    else 
        echo "'$favori' n'est pas votre liste."
    fi
}

# Fonction pour afficher la liste des favoris
function L() {
    echo "Liste de vos favoris :"  
    cut -d ' ' -f 1 "$FAV"  #on garde uniquement le nom des favori pour ne pas que ça affiche également le chemin 
}



# Vérification de l'existence du fichier de favoris
if [ ! -f "$FAV" ]; then
    touch "$FAV"
fi

# Traitement des arguments
case "$1" in
    S)
        S "$2"
        ;;
    C)
        C "$2"
        ;;
    R)
        R "$2"
        ;;
    L)
        L
        ;;
    *)
        echo "Menu d'aide :"
        echo "  - Tapez S pour enregistrer un favori"
        echo "  - Tapez C pour vous déplacer vers un favori enregistré"
        echo "  - Tapez R pour supprimer un favori"
        echo "  - Tapez L pour afficher la liste de vos favoris"
        read -p "  - Si vous voulez plus d'informations, tapez h : 
  - Taper sur toute autre touche pour utiliser le programme : " mot
        if [ "$mot" = "h" ]; then #on affiche le README pour faciliter la compréhension à l'utilisateur 
            cat "$HOME/Projet_Linux/INSTALL/README"
        fi
        ;;
esac


