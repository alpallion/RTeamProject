#This could take a couple of seconds to complete and could cause RStudio to hang
dataActual <- read.csv(file = "DataSet.csv")


data <- dataActual
#Deletes Columns which wont be used
data$incident_id <- NULL
data$address <- NULL
data$incident_url <- NULL
data$sources <- NULL
data$source_url <- NULL
data$incident_url_fields_missing <- NULL
data$location_description <- NULL
data$notes <- NULL
data$participant_name <- NULL
data$participant_age <- NULL
data$incident_characteristics<- NULL


#Removes extra fluf
data$participant_gender <-  str_replace_all(data$participant_gender ,"\\W", "")
data$participant_gender <-  str_replace_all(data$participant_gender ,"\\d", " ")

data$participant_age_group <-  str_replace_all(data$participant_age_group ,"\\W", "")
data$participant_age_group <-  str_replace_all(data$participant_age_group ,"\\d", " ")

data$gun_type <-  str_replace_all(data$gun_type ,"\\W", " ")

data$participant_type <-  str_replace_all(data$participant_type ,"\\W", "")
data$participant_type <-  str_replace_all(data$participant_type ,"\\d", " ")

data$participant_status <-  str_replace_all(data$participant_status ,"\\W", "")
data$participant_status <-  str_replace_all(data$participant_status ,"\\d", " ")

data$participant_relationship <-  str_extract(data$participant_relationship ,regex("([A-Z])\\w+"))

data$year <- substr(data$date, 1, 4)
data$month <- substr(data$date, 6, 7)



# Creates Data Frame to compare Cities/Counties and Instances



# Creates Data Frame to compare Male / Female per instance
s <- table(data$state)
s2 <- data.frame(x = s)
States <- data.frame(x = rep(s2$x.Var1,2))
MaleFemale <- data.frame(state = sort(States$x))

MaleFemale$gender <- "Male"

i<-1
while(i < 101){
  
  MaleFemale$gender[i] <- "Male" 
  MaleFemale$count[i] <- sum(str_count(data$participant_gender[which(data$state == MaleFemale$state[i])], "Male"))
  
  MaleFemale$gender[i+1] <- "Female" 
  MaleFemale$count[i+1] <- sum(str_count(data$participant_gender[which(data$state == MaleFemale$state[i])], "Female"))
  i <- i+2
}