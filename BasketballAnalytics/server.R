library(shiny)

# main Shiny server code
#diabetesRisk <- function(glucose) glucose / 200

# Offensive Efficiency
OE <- function(fg, fga, orb, a, to) {
     (fg+a)/(fga-orb+a+to)
}

# Efficient Offensive Production

EOP <- function(pts, fg, fga, orb, a, to) {
     oe <- OE(fg, fga, orb, a, to)
     EOP <- 1.5*(.76*a + pts)*oe
     round(EOP)
}

shinyServer(
     
     function(input, output) {
#          output$inputValue <- renderPrint({input$glucose})
          output$name <- renderPrint({input$name})
          output$pts <- renderPrint({input$pts})
          output$fg <- renderPrint({input$fg})
          output$fga <- renderPrint({input$fga})
          output$orb <- renderPrint({input$orb})
          output$a <- renderPrint({input$a})
          output$to <- renderPrint({input$to})
          
          output$eopValue <- renderPrint({EOP(input$pts, input$fg, input$fga, input$orb, input$a, input$to)})
          
          #          output$risk <- renderPrint({diabetesRisk(input$pts)})

     }
)
