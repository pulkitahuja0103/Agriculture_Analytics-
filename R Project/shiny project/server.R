library(DT)
library(ggplot2)
function(input,output,session){
  
  #structure and data of fertilizer
  output$structure <- renderPrint(
    #structure of our dataset
    fertilizer 
   
  )
  #summary
  output$summary <- renderPrint(
     #summary of our data   
    crop_recommendation
      
  )
    
  #dataTable
  output$dataT <- renderDataTable(
     my_data
  )
  
  #stacked histogram and boxplot
  output$hisplot <- renderPlotly({
    p1= my_data%>%
      plot_ly()%>%
      add_histogram(x=~get(input$var1))%>%
      layout(xaxis = list(title = paste(input$var1)))
    
    #boxplot
    p2= my_data%>%
      plot_ly()%>%
      add_boxplot(x=~get(input$var1))%>%
      layout(yaxis =list(showticklabels =F)) 
    #stacking plots 
    
    subplot(p2,p1,nrows = 2, shareX = TRUE)%>%
      hide_legend()%>%
      layout(title="Crop production chart",
             yaxis=list(title = "production in tonnes"))
  })
  
  #scatter plot
  output$scatter <- renderPlotly({
  p = my_data
    ggplot(my_data,aes(x=get(input$var3),y=get(input$var4))) +
      geom_point() +
      geom_smooth(method = get(input$fit)) +
      labs(title = paste("relationship between",input$var3,"and",input$var4),
           x=input$var3,
           y=input$var4) +
      theme(plot.title = element_textbox_simple(size = 10,
                                                halign = 0.8))
    
    })
  
  #bar chart for crop trends in state 
  output$bar <- renderPlotly({
    my_data%>%
    plot_ly()%>%
      add_bars(x=~State_Name,y=~get(input$var2))%>%
      layout(title = paste("Statewise production of Crops for",input$var2),
             xaxis=list(title="State_Name"),
             yaxis = list(title =paste(input$var2,"amount of production")
             )
      )
  })
  
    
  
   
  }
