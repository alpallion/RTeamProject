#This could take a couple of seconds to complete and could cause RStudio to hang
dataActual <- read.csv(file = "DataSet.csv")

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
dataActual <- data
data <- dataActual

#Removes extra fluf around participant relationships
data <- dataActual
data$participant_gender <-  str_replace_all(data$participant_gender ,"\\W", "")
data$participant_gender <-  str_replace_all(data$participant_gender ,"\\d", " ")

data$data$participant_age_group <-  str_replace_all(data$participant_age_group ,"\\W", "")
data$data$participant_age_group <-  str_replace_all(data$participant_age_group ,"\\d", " ")

data$participant_relationship <-  str_extract(data$participant_relationship ,regex("([A-Z])\\w+"))
