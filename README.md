# Le système Terre Lune

## Objectif

Un modèle simplifié du système Terre Lune est proposé afin d'accéder à une estimation des trajectoires par une résolution numérique de l'équation d'évolution. 

## Informations générales

Les informations connues sur l'orbite de la Lune autour de la Terre :

- https://fr.wikipedia.org/wiki/Orbite_de_la_Lune

- https://media4.obspm.fr/public/AMC/pages_eclipses-lune/stlp-mouvement-reel-ligne-noeuds-lune.html

Définition du repère géocentrique écliptique :

- https://media4.obspm.fr/public/AMC/pages_defrepere/repere-ecliptique.html

Définition de l'orbite osculatrice :

- https://fr.wikipedia.org/wiki/Orbite_osculatrice

Le site JPL Horizons :

- https://ssd.jpl.nasa.gov/horizons/app.html#/

## Description du modèle

On suppose que le référentiel ayant le Soleil pour origine est **inertiel**. On néglige les intéractions avec les autres planètes du système solaire et
seules les intéractions Terre-Soleil, Lune-Soleil et Terre-Lune sont prises en compte.

![](terre-lune.png)

## Génération des données

Le programme [terrelune.m](terrelune.m) lance la résolution numérique de l'équation différentielle (méthode rk4), avec une condition initiale (positions et vitesses)
prise le **20 mars 2017 à 0h00**, un pas de calcul constant de **15mn** et sur une durée de **18,6 ans**.

Ce programme est lancé dans **Matlab** avec la ligne de commande ci-dessous.

```
>> terrelune
```

Les positions et les vitesses au cours du temps sont sauvegardées dans le fichier **solution.mat**.

Le programme [genereresultats.m](genereresultats.m) exploite ensuite ce fichier **solution.mat** pour calculer les paramètres de l'orbite de la Lune
dans le référentiel géocentrique ([ligne des noeuds](https://fr.wikipedia.org/wiki/N%C5%93ud_(astronomie)), ligne des apsides et excentricité).

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

Les lignes horizontales sur les graphiques correspondent aux valeurs données sur le site https://fr.wikipedia.org/wiki/Orbite_de_la_Lune.

- Demi-grand axe : 384748 km
- Distance au périgée : ~362600 km (356400 à 370400 km)
- Distance à l'apogée : ~405400 km (404000 à 406700 km)
- Excentricité moyenne : 0,0549006 (0,026 à 0,077)
- Inclinaison moyenne de l'orbite sur l'écliptique : 5,14° (5,0 à 5,28°)
- Période de précession des nœuds : 18,5996 ans
- Période de précession de la ligne des apsides : 8,8504 ans

![](distanceterrelune.png)

![](excentricite.png)

![](inclinaison.png)

La trajectoire sur la durée de simulation est représentée ci-dessous.

![](orbite.png)

Par ailleurs, le programme [visuterrelune.m](visuterrelune.m) génère la vidéo ci-dessous.

Ce programme est lancé dans **Matlab** avec la ligne de commande ci-dessous.

```
>> visuterrelune
```

https://github.com/user-attachments/assets/9eb36720-a9f6-4138-ac15-c80f8c7fe5d3

- En rouge : trajectoire de la Lune autour de la Terre (coordonnées ICRS).
- En bleu : ligne des nœuds.
- En noir : ligne des apsides (périgée-apogée).
- En vert : direction relative du Soleil.

## Conclusion

Malgré la simplicité du modèle, on retrouve les informations relatives à la description de l'orbite de la Lune autour de la Terre,
notamment la période de précession de la ligne des nœuds de **18,6 ans** dans le sens rétrograde, et celle de la ligne des apsides
de **8,8 ans** dans le sens direct.




