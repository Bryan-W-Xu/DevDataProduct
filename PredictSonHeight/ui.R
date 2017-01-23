#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Predicting Son's Height"),

  mainPanel(

        h5("(One Panel Design for Cellphones)"),

       # Show output plot from server.R
       plotOutput("outplot"),

       # Show text output from server.R
       htmlOutput("pred"),

       # Sidebar with a slider input for number of bins
       sliderInput("sliderFH",
                   "Slide to select Father's Height (inches):",
                   min = 60,
                   max = 75,
                   value = 60,
                   step = 0.25,
                   width = '100%')
    )
  )
)
