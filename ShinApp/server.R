#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny);library(UsingR);data(diamond)

shinyServer(function(input, output) {
  model <- lm(price ~ carat, data=diamond)
  
  modelpred <- reactive({
          caratInput <- input$sliderCarat
          predict(model, newdata=data.frame(carat=caratInput))
  })
  
  output$plot1 <- renderPlot({
          caratInput <- input$sliderCarat
          plot(diamond$carat, diamond$price, xlab = "Carat", 
               ylab= "Price (Singapore dollars)", bty="n", pch=16,
               xlim= c(0.1,0.4), ylim= c(200,1100))
          if(input$showRegLine){
                  abline(model, col="red",lwd=2)
          }
  points(caratInput, modelpred(), col= "red", pch=16, cex=2) 
  })
  output$pred <- renderText({
          round(modelpred(),2)
  })
})
