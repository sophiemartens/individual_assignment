#read in the data and install necessary packages
conflict_mexico <- read.csv("conflict_mexico.csv", stringsAsFactors = F)
library(maps)
library(tidyverse)

#count how often violence occurs per year
occurences_per_year <- count(conflict_mexico, year)

#plot a graph
a <- ggplot()+geom_bar(data = occurences_per_year, mapping=aes(x=year, y=n), stat='identity', fill='red')+  
  xlab("Year") + ylab("Occurrences of violence per year") +
  labs(title= "Number of occurences of violence per year in Mexico")
a
#specify per type of violence
conflict_mexico$type_of_violence <- factor(conflict_mexico$type_of_violence)
b <- ggplot()+geom_bar(data = conflict_mexico, mapping=aes(x=year, fill=type_of_violence)) + 
  xlab("Year") + ylab("Occurrences of violence per year") +
  scale_fill_discrete(name="Type of violence", labels=c("State-based conflict", "Non-state conflict", "One-sided violence")) +
  labs(title = "Number of occurrences of violence per year", subtitle = "Specified by type of violence")
b
#how about the location of violence?
#plot mexico map
maps <- map_data('world')
Mexico <- maps %>%
     filter(region %in% c("Mexico"))
mexico_city <- conflict_mexico %>% filter(adm_1 %in% c("Distrito Federal"))
c <- ggplot() +
  geom_polygon(data = Mexico, aes(x=long, y=lat, group=group)) +
  coord_fixed(1) + 
  geom_point(data=mexico_city, mapping = aes(x=longitude, y=latitude, fill=where_coordinates), size=4, color="green") +
  geom_point(data=conflict_mexico, mapping = aes(x=longitude, y=latitude, color=), color='white', alpha=0.3) + 
  xlab("Longitude") + ylab("Latitude") +
  ggtitle("Violence in Mexico") +
  theme(legend.title = element_blank())
c

#2010 was the year with the most occurrences of violence, how is the distribution per state?

year_2010 <- conflict_mexico %>% filter(year == 2010)

c1 <- ggplot() +
  geom_polygon(data = Mexico, aes(x=long, y=lat, group=group)) +
  coord_fixed(1) + 
  geom_point(data=mexico_city, mapping = aes(x=longitude, y=latitude, fill=where_coordinates), size=4, color="green") +
  geom_point(data=year_2010, mapping = aes(x=longitude, y=latitude, color=), color='white') + 
  xlab("Longitude") + ylab("Latitude") +
  ggtitle("Violence in Mexico in 2010") +
  theme(legend.title = element_blank())
c1

d <- ggplot()+
  geom_bar(data = year_2010, mapping=aes(x=adm_1, fill=adm_1), na.rm=F)+
  coord_flip()+
  ggtitle("Occurrences of violence per state in 2010") + xlab("Count") + ylab("State") +
  scale_fill_discrete(name="State")
d
