import plotnine

from plotnine.data import mpg
from plotnine import ggplot, aes, geom_line, geom_point, element_rect, theme, element_blank

##The "MPG" data set is a subset of the fuel economy data file that the Environment Protection(EPA) makes available on http://fueleconomy.gov. 
##The data set contains fuel economy data from 1999 and 2008 for the 38 popular models cars, with 11 variables and 234 observations.
print(mpg)

## Call the ggplot() function which creates a black canvas
ggplot(mpg)

## Specify aesthetics mapping which specify how you want to map variables to visual aspects. 
##Let's map displacement and highway miles, and add new layers that are geometric objects.
ggplot(mpg, aes(x="displ", y="hwy"))

## In this case, we add we add geom_point to add a layer with points elements as the geographic shape to represent data
ggplot(mpg, aes(x="displ", y="hwy"))+geom_point()

## For example, adding a layer of color
ggplot(data=mpg)+ geom_point(mapping = aes(x="displ", y="hwy", color= "class"))

## Adding a border
ggplot(data=mpg)+ geom_point(mapping = aes(x="displ", y="hwy", color= "class"))+theme(panel_border = element_rect(color = "blue", linetype="dashed"))      

## Removing Background
ggplot(data=mpg)+ geom_point(mapping = aes(x="displ", y="hwy", color= "class"))+theme(panel_background = element_rect(fill="White"))

##Removing an element for example,a border
ggplot(data=mpg)+ geom_point(mapping = aes(x="displ", y="hwy", color= "class"))+theme(panel_border = element_blank())



##Exercise 1 Make a bar chart that counts number of cars in each type


## Exercise 2 Make a histogram of highway miles per galon


## Exercise 3 Show relationship between citymiles per galon and highway miles per galon


## Exercise 4 Reverse the Scale in Exercise-3


## Exercise 5 Add a Regression line

