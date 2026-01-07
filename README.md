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

Le programme [terrelune.m](terrelune.m) lance la résolution numérique de l'équation différentielle, avec une condition initiale (positions et vitesses)
prise le **20 mars 2017 à 0h00**, un pas de calcul constant de **15mn** et sur une durée de **18,6 ans**.

Ce programme est lancé dans **Matlab** avec la ligne de commande ci-dessous.

```
>> terrelune
```

Les positions et les vitesses au cours du temps sont sauvegardées dans le fichier **solution.mat**.

Le programme [genereresultats.m](genereresultats.m) exploite ensuite ce fichier **solution.mat** pour calculer les paramètres de l'orbite de la Lune
dans le référentiel géocentrique (ligne des noeuds, ligne des apsides et excentricité).

Ce programme est lancé dans **Matlab** avec la ligne de commande ci-dessous.

```
>> genereresultats
```

Ces informations sur l'orbite de la Lune sont sauvegardées dans le fichier **resultat.mat**.

## Résultats

La génération des données précédemment réalisée permet les tracés ci-dessous, avec le programme [traceresultats.m](traceresultats.m).

Ce programme est lancé dans **Matlab** avec la ligne de commande ci-dessous.

```
>> traceresultats
```

![](distanceterrelune.png)

![](excentricite.png)

![](inclinaison.png)

![](orbite.png)

https://github.com/user-attachments/assets/3aa13a1f-e6a9-46d8-9e54-80170c026bbc



