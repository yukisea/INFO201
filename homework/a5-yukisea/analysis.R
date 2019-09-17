library("dplyr")
library("plotly")
library("leaflet")
# read csv file
shootings <- read.csv("data/shootings-2018.csv")
# how many shootings occured
num_shootings <- nrow(shootings)
# How many lives were lost?
num_died <- sum(shootings$num_killed)
# Which cities that were most impacted
most_impacted <- shootings %>%
  mutate(impact = num_killed * 3 + num_injured) %>%
  group_by(city) %>%
  summarise(sum_impact = sum(impact), sum_killed = sum(num_killed),
            sum_injured = sum(num_injured)) %>%
  filter(sum_impact == max(sum_impact))

impacted_city <- shootings %>%
  mutate(impact = num_killed * 3 + num_injured) %>%
  filter(impact == max(impact))
# which states were most dangerous
dangerous_state <- shootings %>%
  mutate(impact = num_killed * 3 + num_injured) %>%
  group_by(state) %>%
  summarise(sum_impact = sum(impact), sum_killed = sum(num_killed),
            sum_injured = sum(num_injured)) %>%
  filter(sum_impact == max(sum_impact))

# Summary Table
summary_table <- shootings %>%
  mutate(impact = num_killed * 3 + num_injured) %>%
  group_by(state) %>%
  summarise(sum_killed = sum(num_killed), sum_injured = sum(num_injured),
            sum_impact = sum(impact), mean_impact = mean(impact))

# interactive map
marker_map <- leaflet(data = shootings)  %>%
  addTiles() %>%
  addCircleMarkers(
    lat = ~lat,
    lng = ~ long,
    radius = 10,
    stroke = FALSE,
    popup = ~ date,
    label = ~ paste0("death: ", num_killed, "\n injury: ", num_injured),
    clusterOptions = markerClusterOptions()
  )
  
# additional plot
shootings_state <- shootings %>%
  mutate(num_victims = num_killed + num_injured) %>%
  group_by(state) %>%
  summarise(deaths = sum(num_killed), 
            injuries = sum(num_injured),
            victims = sum(num_victims)) %>%
  arrange(desc(victims))
plot <- plot_ly(data = shootings_state, x = ~state, y = ~deaths, 
                name = "deaths", type = "bar") %>%
  add_trace(y = ~injuries, name = "injuries") %>%
  add_trace(y = ~ victims, name = "victims") %>%
  layout(title = "Victims of each state", yaxis = list(title = "number of people"))
  
  
  
  
  


