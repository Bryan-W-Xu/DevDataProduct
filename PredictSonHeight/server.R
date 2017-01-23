#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
      library(UsingR)
      data("father.son")

      model <- lm(sheight ~ fheight, data = father.son)

      pred <- reactive({
              inputFH <- input$sliderFH
              predict(model, newdata = data.frame(fheight = inputFH))
      })

      output$outplot <- renderPlot({
          inputFH <- input$sliderFH
          par( mar= c(4,4,1,2))
          plot(father.son$fheight, father.son$sheight,
               xlab = "Father's Height",
               ylab = "Son's Height")
          abline(model, col = "blue", lwd = 2)
          points(inputFH, pred(), col = "red", pch = 19,  cex = 3)
      })

      output$pred <- renderText({
          paste("<font color=\"#0000FF\" size=+1><b> Predicted Son's Height: </b></font>",
              "<font color=\"#FF0000\" size=+2><b>", round(pred(), digit=2), "</b></font>",
              "inches")
      })
})
