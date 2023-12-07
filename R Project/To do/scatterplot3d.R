# Install and load necessary packages
#install.packages("scatterplot3d")
library(scatterplot3d)

# Generating sample data (replace this with your own data)
set.seed(123)
num_points <- 100
yield <- rnorm(num_points, mean = 50, sd = 15)
temperature <- rnorm(num_points, mean = 25, sd = 5)
rainfall <- rnorm(num_points, mean = 100, sd = 30)

# Create a data frame with the generated data
agri_data <- data.frame(Yield = yield, Temperature = temperature, Rainfall = rainfall)

# Create a 3D scatterplot using scatterplot3d package
scatterplot3d(agri_data$Temperature, agri_data$Rainfall, agri_data$Yield, 
              xlab = "Temperature", ylab = "Rainfall", zlab = "Yield",
              color = "blue", pch = 16, main = "Agricultural Analytics Scatterplot")

# You can add more customization options or viewpoints, for example:
# scatterplot3d(..., type = "h", angle = 55)
