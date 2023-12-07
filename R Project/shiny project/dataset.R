?data
crop <- read.csv("Crop.csv", header = TRUE, sep = ",")
crop
crop_recommendation <- read.csv("crop_recommendation.csv",header = TRUE, sep = ",")
crop_recommendation
fertilizer <- read.csv("fertilizer.csv",header = TRUE, sep = ",") 
fertilizer


data()
USArrests
#summary(USArrests)
str(USArrests)

crop%>%
  str()
fertilizer %>%
  str(fertilizer)