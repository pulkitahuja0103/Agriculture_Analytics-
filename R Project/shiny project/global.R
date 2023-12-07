#crop prediction and recommendation 
library(dplyr)
library(plotly)
library(ggtext)
library(ggplot2)


my_data <- read.csv("Crop.csv", header = TRUE, sep = ",")
my_data
crop_recommendation <- read.csv("crop_recommendation.csv",header = TRUE, sep = ",")
crop_recommendation
fertilizer <- read.csv("fertilizer.csv",header = TRUE, sep = ",") 
fertilizer

#structure of our dataset
fertilizer 
 

#brief asummary of our data
options(max.print = 20000)
crop_recommendation
  

#first few observations of the data
my_data %>%
  head(500)

#for second that is visualization 
#creating plots 



#choices for selection 
c1 = my_data%>%
  select(-State_Name)%>%
  names()

c2 =my_data%>%
  select("State_Name","Production_in_tons")%>%
  names()

#creating scatterplot for relation
