# load dplyr package
library("dplyr")
library("plotly")
library("ggplot2")

# read the WDVP data sets
world_data <- read.csv("data/wdvp.csv", stringsAsFactors = FALSE)


chart2 <- function(world_data){
  # handling NA values
  world_data$sustainable_economic_development_assessment_seda <- ifelse(world_data$sustainable_economic_development_assessment_seda == "-", NA,
                                                                        as.numeric(world_data$sustainable_economic_development_assessment_seda))
  world_data$world_happiness_report_score <- ifelse(world_data$world_happiness_report_score == "-", NA, as.numeric(world_data$world_happiness_report_score))
  plot2 <- plot_ly(world_data,
                   x = ~sustainable_economic_development_assessment_seda,
                   y = ~world_happiness_report_score,
                   color = ~civil_liberties_score,
                   text = ~iso_country_code,
                   type = "scatter") %>%
    layout(title = "Relationship between sustainability and Hapiness",
           xaxis = list(title = "Sustainable economic growth", nticks = 6),
           yaxis = list(title = "World hapiness report", nticks = 6)) 
  return (plot2)
}
plot <- chart2(world_data)
