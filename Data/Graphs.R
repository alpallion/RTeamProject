# Bar plot on Instances per state
byState <- as.data.frame(sort(table(data$state),  decreasing = TRUE))
colnames(byState) <- c("state", "instances")
byState$region <- tolower(byState$state)

ggplot(data = byState, aes(x = state, y = instances)) + 
  geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1))

# Map of US on Instances per State
us_map <- map_data("state")
us_map <- left_join(us_map, byState, by = "region")
ggplot(us_map) + geom_polygon(mapping = aes(x = long, y = lat, group = group, fill = instances)) +
  coord_quickmap() 

#Bar plot on top ten states by instances
ggplot(data = head(byState, 10), aes(x = state, y = instances)) + 
  geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1))

##################################################################################################

#Bar plot with top ten most instances by city
byCity <- as.data.frame(sort(table(data$city_or_county), decreasing = TRUE))
colnames(byCity) <- c("city", "instances")
ggplot(data = head(byCity, 60), aes(x = city, y = instances)) + 
  geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1))

#Prices Law? 10% of places == 50% of deaths, looks plausable
length(byCity$city)
sum(byCity$instances)

#histogram with dates of shootings
byDate <- as.data.frame(sort(table(data$date), decreasing = TRUE))
colnames(byDate) <- c("date", "instances")

ggplot(data = byDate, aes(x = as.factor(date), y = instances)) + 
  geom_point() + labs(x = "date (2013 - 2018)") + theme(axis.text.x=element_blank())

#plot looking at amount of deaths per year per instance
ggplot(data = data, aes(x = month, y = n_killed, color = year)) +  geom_boxplot()

#plot looking at amount of injures per year per instance
ggplot(data = data, aes(x = month, y = n_injured, color = year)) +  geom_boxplot()

#Bar Graph looking at the most common relationship between victiam and perpertrater per instances
byRelationship <- as.data.frame(sort(table(data$participant_relationship), decreasing = TRUE))
colnames(byRelationship) <- c("Relationship", "Instances")

ggplot(data = byRelationship, aes(x = Relationship, y = Instances)) + 
  geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1))


ggplot(data = MaleFemale, aes(x = state, y = count, fill = gender)) + 
  geom_bar(stat = "identity", position = "dodge") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

table(data$gun_type)

ggplot(data = data, aes(x = state, y = n_killed, fill = n_injured)) +
  geom_bar(stat = "identity", position = "dodge")  + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

ggplot(data = data, aes(x = state, y = n_injured)) +
  geom_bar(stat = "identity")  + theme(axis.text.x = element_text(angle = 90, hjust = 1))




