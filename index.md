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

--- .class #id 

## What are the criteria

> A. My criteria are always the same
> B. E se smettessi di ascoltare questa musica cosi' coinvolgente e triste forse scriverei meglio.
> C. Inizierei, come per incanto, a incasellare perfettamente le parole in onde sincopate che fanno da sottofondo perfetto
> D. Per immaginifici significati. L'essenza dell'uomo al di la dell'esistenza. Nell'ora e nel futuro. La descrizione banale della noia resa esaltante dal potere delle parole. L'astuzia infinita, l'estro, il genio che ci converte in creatori di spazi, di storie, mondi e universi nei quali rifugiarsi dal nostro piattume esistenziale. 

--- .class #id 

## Motion chart

<!-- MotionChart generated in R 3.6.2 by googleVis 0.6.4 package -->
<!-- Tue Feb 11 16:01:56 2020 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataMotionChartID206441c7185e () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"Apples",
2008,
"West",
98,
78,
20,
"2008-12-31"
],
[
"Apples",
2009,
"West",
111,
79,
32,
"2009-12-31"
],
[
"Apples",
2010,
"West",
89,
76,
13,
"2010-12-31"
],
[
"Oranges",
2008,
"East",
96,
81,
15,
"2008-12-31"
],
[
"Bananas",
2008,
"East",
85,
76,
9,
"2008-12-31"
],
[
"Oranges",
2009,
"East",
93,
80,
13,
"2009-12-31"
],
[
"Bananas",
2009,
"East",
94,
78,
16,
"2009-12-31"
],
[
"Oranges",
2010,
"East",
98,
91,
7,
"2010-12-31"
],
[
"Bananas",
2010,
"East",
81,
71,
10,
"2010-12-31"
] 
];
data.addColumn('string','Fruit');
data.addColumn('number','Year');
data.addColumn('string','Location');
data.addColumn('number','Sales');
data.addColumn('number','Expenses');
data.addColumn('number','Profit');
data.addColumn('string','Date');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartMotionChartID206441c7185e() {
var data = gvisDataMotionChartID206441c7185e();
var options = {};
options["width"] = 600;
options["height"] = 500;
options["state"] = "";

    var chart = new google.visualization.MotionChart(
    document.getElementById('MotionChartID206441c7185e')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "motionchart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartMotionChartID206441c7185e);
})();
function displayChartMotionChartID206441c7185e() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartMotionChartID206441c7185e"></script>
 
<!-- divChart -->
  
<div id="MotionChartID206441c7185e" 
  style="width: 600; height: 500;">
</div>


