#PAC2
setwd('/your_dir')

library(ggplot2)
library(reshape2)
library(gridExtra)
library(dplyr)


#PLOT1
data<-read.csv(file = "number-without-electricity-by-region.csv", head=T)

data<-data[,-2]
selected_countries <- rev(c("Libya", "Venezuela", "Egypt", "Iran", "Argentina", "Mexico"))

data$Entity <- factor(data$Entity, levels = selected_countries)

filtered_data <- data %>%
  filter(Entity %in% selected_countries)


ggplot(filtered_data, aes(x = Year, y = Number.of.people.without.access.to.electricity, fill = Entity)) +
  geom_bar(stat = "identity", position = "stack") +
  labs(title = "Number of People Without Access to Electricity Over Years",
       x = "Year",
       y = "Number of People without Access to Electricity") +
  theme_minimal()+
  theme(panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank()) +
  scale_x_continuous(breaks = seq(min(filtered_data$Year), max(filtered_data$Year), by = 2)) +
  scale_fill_viridis_d()
