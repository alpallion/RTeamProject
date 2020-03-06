#This could take a couple of seconds to complete and could cause RStudio to hang
data <- read.csv(file = "DataSet.csv")

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
