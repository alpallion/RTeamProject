#Bar plot on deaths per state
byState <- as.data.frame(sort(table(data$state),  decreasing = TRUE))
colnames(byState) <- c("state", "deaths")

ggplot(data = byState, aes(x = state, y = deaths)) + 
  geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1))

#Bar plot on top ten states by death
ggplot(data = head(byState, 10), aes(x = state, y = deaths)) + 
  geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1))

#Bar plot with top ten most deaths by city
byCity <- as.data.frame(sort(table(data$city_or_county), decreasing = TRUE))
colnames(byCity) <- c("city", "deaths")
ggplot(data = head(byCity, 60), aes(x = city, y = deaths)) + 
  geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1))

#Prices Law? 10% of places == 50% of deaths, looks plausable
length(byCity$city)
sum(byCity$deaths)

#histogram with dates of shootings
byDate <- as.data.frame(sort(table(data$date), decreasing = TRUE))
colnames(byDate) <- c("date", "deaths")

ggplot(data = byDate, aes(x = as.factor(date), y = deaths)) + 
  geom_point() + labs(x = "date (2013 - 2018)") + theme(axis.text.x=element_blank())

byRelationship <- as.data.frame(sort(table(data$participant_relationship), decreasing = TRUE))
colnames(byRelationship) <- c("Relationship", "Instances")

ggplot(data = byRelationship, aes(x = Relationship, y = Instances)) + 
  geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1))

sum(table(data$participant_relationship))

test <- data$participant_gender[4]
str_extract_all(test, "Male")