---
title       : Melbourne House Prices Map Application
subtitle    : A Shiny based application for Finding Houses in Melbourne
author      : Paolo Coraggio
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
logo        : MelbourneLogo.png
---

## The MHPMap App

1. Interactive House Search Application 
2. Select your criteria (number of rooms, bathrooms, house type and Melbourne Region)
3. View matches on the map and compare prices with same criteria in whole Melbourne
4. Inizio a bestemmiare

--- .class #id 

## What are the criteria

> A. My criteria are always the same
> B. E se smettessi di ascoltare questa musica cosi' coinvolgente e triste forse scriverei meglio.
> C. Inizierei, come per incanto, a incasellare perfettamente le parole in onde sincopate che fanno da sottofondo perfetto
> D. Per immaginifici significati. L'essenza dell'uomo al di la dell'esistenza. Nell'ora e nel futuro. La descrizione banale della noia resa esaltante dal potere delle parole. L'astuzia infinita, l'estro, il genio che ci converte in creatori di spazi, di storie, mondi e universi nei quali rifugiarsi dal nostro piattume esistenziale. 

--- .class #id 

## Problemi con googleVis

1. AAAAAAAAAAAAAAAAAARHHHHHHHHHHHHH

--- .class #id 

## Motion chart

 [1] "Suburb"        "Address"       "Rooms"         "Type"         
 [5] "Price"         "Method"        "SellerG"       "Date"         
 [9] "Distance"      "Postcode"      "Bedroom2"      "Bathroom"     
[13] "Car"           "Landsize"      "BuildingArea"  "YearBuilt"    
[17] "CouncilArea"   "Lattitude"     "Longtitude"    "Regionname"   
[21] "Propertycount" "PriceCategory" "MarkerColor"   "HoverText"    
[1] -37.7998
[1] 145.0035

```
## Warning in normalizePath(path.expand(path), winslash, mustWork):
## path[1]="webshotc807b5a6040.png": The system cannot find the file specified
```

```
## Warning in file(con, "rb"): cannot open file 'C:
## \Users\pacor\AppData\Local\Temp\RtmpIpRIEI\filec80c6230fe\webshotc807b5a6040.png':
## No such file or directory
```

```
## Error in file(con, "rb"): cannot open the connection
```

--- .class #id

## Domanda

Ma sto aggiornando o no?

