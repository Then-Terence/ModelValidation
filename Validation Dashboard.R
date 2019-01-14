
library(shinydashboard)

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Configure Model", tabName = "Configure", icon = icon("ad")),
    menuItem("Load Model", tabName = "Load", icon = icon("ad")),
    menuItem("Validate Model", tabName = "Validate", icon = icon("ad"))
  )
)

body <- dashboardBody(
  tabItems(
    tabItem(tabName = "Configure",
            actionButton("AddVariable", "Add Variable")
    ),
    
    tabItem(tabName = "Load",
            h2("Coming Soon")
    ),
    
    tabItem(tabName = "Validate",
            h2("Coming Soon, too")
    )
  )
)

ui <- dashboardPage(
  dashboardHeader(title = "Model Validation"),
  sidebar,
  body
)

server <- function(input, output) {
  
  Values <- reactiveValues(Number = 1)
  
  # Add Variable - New Variable
  observeEvent(input$AddVariable,{
    Values$Number <- Values$Number + 1
    insertUI(selector = "#AddVariable", where = "beforeBegin",
    textInput(inputId = "Variable", label = "New Variable",
              placeholder = "Name of New Variable")
    )
  })
  
  # Add Variable - Remove Variable
  observeEvent(input$AddVariable,{
    insertUI(selector = "#AddVariable", where = "beforeBegin",
             actionButton("RemoveVariable", "Remove Variable")
    )
  })
  
  # Add Variable - Add Option
  observeEvent(input$AddVariable,{
    insertUI(selector = "#AddVariable", where = "beforeBegin",
             actionButton("AddOption", "Add Option")
    )
  })
}


shinyApp(ui, server)
