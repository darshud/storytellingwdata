# Needed Libraries

library(ggplot2); # for data visualization
library(dplyr);    # for data munging and preparation
library(scales);   # for nicer axis scale labels
library(gapminder); # for accessing the dataset

# Explore the data and all the variables

str(gapminder);
summary(gapminder);

# See the distribution of countries across the continents

ggplot(gapminder, aes(x=continent)) + geom_bar()

# Exercise-1: In the plot above, add continent to color

ggplot(gapminder, aes(x=continent, fill=continent)) + geom_bar()

# Transform the y axis variable and add labels

plt<- ggplot(gapminder, aes(x=continent, fill=continent)) + 
  geom_bar(aes(y=..count../12)) +
  labs(y="Number of countries") +
  guides(fill=FALSE);
plt


# Save the created ggplot as a web page

library(htmlwidgets)
library(plotly)

l <- plotly::ggplotly(plt)
htmlwidgets::saveWidget(as_widget(l), "index.html")


# Median Life expectancy of different continents over time: Using dplyr to summarize into plot

p<- gapminder %>%
  group_by(continent, year) %>%
  summarise(lifeExp=median(lifeExp)) %>%
  ggplot(aes(x=year, y=lifeExp, color=continent)) +
  geom_line(size=1) + 
  geom_point(size=1.5)
p

#Bringing graph to life with hovering tooltips

library(plotly)
ggplotly(p)

# Exploring relationship between gdp per capita and life expectancy: Creating scatter plot and adding continent into color

 ggplot(data=gapminder,
              aes(x=gdpPercap, y=lifeExp))+ geom_point() + geom_point(aes(color=continent))


#Exercise-2: Exploring the relationship by fitting a curve in the plot created: Smooth line with locally weighted smoothing

 ggplot(data=gapminder,
        aes(x=gdpPercap, y=lifeExp))+ geom_point() + geom_point(aes(color=continent)) + geom_point(aes(color=continent)) +
  geom_smooth(method="loess") 

# Add Animations to the relationship explored
 
library(gganimate)
library(transformr)
library(gifski)
 
 plt<- ggplot(data=gapminder,
        aes(x=gdpPercap, y=lifeExp))+ geom_point() + geom_point(aes(color=continent)) + geom_point(aes(color=continent)) +
   geom_smooth(method="loess") + transition_time(year) 

 
 animate(plt, renderer = gifski_renderer())
 anim_save("output.gif")
 

# Making the animation more effective by adding the population in the size of the bubble 
library(animation)
 
myplt<- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, color = continent)) +
  geom_point() +
  scale_x_log10() +
  theme_bw() +
  # gganimate specific bits:
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  transition_time(year) +
  ease_aes('linear')

animate(myplt, duration = 5, fps = 20, width = 500, height = 500, renderer = gifski_renderer())
anim_save("output.gif")



# Visualize more intricate relationship dynamics with plotly_hoever: Interactive Plot 

library(plotly)
g <- crosstalk::SharedData$new(gapminder, ~continent)
gg <- ggplot(g, aes(gdpPercap, lifeExp, color = continent, frame = year)) +
  geom_point(aes(size = pop, ids = country)) +
  geom_smooth(se = FALSE, method = "lm") +
  scale_x_log10()
ggplotly(gg) %>% 
  highlight("plotly_hover")

#ggplot2, plotly, crosstalk and DT: How plotly binds with other html widgets
library(crosstalk)
library(DT)
m<- highlight_key(mpg)
p<-ggplot(data=mpg, mapping =aes(x=displ, y =hwy))+ geom_point()
 
iplt <- highlight(p = ggplotly(p), on = "plotly_selected")
 
bscols(iplt,datatable(m))
 

