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



#PLOT2
library(dir2json)

dat <- tibble::tribble(
  ~level1, ~level2, ~level3, ~level4, ~value,
  "Beverages", "Water", "", "", 20,
  "Beverages", "Coffee", "", "", 15,
  "Beverages", "Tea", "Black tea", "", 10,
  "Beverages", "Tea", "White tea", "", 12,
  "Beverages", "Tea", "Green tea", "Sencha", 8,
  "Beverages", "Tea", "Green tea", "Gyokuro", 7,
  "Beverages", "Tea", "Green tea", "Matcha", 5,
  "Beverages", "Tea", "Green tea", "Pi Lo Chun", 6,
  "Snacks", "Chips", "Potato Chips", "Classic", 18,
  "Snacks", "Chips", "Potato Chips", "Barbecue", 14,
  "Snacks", "Chips", "Tortilla Chips", "", 16,
  "Snacks", "Chips", "Pita Chips", "", 10,
  "Snacks", "Nuts", "Almonds", "", 22,
  "Snacks", "Nuts", "Cashews", "", 17
)
shinyDataTree(dat, root = FALSE)

