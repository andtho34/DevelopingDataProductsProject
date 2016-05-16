#server.R Course Project

library(shiny)
library(AppliedPredictiveModeling)
data(concrete)
source("helpers.R")

shinyServer(function(input, output){
        
        output$plot <- renderPlot({
                data <- switch(input$radio,
                               "Cement" = concrete[,c("Cement", "CompressiveStrength")],
                               "Water" = concrete[,c("Water", "CompressiveStrength")],
                               "Fine Aggregate" = concrete[,c("FineAggregate", "CompressiveStrength")],
                               "Coarse Aggregate" = concrete[,c("CoarseAggregate", "CompressiveStrength")])
                plot(data)
        })

        output$text1 <- renderText({
                paste("You have selected", input$radio)
        })
        
        
        output$prediction <- renderPrint({generatePrediction(input$cem, input$wat, input$fa, input$ca)})
})