library(plotly)
load("dfmelPres.Rdata")


hd <- highlight_key(df.mel, ~PriceCategory)

names(df.mel)
p <-  plot_ly(hd, type = "scattermapbox",
              lat = ~Lattitude,
              lon = ~Longtitude,
              color = ~PriceCategory,
              #marker = list(color = df.mel$MarkerColor),
              text = ~HoverText) %>%
    add_trace(mode = "markers") %>%
    layout(
        #showlegend = FALSE,
    #    legend = l,
        mapbox = list(
            style = 'open-street-map',
            zoom =9.5,
            center = list(lon = mean(df.mel$Longtitude), 
                          lat = mean(df.mel$Lattitude))))

p
    

# p <- plot_ly(df.mel, type = "scattermapbox") %>%
#     add_trace(lat = filter(df.mel, PriceCategory == "low")$Lattitude,
#               lon = filter(df.mel, PriceCategory == "low")$Longtitude,
#               # color = paste("<b>Low Price</b>","<br> < 660k"),
#               color = "Low Price",
#               marker = list(color = "darkgreen"),
#               hoverinfo = "text",
#               hovertext = filter(df.mel, PriceCategory == "low")$HoverText,
#               mode = "markers")


l <- list(
    x = 0.1, 
    y = 0.9,
    font = list(
        #family = "sans-serif",
        size = 12,
        color = "#000"),
    
    bgcolor = "#E2E2E2",
    bordercolor = "#FFFFFF",
    orientation = 'v',
    borderwidth = 1)


p <- plot_ly(df.mel, type = "scattermapbox") %>%
    add_trace(lat = filter(df.mel, PriceCategory == "low")$Lattitude,
              lon = filter(df.mel, PriceCategory == "low")$Longtitude,
              # color = paste("<b>Low Price</b>","<br> < 660k"),
              color = "Low Price",
              marker = list(color = "darkgreen"),
              hoverinfo = "text",
              hovertext = filter(df.mel, PriceCategory == "low")$HoverText,
              mode = "markers") %>%
    add_trace(lat = filter(df.mel, PriceCategory == "medium low")$Lattitude,
              lon = filter(df.mel, PriceCategory == "medium low")$Longtitude,
              #color = paste("<b>Medium Low Price</b>", "<br> 660k - 910k"),
              color = "Low Price",
              marker = list(color = "green"),
              hoverinfo = "text",
              hovertext = filter(df.mel, PriceCategory == "medium low")$HoverText,
              mode = "markers") %>%
    add_trace(lat = filter(df.mel, PriceCategory == "medium high")$Lattitude,
              lon = filter(df.mel, PriceCategory == "medium high")$Longtitude,
              #color = paste("<b>Medium High Price</b>","<br> 910K - 1.33M"),
              color = "Low Price",
              marker = list(color = "orange"),
              hovertext = filter(df.mel, PriceCategory == "medium high")$HoverText,
              hoverinfo = "text",
              mode = "markers")%>%
    add_trace(lat = filter(df.mel, PriceCategory == "high")$Lattitude,
              lon = filter(df.mel, PriceCategory == "high")$Longtitude,
              #color = paste("<b>High Price</b>","<br> > 1.33M"),
              color = "Low Price",
              marker = list(color = "red"),
              hovertext = filter(df.mel, PriceCategory == "high")$HoverText,
              hoverinfo = "text",
              mode = "markers")%>%
    layout(
        #showlegend = FALSE,
        legend = l,
        mapbox = list(
            style = 'open-street-map',
            zoom =9.5,
            center = list(lon = mean(df.mel$Longtitude), 
                          lat = mean(df.mel$Lattitude)))
    )

p

rm(list = ls())
library(plotly)

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
    layout(yaxis = y, showlegend = FALSE)

## Merging graphs
tp <- subplot(t, p, nrows = 2, shareY = FALSE, shareX = FALSE)

tp