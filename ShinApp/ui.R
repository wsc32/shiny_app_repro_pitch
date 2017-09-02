#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny);library(UsingR);data(diamond)

shinyUI(fluidPage(
  titlePanel("Predict diamond prices based on their weights"),
  sidebarLayout(
    sidebarPanel(
       sliderInput("sliderCarat", "What is the weight of the diamond? 
                   Move to slider below to the desired weight of the diamond 
                   and the predicted price will be shown on the right.", 0.12,
                   0.35, value=0.2),
       checkboxInput("showRegLine", "Show/Hide Regression Line", value=TRUE)
    ),
    mainPanel(
       plotOutput("plot1"),
       h3("Predicted price (in Singapore dollars):"),
       textOutput("pred")
    )
  )
))
