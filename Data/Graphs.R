#Bar plot on deaths per state
byStates <- sort(table(data$state),  decreasing = TRUE)

barplot(byStates, horiz = FALSE, las=2, border=NA)

#Bar plot with top ten most deaths by state
barplot(byStates[0:10], horiz = FALSE, las=2, border=NA)

#Bar plot with top ten most deaths by city
byCity <- sort(table(data$city_or_county), decreasing = TRUE)

barplot(byCity[0:100], horiz = FALSE, las=2, border=NA)

#Prices Law? 10% of places == 50% of deaths, looks plausable
sum(byCity)
sum(byCity[0:100])

#lineplot with dates of shootings

