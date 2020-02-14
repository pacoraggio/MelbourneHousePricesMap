---
title       : Melbourne House Prices Map Application
subtitle    : A Shiny based application for Finding Houses in Melbourne
author      : Paolo Coraggio
job         : 
framework   : revealjs      # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : zenburn      # 
revealjs    :
  theme: night
  transition: page
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
logo        : MelbourneLogo.png
---

<style>
.reveal h1 {
    font-size: 2em;
    // color: #0000b3;
    padding-bottom: 10px;
}

.reveal h2 {
    font-size: 1.5em;
    //color: #fff7e6;
    padding-bottom: 10px;
}


.reveal p, .reveal em {
    padding-bottom: 10px;
    width: 960px;
}

.reveal p {
    font-size: .75em;
}

.reveal small {
    width: 500px;
}


.reveal .slides {
    text-align: left;
}

.reveal .roll {
    vertical-align: text-bottom;
}


code {
    color: red;
}

.reveal pre code { 
     height: 80px;
}

Reveal.initialize({
	// More info https://github.com/hakimel/reveal.js#dependencies
	dependencies: [
		{ src: 'plugin/highlight/highlight.js', async: true },
	]
})

</style>

## Melbourne House Prices Map App

An Interactive Shiny Application to help you to find home in Melbourne, Australia

<left>
<small> author: Paolo Coraggio </small>
</left>

<small> date: 14.02.2020 </small>

--- .class #id 

## The Melbourne House Prices Application

The __MHPMap App__ is an interactive application helping you to find a house in Melbourne, Australia; 

.fragment __Select__ your criteria (number of bedrooms and bathrooms, the city district and the desired rice Range) from the Drop Down and Slider menu;

.fragment __Visualise__, whithin an interactive map, where the matching houses are located;

.fragment __Compare__ the mean prices of your criteria with the rest of the city;

.fragment MHPMap has been developed using [shiny](https://shiny.rstudio.com/). You can find its full code on [GitHub](https://github.com/pacoraggio/MelbourneHousePriceShinyApp) 

--- .class #id 

## Parameter Selection

- The house data are available on [Kaggle](https://www.kaggle.com/anthonypino/melbourne-housing-market#Melbourne_housing_FULL.csv) and consist of more than 30k records containing information, among othersm about house location, number of rooms, price, distance from the Melbourne business center.
- From the User Interface you can select the following parameters:
  - Number of Rooms (drop down menu)
  - Number of Bathrooms (drop down menu)
  - Type of Residency (house, unit/duplex/, town house) (drop down menu)
  - In which Melbourne region you want to search (drop down menu)
  - The price range (slider)
- This parameters are used to filter the data.frame created from the .csv file and the resulting data are displayed on the Melbourne Map

---

## Map Visualization - with code example

This is a map visualization for `houses` type with `3` rooms, `2` bathrooms, in Melbourne `Southern Metropolitan` area. All graphs and plots are based on `plotly`.  


```r
library(plotly)
load("dfmelPres.Rdata")

m = list(
  l = 5,
  r = 5,
  b = 5,
  t = 5,
  pad = 1
)


l <- list(
  font = list(
    size = 8,
    color = "#000"),
  
  bgcolor = "#E2E2E2",
  bordercolor = "#FFFFFF",
  orientation = 'v',
  borderwidth = 10)


p <- plot_ly(df.melPres, type = "scattermapbox") %>%
    add_trace(lat = filter(df.melPres, PriceCategory == "low")$Lattitude,
              lon = filter(df.melPres, PriceCategory == "low")$Longtitude,
              color = paste("<b>Low Price</b>","<br> < 660k"),
              marker = list(color = "darkgreen"),
              hoverinfo = "text",
              hovertext = filter(df.melPres, PriceCategory == "low")$HoverText,
              mode = "markers") %>%
    add_trace(lat = filter(df.melPres, PriceCategory == "medium low")$Lattitude,
              lon = filter(df.melPres, PriceCategory == "medium low")$Longtitude,
              color = paste("<b>Medium Low Price</b>", "<br> 660k - 910k"),
              marker = list(color = "green"),
              hoverinfo = "text",
              hovertext = filter(df.melPres, PriceCategory == "medium low")$HoverText,
              mode = "markers") %>%
    add_trace(lat = filter(df.melPres, PriceCategory == "medium high")$Lattitude,
              lon = filter(df.melPres, PriceCategory == "medium high")$Longtitude,
              color = paste("<b>Medium High Price</b>","<br> 910K - 1.33M"),
              marker = list(color = "orange"),
              hovertext = filter(df.melPres, PriceCategory == "medium high")$HoverText,
              hoverinfo = "text",
              mode = "markers")%>%
    add_trace(lat = filter(df.melPres, PriceCategory == "high")$Lattitude,
              lon = filter(df.melPres, PriceCategory == "high")$Longtitude,
              color = paste("<b>High Price</b>","<br> > 1.33M"),
              marker = list(color = "red"),
              hovertext = filter(df.melPres, PriceCategory == "high")$HoverText,
              hoverinfo = "text",
              mode = "markers")%>%
    layout(
      margin = m,
        legend = l,
        mapbox = list(
            style = 'open-street-map',
            zoom =9.5,
            center = list(lon = mean(df.melPres$Longtitude), 
                          lat = mean(df.melPres$Lattitude)))
    )

htmlwidgets::saveWidget(p, file = "demoemap1.html")
cat('<pre><iframe src="demoemap1.html" width=100% height=400px allowtransparency="true"> </iframe></pre>')
```

<pre><iframe src="demoemap1.html" width=100% height=400px allowtransparency="true"> </iframe></pre>

---

## Price Comparison - with code example

In the App a textual summary and a interactive boxplot (using `plotly`) is shown to the user that can easily compare the average price for the selecting paramenters with similar configuration in all Melbourne


```r
# Summary Section

# Preparing Data

load("dfmel.Rdata")

y <- list(
    title = "Residency Price"
)

## Sample Parameters for Presentation purposes
## in the shiny app they are input variables from UI

rrooms <- 3
bbathrooms <- 2
ttype <- "h"
region <- "Southern Metropolitan"

## slicing for the parameters in All region.
df.mel1 <- df.mel[which(df.mel$Rooms %in% rrooms &
                            df.mel$Bathroom %in% bbathrooms &
                            df.mel$Type %in% ttype),]

## slicing for the parameters in Sample region.
df.melPres <- df.mel[which(df.mel$Rooms %in% rrooms &
                               df.mel$Bathroom %in% bbathrooms &
                               df.mel$Type %in% ttype &
                               df.mel$Regionname %in% region),]
### Preparing Table

a1 <- paste('<b>Summary</b><br>', as.character(unique(df.melPres$Regionname)))
a2 <- '<b>Summary</b><br>All regions'

row.values <- c("Matches","Mean Price ($)", "Standard Dev ($)")

region.stat <- c(round(nrow(df.melPres),0), 
                 round(mean(df.melPres$Price),0), 
                 round(sd(df.melPres$Price),0))

all.stat <- c(round(nrow(df.mel1),0), 
             round(mean(df.mel1$Price),0), 
             round(sd(df.mel1$Price),0))

## Plotly Table

t <- plot_ly(
    type = 'table',
    header = list(
        values = c('', a1,a2),
        line = list(color = '#506784'),
        fill = list(color = '#119DFF'),
        align = c('left','center'),
        font = list(color = 'white', size = 8)
    ),
    cells = list(
        values = rbind(
            row.values,
            region.stat,
            all.stat),
        line = list(color = '#506784'),
        fill = list(color = c('#25FEFD', 'white')),
        align = c('left', 'center'),
        font = list(color = c('#506784'), size = 8)
    ))

## Plotly boxplot

p <- plot_ly(y = ~df.melPres$Price, 
             type = "box",
             name = "Southern Metropolitan") %>%
    add_trace(y = ~df.mel1$Price,
              name = "All region") %>%
    layout(yaxis = y, title = "Summary and Price Comparison")

## Merging graphs
tp <- subplot(t, p, nrows = 2, 
              titleX = T,
              shareY = FALSE, shareX = FALSE)

htmlwidgets::saveWidget(tp, file = "summary.html")
cat('<pre><iframe src="summary.html" width=100% height=400px allowtransparency="true"> </iframe></pre>')
```

<pre><iframe src="summary.html" width=100% height=400px allowtransparency="true"> </iframe></pre>

.fragment The End
