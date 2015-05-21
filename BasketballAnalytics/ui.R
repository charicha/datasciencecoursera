library(shiny)

shinyUI(fluidPage(
     pageWithSidebar(
          # Application title
          headerPanel("NBA Basketball - Advanced Analytics Calculation"),
          sidebarPanel(
               textInput('name', 'Player Name', value='Lebron James 2014-15'),
               numericInput('pts', 'Total points scored', 1743, min = 0, max = 100, step = 1),
               numericInput('fg', 'Total Field Goals made', 624, min = 0, max = 100, step = 1),
               numericInput('fga', 'Total Field Goals attempted', 1279, min = 0, max = 100, step = 1),
               numericInput('orb', 'Offensive Rebounds', 51, min = 0, max = 100, step = 1),
               numericInput('a', 'Assists', 511, min = 0, max = 100, step = 1),
               numericInput('to', 'Turnovers', 272, min = 0, max = 100, step = 1),
               submitButton('Submit')
          ),
          mainPanel(
               h3('Efficient Offensive Production (EOP)'),
               h4('You entered game data for'),
                verbatimTextOutput("name"),
               h4('His EOP is'),
               textOutput("eopValue")
          )
     )
))

