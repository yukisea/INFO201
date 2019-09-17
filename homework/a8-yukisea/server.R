# load library
library("shiny")
library("ggplot2")
library("dplyr")
library("tidyr")

# data wrangling
midwest <- midwest
state_data <- midwest %>%
  group_by(state) %>%
  summarise(black = sum(popblack), white = sum(popwhite),
            asian = sum(popasian), other = sum(popother))

# Create a server function that defines a `message` output based on a
# `username` input
shinyServer(function(input, output){
  # reactive expression
  filtered <- reactive({
    data <- state_data %>%
      filter(state == input$state) %>%
      gather(key = "race", value = "population", -1)
    data # return data
  })
  
  # draw a plot
  output$state_ethnicity <- renderPlot({
    chart <- ggplot(data = filtered(), mapping = aes_string(x ="race" , y ="population", fill = "race")) +
      geom_bar(stat = "identity", width=1)
    
    # convert to pie chart
    if (input$pie) {
      chart <- chart + coord_polar("y")
    }
    
    chart # return the plot
  })
  
  # Assign a reactive `renderPlot()` function to the outputted 'plot' value
  output$plot <- renderPlot({
    p <- ggplot(data = midwest, mapping = aes_string(x =input$column, y = input$poverty, color = "state")) +
      geom_point() +
      labs(x = "Race", y = "Poverty rate")
    
    # draw a regression line
    if (input$smooth) {
      p <- p + geom_smooth(se = FALSE)
    }
    p # return the plot
  })
})
