#30DayMapChallenge | Day 24 | Historical Map
#viae Romanae (Roman Roads)
#Data from ArcGIS Hub
#https://hub.arcgis.com/datasets/HWS::roman-roads/about
#Full citation: DARMC Scholarly Data Series Citation: McCormick, M. et al. 2013. "Roman Road Network (version 2008)," DARMC Scholarly Data Series, Data Contribution Series #2013-5. DARMC, Center for Geographic Analysis, Harvard University, Cambridge MA 02138.


#libraries
library(geojsonio)
library(ggplot2)
library(showtext)

## Add Font
font_add_google(name = "Open Sans", family = "open sans")

# turn on showtext
showtext_auto()

# read the geojson file
library(geojsonio)
roads <- geojson_read("/Users/ryan.hart/30 Day Map Challenge 2021/Roman_roads.geojson",  what = "sp")

#fortify to dataframe format
library(broom)
roads_fortified <- tidy(roads)

#plot
ggplot() +
  geom_line(data = roads_fortified, aes( x = long, y = lat, group = group), color="white", size = 0.1) +
  theme_void() +
  coord_map() +
  labs(title = "viae Romanae",
       subtitle = "Ancient roads of the Roman Empire",
       caption = "Design: @ryanahart \nData: McCormick, M. et al. 2013. Roman Road Network (version 2008), DARMC #2013-5") +
  theme(text = element_text(color="white", family = "open sans"),
        plot.title = element_text(face = "bold",
                                  hjust = 0.5,
                                  size = 18),
        plot.subtitle = element_text(hjust = 0.5,
                                     size = 10),
        plot.caption = element_text(hjust = 0.5,
                                    size = 6),
        plot.margin =  margin(15, 15, 15, 15),
        plot.background = element_rect(fill="#121212", color=NA)
        )

#save
ggsave("viae_Romanae.png", units = "in", width=6, height=6)

