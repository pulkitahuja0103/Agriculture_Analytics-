library(shiny)
library(shinyjs)

ui <- fluidPage(
  uiOutput("page_content")
)

server <- function(input, output, session) {
  # Initialize user as NULL
  user <- reactiveVal(NULL)
  
  # Login page
  login_page <- function() {
    tagList(
      div(
        textInput("username", "Username"),
        passwordInput("password", "Password"),
        br(),
        actionButton("login", "Login")
      )
    )
  }
  
  # Main content page
  main_content <- function() {
    tagList(
     # h2("Welcome to the Dashboard!"),
      #p("You are logged in as admin."),
      #br(),
    
    
  
    
    
    actionButton("button1", "Open Page 1"),
    
      actionButton("logout", "Logout")
    )
  }
  
  output$page_content <- renderUI({
    if (is.null(user())) {
      login_page()
    } else {
      main_content()
    }
  })
  
  observeEvent(input$login, {
    if (input$username == "admin" && input$password == "admin") {
      user("admin")
    } else {
      # Handle invalid login
      showModal(
        modalDialog(
          title = "Invalid Login",
          "Please enter the correct username and password.",
          easyClose = TRUE,
          footer = NULL
        )
      )
    }
  })
  
  observeEvent(input$logout, {
    user(NULL)
  })
  
  
  observeEvent(input$button1, {
    output$page_content <- renderUI({
      fluidPage(
        h2("Page 1"),
        p("This is the content for Page 1."),
        actionButton("back", "Back to Main Page")
      )
    })
  })
  
  
  observeEvent(input$back, {
    output$page_content <- renderUI(NULL)
  })
  
  
  
  
}



shinyApp(ui, server)
