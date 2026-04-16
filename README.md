# jameson.saussereau.m1ecap

Package R contenant un jeu de donnees de transactions de vente au detail
(Online Retail, decembre 2010) et des fonctions d'analyse.

## Installation

```r
devtools::install_local("jameson.saussereau.m1ecap")
```

## Fonctions

- `filtrer_pays(data, pays)` : filtre les transactions par pays
- `calcul_groupe(data, groupe)` : calcule le CA moyen par groupe
- `graphique_ca(data, n)` : affiche un graphique ggplot2 du CA moyen

## Exercice git

```bash
git checkout master
git commit -m "commit A"
git checkout -b feature
git commit -m "commit B"
git checkout master
git merge feature
git commit -m "commit C"
```

Le premier commit de ce repertoire a été effectué le 16/04/2025 à XXhXX
