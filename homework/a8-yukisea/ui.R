# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.

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

# Define the first page content
page_one <- tabPanel(
  "Poverty", # label for the tab in the navbar
  titlePanel("Poverty"), # show with a displayed title
  
  # This content uses a sidebar layout
  sidebarLayout(
    sidebarPanel(
      selectInput("column", label = "Select x-axis",
                  choices = colnames(midwest[12:16]), selected = "percwhite"),
      
      selectInput("poverty", label = "Select y-axis",
                  choices = colnames(midwest[21:26]), selected = "percbelowpoverty"),
      
      checkboxInput("smooth", label = strong("Show regression line"), value = TRUE)
      
    ),
    mainPanel(
      h3("Poverty vs Race"),
      p("This graph shows association between poverty and race."),
      p("You can change each axis by selecting columns."),
      p("You also can see the regression line by clicking check box."),
      plotOutput("plot")
    )
  )
)
# Define content for the second page
page_two <- tabPanel(
  "state summary", # label for the tab in the navbar
  titlePanel("State Summary"), # show with a displayed title
  
  # This content uses a sidebar layout
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "state", label = "Select your state",
                  choices = midwest$state, selected = " IL"),
      checkboxInput("pie", label = strong("Convert to pie chart"), value = FALSE)
    ),
    mainPanel(
      h3("State summary"),
      p("This graphs shows the population by ethnicity."),
      p("You can change the state by selecting box."),
      plotOutput("state_ethnicity")
    )
  )
)


# Pass each page to a multi-page layout (`navbarPage`)
shinyUI(
  navbarPage(
    "midwest statsitcs", # application title
    page_one,         # include the first page content
    page_two          # include the second page content
  )
)