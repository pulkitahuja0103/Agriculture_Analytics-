library(shiny)
library(DT)

# Sample dataset with crop recommendations
dataset<-read.csv("D:\\Crop\\Crop_production.csv")
names(dataset)
crop_data <- data.frame(
  Crop = dataset$Crop,
  Nitrogen = dataset$N,
  Phosphorus = dataset$P,
  Potassium = dataset$K,
  pH = dataset$pH,
  Rainfall = dataset$rainfall,
  City =dataset$State_Name
  
  
)

ui <- fluidPage(
  titlePanel("Crop Recommendation"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("nitrogen", "Nitrogen Level (kg/ha):"),
      textInput("phosphorus", "Phosphorus Level (kg/ha):"),
      textInput("potassium", "Potassium Level (kg/ha):"),
      textInput("ph", "pH Level:"),
      textInput("rainfall", "Rainfall (mm/year):"),
      selectInput("State", "Select State:", choices = unique(crop_data$City)),
      actionButton("recommend", "Recommend Crop")
    ),
    mainPanel(
      DTOutput("recommendation_table")
    )
  )
)

server <- function(input, output) {
  observeEvent(input$recommend, {
    selected_city_data <- crop_data[crop_data$City == input$city, ]
    
    recommended_crops <- selected_city_data[
      (selected_city_data$Nitrogen >= as.numeric(input$nitrogen)) &
        (selected_city_data$Phosphorus >= as.numeric(input$phosphorus)) &
        (selected_city_data$Potassium >= as.numeric(input$potassium)) &
        (selected_city_data$pH >= as.numeric(input$ph)) &
        (selected_city_data$Rainfall <= as.numeric(input$rainfall)), ]
    
    output$recommendation_table <- renderDT({
      datatable(recommended_crops)
    })
  })
}

shinyApp(ui, server)
