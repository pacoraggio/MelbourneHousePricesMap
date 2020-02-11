library(plotly)
load("dfmel.Rdata")

print(getwd())
# print(median(df.mel$Lattitude)
# print(median(df.mel$Longtitude)

 plot_ly(df.mel, type = "scattermapbox") %>%
    layout(
        mapbox = list(
            style = 'open-street-map',
            zoom =9.5,
            center = list(lon = mean(df.mel$Longtitude),
                          lat = mean(df.mel$Lattitude)))
    )
