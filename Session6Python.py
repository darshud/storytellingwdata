#Requiring needed packages

import plotnine

from plotnine.data import mpg
from plotnine import ggplot, aes, geom_line, geom_point, element_rect, theme, element_blank

import numpy as np
import pandas as pd

## Plotly allows quick visuals

import plotly
import plotly.express as px

#Reading Data File
#Get data file by extracting World Indicators from Tableau as CSV, and then naming the file "World Indicators.csv".

data = pd.read_csv('World Indicators.csv')

# Exploring Data and Understanding Data Type

print(data)
print(data.head())

# Is Infant Mortality higher in poor countries? Build a Simple Scatter Plot

fig = px.scatter(data_frame = data, x = "GDP", y = "Infant Mortality Rate");
fig.show()

# Let's create the same using ggplot

ggplot(data, aes(x="GDP", y="Infant Mortality Rate"))+geom_point(color = "blue")

# Let's make it beautiful--Build a Styled Scatter Plot with Plotly

fig = px.scatter(data_frame = data, x = "GDP", y = "Infant Mortality Rate")
fig.update_traces(marker = dict(size=10, color = 'rgba(255, 182, 193, .9)', line=dict(width=2, color='rgba(152, 0, 0, .8)')))
fig.update_layout(
    title = 'GDP vs. Infant Mortality',
    yaxis = dict(zeroline = False),
    xaxis = dict(zeroline = False)
)

# Let's learn such basic beautifying with ggplot

ggplot(data, aes(x="GDP", y="Infant Mortality Rate"))+geom_point(fill="pink", color="darkred", size=3)

# How GDP of the World Changing over time? Filled line graph

fig = px.area(data_frame = data, x = "Year", y = "GDP", line_group="Country/Region")
fig.show();

# How GDP of different countries are changing over time?

ggplot(data, aes(x= "Year", y = "GDP", group="Country/Region")) + geom_line() + geom_point()

# Which Region is producing the highest CO2 Emission? Bar graph

fig = px.bar(data_frame = data, x = "Region", y = "CO2 Emissions")
fig.show()

# Compare Europe and Africa in terms the member countries' birth rates to share your insights? Create a Boxplot of birthrate and show all the regions on the plot

fig = px.box(data_frame = data, x = "Region", y = "Birth Rate")
fig.show()

# Create a histogram of internet usage

fig = px.histogram(data_frame = data, x = "Internet Usage")
fig.show()
