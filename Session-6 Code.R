

#Requiring needed packages
library (lubridate);

library (plotly);


#Reading Data File
data <- read.csv("World Indicators.csv");

# Exploring Data and Understanding Data Type

str(data);
summary(data);
head(data);

# Infant Mortality higher in poor countries? Build a Simple Scatter Plot

fig <- plot_ly(data = data, x = ~GDP, y = ~Infant.Mortality.Rate);
fig;

# Let's make it beautiful--Build a Styled Scatter Plot
fig <- plot_ly(data = data, x = ~GDP, y = ~Infant.Mortality.Rate, marker = list(size = 10,color = 'rgba(255, 182, 193, .9)',line = list(color = 'rgba(152, 0, 0, .8)',
                                                                                                                                  width = 2)));
fig <- fig %>% layout(title = 'GDP vs. Infant Mortality', yaxis = list(zeroline = FALSE), xaxis = list(zeroline = FALSE));
fig;

# How GDP of the World Changing over time? Filled line graph


fig <- plot_ly(data, x = ~Year, y = ~GDP, name= 'GDP', type = 'scatter', mode = 'none', fill = 'tozeroy');

fig;

# Which Region is producing the highest CO2 Emission? Bar graph

fig <- plot_ly(data, x = ~Region, y = ~CO2.Emissions, type = 'bar');

fig;

# Create a boxplot of birthrate and show all the regions on the plot

fig <- plot_ly(data, x = ~Birth.Rate, y = ~Region, type = "box");

fig;

# Create a histogram of internet usage

fig <- plot_ly(data, x = ~Internet.Usage, type = "histogram");
fig;