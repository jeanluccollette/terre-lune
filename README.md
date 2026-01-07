# Le système Terre Lune

## Informations générales

Les informations connues sur l'orbite de la Lune :

- https://fr.wikipedia.org/wiki/Orbite_de_la_Lune

- https://media4.obspm.fr/public/AMC/pages_eclipses-lune/stlp-mouvement-reel-ligne-noeuds-lune.html

Définition du repère géocentrique écliptique :

- https://media4.obspm.fr/public/AMC/pages_defrepere/repere-ecliptique.html

Définition de l'orbite osculatrice :

- https://fr.wikipedia.org/wiki/Orbite_osculatrice

## Description

On suppose que le référentiel ayant le Soleil pour origine est **inertiel**. On néglige les intéractions avec les autres planètes du système solaire et
seules les intéractions Terre-Soleil, Lune-Soleil et Terre-Lune sont prises en compte.

![](terre-lune.png)

## Génération des données

Le programme [terrelune.m](terrelune.m) lance la résolution numérique de l'équation différentielle. 

```
>> terrelune
```

## Résultats

![](distanceterrelune.png)

![](excentricite.png)

![](inclinaison.png)

![](orbite.png)

https://github.com/user-attachments/assets/3aa13a1f-e6a9-46d8-9e54-80170c026bbc



