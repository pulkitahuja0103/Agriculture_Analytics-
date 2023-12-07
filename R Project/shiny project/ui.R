library(shiny)
library(shinydashboard)
library(dplyr)
library(DT)
library(ggplot2)

dashboardPage(
  dashboardHeader(title = "Exploring the crop production data of three year",
                  titleWidth = 750,
                  tags$li(class="dropdown",tags$a(href="https://www.linkedin.com/in/pulkit-ahuja-907876198/" ,icon("linkedin"), "LinkedIn", target="_blank"))),
                  
  dashboardSidebar(
    sidebarMenu(id ="sidebar",
                menuItem("Dataset",tabName = "data",icon = icon("database")),
                menuItem("visualization",tabName = "viz",icon = icon("chart-line")),
                conditionalPanel("input.sidebar == 'viz' && input.t2 == 'distri'", selectInput(inputId = "var1" , label ="Select the Variable" , choices = c1)),
                conditionalPanel("input.sidebar == 'viz' && input.t2 == 'trends' ", selectInput(inputId = "var2" , label ="Select the state" , choices = c2)),
                conditionalPanel("input.sidebar == 'viz' && input.t2 == 'relation' ", selectInput(inputId = "var3" , label ="Select the X variable" , choices = c1, selected = "temperature")),
                conditionalPanel("input.sidebar == 'viz' && input.t2 == 'relation' ", selectInput(inputId = "var4" , label ="Select the Y variable" , choices = c1, selected = "rainfall"))
                
               
                )
  ),
  dashboardBody(
       tabItems(
         #first tab items are
         tabItem(tabName = "data",
                 #individual tab box
                 tabBox(id="t1",width = 12,
                        tabPanel("about",icon = icon("address-card"),
                                 fluidRow(
                                   column(width = 8, tags$img(src="Farm.gif", width =600 , height = 300),
                                          tags$br() , 
                                          tags$a("A gif video for project"), align = "center"),
                                   column(width = 4, tags$br() ,
                                          tags$p("This dataset is the combination of three datasets which consists types of crops grown in different regions of the country and the fertilizers used as well as the basic requirements of fertilizers required to grow different types of the crop.")
                                   ))),
                        tabPanel(title="Crops",icon = icon("address-card"),dataTableOutput("dataT")),
                        tabPanel(title="Fertilizer",icon = icon("address-card"),verbatimTextOutput("structure")),
                        tabPanel(title="Crop-recommend",icon = icon("address-card"),verbatimTextOutput("summary"))
                        
                        
                        )
                 ),
         
         #second tab item
         tabItem(tabName = "viz",
                 #individual tab box
                 tabBox(id="t2",width = 12,
                        tabPanel(title="Crop trends by State",value = "trends",plotlyOutput("bar")),
                        tabPanel(title="Distribution",value = "distri",plotlyOutput("hisplot")),
                        tabPanel(title="Relation",value = "relation",
                        radioButtons("fit",label = "select smooth method",choices = c("loess","lm"),selected = "lm",inline = TRUE),        
                                 plotlyOutput("scatter"))
                        )
                 )
         
       )
  )
  )


