# Introductory example using the housing data used here
# http://www.r2d3.us/visual-intro-to-machine-learning-part-1/

library(rpart)
library(rpart.plot)
library(shiny)

# Read in data
source('decision_tree.R')

# Server
server <- function(input, output){
  # Use a reactive expression so that you only run the code once
  get_results <- reactive ({
    return(simple_tree(input$features))
  })
  output$plot <- renderPlot({
    results <- get_results()
    return(results$plot)
  })
  output$accuracy <- renderText({
    results <- get_results()
    return(results$accuracy)
  })
}
