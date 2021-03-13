

#Requiring needed packages


## Plotly allows quick visuals

library (plotly);

#Reading Data File
data <- read.csv("World Indicators.csv");

# Exploring Data and Understanding Data Type

str(data);
summary(data);
head(data);

# Is Infant Mortality higher in poor countries? Build a Simple Scatter Plot

fig <- plot_ly(data = data, x = ~GDP, y = ~Infant.Mortality.Rate);
fig;

# Let's create the same using ggplot

ggplot (data, aes(x=GDP, y=Infant.Mortality.Rate))+geom_point(color = "blue");

# Let's make it beautiful--Build a Styled Scatter Plot with Plotly

fig <- plot_ly(data = data, x = ~GDP, y = ~Infant.Mortality.Rate, marker = list(size = 10,color = 'rgba(255, 182, 193, .9)',line = list(color = 'rgba(152, 0, 0, .8)',
                                                                                                                                  width = 2)));
fig <- fig %>% layout(title = 'GDP vs. Infant Mortality', yaxis = list(zeroline = FALSE), xaxis = list(zeroline = FALSE));
fig;

# Let's learn such basic beautifying with ggplot

ggplot (data, aes(x=GDP, y=Infant.Mortality.Rate))+geom_point(shape=23, fill="pink", color="darkred", size=3)

# How GDP of the World Changing over time? Filled line graph


fig <- plot_ly(data, x = ~Year, y = ~GDP, name= 'GDP', type = 'scatter', mode = 'none', fill = 'tozeroy');

fig;

# How GDP of different countries are changing over time?

ggplot(data, aes(x=Year, y=GDP, group=ï..Country.Region)) +
  geom_line() + geom_point()


# Which Region is producing the highest CO2 Emission? Bar graph

fig <- plot_ly(data, x = ~Region, y = ~CO2.Emissions, type = 'bar');

fig;


# Compare Europe and Africa in terms the member countries' birth rates to share your insights? Create a Boxplot of birthrate and show all the regions on the plot

fig <- plot_ly(data, x = ~Birth.Rate, y = ~Region, type = "box");

fig;

# Create a histogram of internet usage

fig <- plot_ly(data, x = ~Internet.Usage, type = "histogram");
fig;